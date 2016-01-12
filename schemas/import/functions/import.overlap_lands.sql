--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import, pg_catalog;

--
-- Name: overlap_lands(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION overlap_lands() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
v_cnt integer;
kursor5 cursor for select * from import.overlap_lands;
v_rec record;
v_geom geometry;
BEGIN
-- select into v_geom hranice from ruian.rn_obec where nazev='Jihlava';

drop table if exists temp_a;
drop table if exists temp_b;
create temp table temp_a as
	select osm_id,way from gis.cz_polygon
	where -- st_contains(v_geom,way) and 
	landuse is not NULL;
CREATE INDEX temp_a_index ON temp_a USING gist (way);
analyze temp_a;

create temp table temp_b as
select distinct on (import.max(a.osm_id,b.osm_id)::text,import.min(a.osm_id,b.osm_id)::text) a.osm_id as a_osm_id,b.osm_id as b_osm_id
from temp_a a
left join temp_a b on st_intersects(a.way,b.way)
where a.osm_id != b.osm_id;

truncate import.overlap_lands;
insert into import.overlap_lands (a_osm_id,b_osm_id,procent)
select tbl.*,st_area(st_intersection(a.way,b.way)) / import.max(st_area(a.way),st_area(b.way)) as procent
from temp_b tbl
left join temp_a a on a.osm_id=tbl.a_osm_id
left join temp_a b on b.osm_id=tbl.b_osm_id
where
st_area(st_intersection(a.way,b.way)) / import.max(st_area(a.way),st_area(b.way)) > 0.5;

drop table if exists temp_a;
drop table if exists temp_b;
open kursor5;
loop
fetch from kursor5 into v_rec;
if not found then
    exit;
end if;
select into v_geom way from gis.cz_polygon where osm_id=v_rec.a_osm_id;
select into v_cnt count(*) from gis.cz_polygon polygon where (st_overlaps(v_geom,way) or st_within(v_geom,way) or st_contains(v_geom,way)) and osm_id != v_rec.a_osm_id;
update import.overlap_lands set a_prekryva=v_cnt where a_osm_id = v_rec.a_osm_id;
select into v_geom way from gis.cz_polygon where osm_id=v_rec.b_osm_id;
select into v_cnt count(*) from gis.cz_polygon polygon where (st_overlaps(v_geom,way) or st_within(v_geom,way) or st_contains(v_geom,way)) and osm_id != v_rec.b_osm_id;
update import.overlap_lands set b_prekryva=v_cnt where b_osm_id = v_rec.b_osm_id;
end loop;
close kursor5;
return;
end;
$$;


ALTER FUNCTION import.overlap_lands() OWNER TO import;

--
-- PostgreSQL database dump complete
--

