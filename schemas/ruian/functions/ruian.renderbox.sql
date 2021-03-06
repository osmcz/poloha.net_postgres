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

SET search_path = ruian, pg_catalog;

--
-- Name: renderbox(public.geometry); Type: FUNCTION; Schema: ruian; Owner: pedro
--

CREATE FUNCTION renderbox(geom public.geometry) RETURNS text
    LANGUAGE plpgsql COST 1
    AS $$
DECLARE
--v_geom geometry;
r text;

BEGIN
--select into v_geom st_centroid(geom);
if geom is NULL then
	return NULL::text;
end if;
select into r (st_xmin(box2d(st_transform(geom,4326))))::text  || ',' || (st_ymin(box2d(st_transform(geom,4326))))::text || ',' || (st_xmax(box2d(st_transform(geom,4326))))::text  || ',' || (st_ymax(box2d(st_transform(geom,4326))))::text;
return r;
END;
$$;


ALTER FUNCTION ruian.renderbox(geom public.geometry) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

