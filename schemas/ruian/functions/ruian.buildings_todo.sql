--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ruian, pg_catalog;

--
-- Name: buildings_todo(); Type: FUNCTION; Schema: ruian; Owner: pedro
--

CREATE FUNCTION buildings_todo() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
set work_mem='128MB';
drop table if exists temp_a;
drop table if exists temp_ruian;
drop table if exists temp_osm;
create temp table temp_ruian as select kod,hranice from ruian.rn_stavebni_objekt where hranice is not NULL and not deleted;
create temp table temp_osm as select osm_id,way from gis.cz_polygon where building is not NULL and building != 'no';
create index temp_osm_index on temp_osm using gist(way);
analyze temp_ruian;
analyze temp_osm;
create temp table temp_a as
select kod
from temp_ruian ruian
left join temp_osm osm on st_intersects(ruian.hranice, osm.way)
group by kod
having 
case
	when max(osm.osm_id) is NULL then true
	else sum(st_area(st_intersection(ruian.hranice, osm.way))/st_area(ruian.hranice)) < 0.7
end;
truncate ruian.buildings_todo;
insert into ruian.buildings_todo(kod) select kod from temp_a;
drop table if exists temp_a;
drop table if exists temp_ruian;
drop table if exists temp_osm;
analyze ruian.buildings_todo;
refresh materialized view import.mapovat_budovy;
truncate poloha.mapovat_budovy;
insert into poloha.mapovat_budovy (select * from import.mapovat_budovy_view);
update import.datatimestamp set buildings_todo=now();
END;
$$;


ALTER FUNCTION ruian.buildings_todo() OWNER TO pedro;

--
-- Name: buildings_todo(); Type: ACL; Schema: ruian; Owner: pedro
--

REVOKE ALL ON FUNCTION buildings_todo() FROM PUBLIC;
REVOKE ALL ON FUNCTION buildings_todo() FROM pedro;
GRANT ALL ON FUNCTION buildings_todo() TO pedro;
GRANT ALL ON FUNCTION buildings_todo() TO mapnik;


--
-- PostgreSQL database dump complete
--

