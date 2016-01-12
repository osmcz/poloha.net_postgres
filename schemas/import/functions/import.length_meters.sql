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
-- Name: length_meters(public.geometry); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION length_meters(geom_a public.geometry) RETURNS double precision
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
return st_length(st_transform(geom_a,4326)::geography);
END;
$$;


ALTER FUNCTION import.length_meters(geom_a public.geometry) OWNER TO import;

--
-- PostgreSQL database dump complete
--

