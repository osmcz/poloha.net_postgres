--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: local_gis_height_old(double precision, double precision); Type: FUNCTION; Schema: public; Owner: pedro
--

CREATE FUNCTION local_gis_height_old(long double precision, lat double precision) RETURNS integer
    LANGUAGE sql STRICT
    AS $_$
select height::integer from (select height,st_distance(st_setsrid(st_makepoint($1, $2),900913),ST_SetSRID(gis.cz_contours.way,900913)) as distance from gis.cz_contours   order by distance asc limit 1) as foo where distance < 0.1 order by distance limit 1;

$_$;


ALTER FUNCTION public.local_gis_height_old(long double precision, lat double precision) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

