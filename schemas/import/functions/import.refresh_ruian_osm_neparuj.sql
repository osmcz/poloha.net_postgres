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
-- Name: refresh_ruian_osm_neparuj(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION refresh_ruian_osm_neparuj() RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$DECLARE
v_oldrecord record;
v_record record;
BEGIN
update ruian_osm set osmid = NULL,level = NULL,co=NULL;
raise notice 'Start analyze';
analyze ruian_osm;

raise notice 'Start opecuj_changeset';
select into v_record opecuj_changeset();
raise notice 'Start morewarnings';
select into v_record morewarnings();
raise notice 'Start allwarnings';
select into v_record make_allwarnings();
raise notice 'Start make_changeset';
select into v_record make_changeset();
END;
$$;


ALTER FUNCTION import.refresh_ruian_osm_neparuj() OWNER TO import;

--
-- PostgreSQL database dump complete
--

