--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: local_reversegeocode(double precision, double precision); Type: FUNCTION; Schema: public; Owner: pedro
--

CREATE FUNCTION local_reversegeocode(lat double precision, lon double precision) RETURNS text
    LANGUAGE plpgsql SECURITY DEFINER
    AS $$
DECLARE
    maxrank integer;
    searchdiam double precision;
    pointsql geometry;
    result TEXT;
    x_place_id bigint;
    x_parent_place_id bigint;
    x_rank_search bigint;
    x_address_place_id bigint;
    maxareadistance double precision;
    begintime timestamp;
    endtime timestamp;
    tmp text[];
BEGIN
    set search_path to nominatim,public;
    select into begintime now();
    maxrank := 28;
    searchdiam := 0.0004;
    x_place_id := NULL;
    maxareadistance := 2;
    select into pointsql ST_SetSRID(ST_Point(lon,lat),4326);
    while x_place_id is NULL and searchdiam < maxareadistance loop
        searchdiam := searchdiam * 2;
	if searchdiam > 2 and maxrank > 4 then
	    maxrank := 4;
	end if;
        if searchdiam > 1 and maxrank > 9 then
	    maxrank := 8;
	end if;
        if searchdiam > 0.8 and maxrank > 10 then
	    maxrank := 10;
	end if;
        if searchdiam > 0.6 and maxrank > 12 then
	    maxrank := 12;
	end if;
        if searchdiam > 0.2 and maxrank > 17 then
	    maxrank := 17;
	end if;
        if searchdiam > 0.1 and maxrank > 18 then
	    maxrank := 18;
	end if;
        if searchdiam > 0.008 and maxrank > 22 then
	    maxrank := 22;
	end if;
        if searchdiam > 0.001 and maxrank > 26 then
	    maxrank := 26;
	end if;
	select into x_place_id place_id, x_parent_place_id parent_place_id, x_rank_search rank_search from nominatim.placex WHERE ST_DWithin(pointsql, geometry, searchdiam) and rank_search != 28 and rank_search >= maxrank and (name is not null or housenumber is not null) and class not in ('waterway','railway') and (ST_GeometryType(geometry) not in ('ST_Polygon','ST_MultiPolygon') and indexed_status = 0 OR ST_DWithin(pointsql, centroid, searchdiam))  ORDER BY ST_distance(pointsql, geometry) ASC limit 1;
    end loop;
    if x_place_id is not NULL and maxrank < 28 then
	if x_rank_search > 28 and x_parent_place_id is not NULL then
	    x_place_id := x_parent_place_id;
	end if;
	select into x_address_place_id address_place_id from nominatim.place_addressline where place_id = x_place_id order by abs(cached_rank_address - maxrank) asc,cached_rank_address desc,isaddress desc,distance desc limit 1;
	if x_address_place_id is not NULL then
	    x_place_id := x_address_place_id;
	end if;
    end if;
    select into tmp array_agg(localname) from 
	(select localname,max(rank_address) as rank_address  from 
	    (select localname,case when type = 'house_number' then 25 else max(rank_address) end as rank_address, isaddress, case when isaddress then 1 else 0 end as numisaddress from 
		(select get_name_by_language(name,ARRAY['short_name','name','place_name','official_name','ref','type']) as localname,rank_address,isaddress,type from nominatim.get_addressdata(x_place_id) WHERE isaddress OR type = 'country_code') as y 
	    where isaddress group by localname,type,isaddress) as y1 
	where isaddress group by localname order by rank_address desc) as foo;
    select into result array_to_string(tmp,',');
    select into endtime clock_timestamp();
    insert into nominatim.new_query_log (type,starttime,ipaddress,useragent,language,query,endtime,results,format,secret)
                values ('reverse',begintime,session_user || ' ' || inet_client_addr(),'PostgreSQL','cs','lat=' || lat::text || '&lon=' || lon::text,endtime,case when result is not NULL then 1 else 0 end,'txt',result);
    RETURN result;
END;
$$;


ALTER FUNCTION public.local_reversegeocode(lat double precision, lon double precision) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

