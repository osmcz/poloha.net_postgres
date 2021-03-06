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
-- Name: local_filter_rings(public.geometry); Type: FUNCTION; Schema: ruian; Owner: marian
--

CREATE FUNCTION local_filter_rings(public.geometry) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE
    AS $_$ SELECT ST_BuildArea(ST_Collect(a.geom)) AS final_geom
        FROM ST_DumpRings($1) AS a
          WHERE a.path[2] > 0
$_$;


ALTER FUNCTION ruian.local_filter_rings(public.geometry) OWNER TO marian;

--
-- Name: local_filter_rings(public.geometry, double precision); Type: FUNCTION; Schema: ruian; Owner: marian
--

CREATE FUNCTION local_filter_rings(public.geometry, double precision) RETURNS public.geometry
    LANGUAGE sql IMMUTABLE
    AS $_$
SELECT ST_MakePolygon((/* Get outer ring of polygon */
        SELECT ST_ExteriorRing(geom) AS outer_ring
          FROM ST_DumpRings($1)
          WHERE path[1] = 0 /* ie the outer ring */
        ),  ARRAY(/* Get all inner rings > a particular area */
        SELECT ST_ExteriorRing(geom) AS inner_rings
          FROM ST_DumpRings($1)
          WHERE path[1] > 0 /* ie not the outer ring */
            AND ST_Area(geom) > $2
        ) ) AS final_geom
$_$;


ALTER FUNCTION ruian.local_filter_rings(public.geometry, double precision) OWNER TO marian;

--
-- PostgreSQL database dump complete
--

