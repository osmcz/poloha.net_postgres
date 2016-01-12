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
-- Name: morewarnings3(boolean); Type: FUNCTION; Schema: import; Owner: pedro
--

CREATE FUNCTION morewarnings3(update_mode boolean) RETURNS void
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
if v_rec.ulice_kod is not NULL and v_rec.id is NULL then
    select into v_ulicegeom definicni_cara from ruian.rn_ulice where kod = v_rec.ulice_kod;
    v_distance = distance_meters(v_rec.pargeom,v_ulicegeom);
    if v_distance > 100 or v_distance is NULL then
	insert into warn_ulice_distance (kod,distance,ulice) values(v_rec.kod,v_distance,v_rec.ulice);
    end if;
end if;
end loop;
close kurzor;
END;
$$;


ALTER FUNCTION import.morewarnings3(update_mode boolean) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

