--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = import, pg_catalog;

--
-- Name: crossbuildings(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION crossbuildings() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
v_rec record;
v_geom geometry;
BEGIN
select into v_geom hranice from ruian.rn_obec where nazev='Jihlava';

drop table if exists temp_a;
create temp table temp_a as
	select osm_id,case when layer is NULL then '0' else layer end as layer,way from gis.cz_polygon
	where -- st_contains(v_geom,way) and 
	building is not NULL and building != 'no';
CREATE INDEX temp_a_index ON temp_a USING gist (way);
analyze temp_a;
truncate import.crossbuildings;
insert into import.crossbuildings
(select distinct on (a.osm_id) a.osm_id
from temp_a a
    left join temp_a b on
    (st_intersects(a.way,b.way) and (st_area(st_intersection(a.way,b.way))) > 10) or st_equals(a.way,b.way)
    where a.osm_id != b.osm_id and a.layer = b.layer);
drop table if exists temp_a;
return;
end;
$$;


ALTER FUNCTION import.crossbuildings() OWNER TO import;

--
-- PostgreSQL database dump complete
--

