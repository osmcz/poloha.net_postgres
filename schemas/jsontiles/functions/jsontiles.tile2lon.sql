--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = jsontiles, pg_catalog;

--
-- Name: tile2lon(integer, integer); Type: FUNCTION; Schema: jsontiles; Owner: pedro
--

CREATE FUNCTION tile2lon(v_x integer, v_z integer) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE COST 1
    AS $$
declare
BEGIN
return v_x / pow(2,v_z) * 360.0 - 180;
  END;
$$;


ALTER FUNCTION jsontiles.tile2lon(v_x integer, v_z integer) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

