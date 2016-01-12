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
-- Name: reimport(integer); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION reimport(katuzid integer) RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$DECLARE
v_record record;
v_polygon geometry;
BEGIN
--truncate morewarnings;
--truncate warn_ulice_distance;

select into v_polygon hranice from ruian.rn_obec where kod=katuzid;

truncate ruian_osm_delete;
insert into ruian_osm_delete (co,osmid) select co,id from
	(select co,id,geom from osm_adresy where v_polygon && geom) as foo
	where st_contains(v_polygon,geom);

update ruian_osm set autocreate=true,level=0;
update ruian_osm_delete set deleteit=true;

raise notice 'Start analyze';
analyze ruian_osm;
analyze ruian_osm_delete;

raise notice 'Start opecuj_changeset';
select into v_record opecuj_changeset(true);


--raise notice 'Start morewarnings';
--select into v_record morewarnings(true);

raise notice 'Start morewarnings';
select into v_record morewarnings(true);
raise notice 'Start allwarnings';
select into v_record make_allwarnings(true);
raise notice 'Start make_changeset';
select into v_record make_changeset(true);
END;
$$;


ALTER FUNCTION import.reimport(katuzid integer) OWNER TO import;

--
-- PostgreSQL database dump complete
--

