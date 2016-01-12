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
-- Name: morewarnings(boolean); Type: FUNCTION; Schema: import; Owner: pedro
--

CREATE FUNCTION morewarnings(update_mode boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
kurzor cursor for select * from parovane_geom;
v_rec record;
v_osmid bigint;
v_distance real;
v_co import.co;
v_geom geometry;
v_ulicegeom geometry;
v_distance_inosm real;
v_go boolean;
BEGIN
if update_mode then
	v_distance_inosm = 1.5;
else
	v_distance_inosm = 25;
end if;
truncate morewarnings;
truncate warn_ulice_distance;
open kurzor;
loop
fetch kurzor into v_rec;
if not found then
    exit;
end if;
select into v_osmid,v_distance,v_co id,distance_meters(v_rec.ruiangeom,geom),co from 
	(
		(select id,geom,co from osm_adresy
			where co::text||id::text not in
			(select ruianid,geom,co from parovane_geom)
			 order by geom <-> v_rec.ruiangeom limit 20)
		union
		(select ruianid,geom,co from parovane_geom order by geom <-> v_rec.ruiangeom)
	) as foo
		where
			co::text||id::text not in (select co::text||id::text from morewarnings where id=foo.id)
			and
			co::text||id::text not in (select co::text||osmid::text from ruian_osm where osmid is not NULL and osmid=foo.id)
	order by st_distance(v_rec.ruiangeom,geom) limit 1;
v_go = true;
if update_mode then
	select into v_go v_co::text || v_osmid::text not in (select co::text || osmid::text from ruian_osm_delete where deleteit and osmid=v_osmid);
end if;
if v_distance < v_distance_inosm and v_go then
    insert into morewarnings(kod,id,distance,co) values (v_rec.kod,v_osmid,v_distance,v_co);
end if;
if v_rec.ulice_kod is not NULL and v_rec.id is NULL then
    if v_rec.osmgeom is not NULL then
        v_geom = v_rec.osmgeom;
    else
        v_geom = v_rec.ruiangeom;
    end if;
    select into v_ulicegeom definicni_cara from ruian.rn_ulice where kod = v_rec.ulice_kod;
    v_distance = distance_meters(v_geom,v_ulicegeom);
    if v_distance > 100 then
    insert into warn_ulice_distance (kod,distance,ulice) values(v_rec.kod,v_distance,v_rec.ulice);
    end if;
end if;
end loop;
-- delete from morewarnings where id in (select id from parovane_geom where id is not NULL and id=morewarnings.id);
close kurzor;
END;
$$;


ALTER FUNCTION import.morewarnings(update_mode boolean) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

