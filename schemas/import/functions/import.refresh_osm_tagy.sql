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
-- Name: refresh_osm_tagy(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION refresh_osm_tagy() RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
truncate import.osm_tagy;
insert into import.osm_tagy (count,k,v) 
select count(*),k,v from import.tagy_view group by k,v order by k,v;
analyze import.osm_tagy;
END;
$$;


ALTER FUNCTION import.refresh_osm_tagy() OWNER TO import;

--
-- PostgreSQL database dump complete
--

