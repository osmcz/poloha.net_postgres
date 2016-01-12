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
-- Name: local_get_inner_rings(public.geometry, double precision); Type: FUNCTION; Schema: ruian; Owner: marian
--

CREATE FUNCTION local_get_inner_rings(public.geometry, double precision) RETURNS public.geometry[]
    LANGUAGE sql IMMUTABLE
    AS $_$
SELECT ARRAY(/* Get all inner rings > a particular area */
        SELECT ST_ExteriorRing(geom) AS inner_rings
          FROM ST_DumpRings($1)
          WHERE path[1] > 0 /* ie not the outer ring */
            AND ST_Area(geom) > $2
        ) AS final_geom
$_$;


ALTER FUNCTION ruian.local_get_inner_rings(public.geometry, double precision) OWNER TO marian;

--
-- PostgreSQL database dump complete
--

