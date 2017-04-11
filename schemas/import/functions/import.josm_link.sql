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

SET search_path = import, pg_catalog;

--
-- Name: josm_link(bigint); Type: FUNCTION; Schema: import; Owner: pgsnap
--

CREATE FUNCTION josm_link(local_kod bigint) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
v_geom geometry;
BEGIN
select into v_geom case when pargeom is not NULL then pargeom else ruiangeom end
from parovane_geom where kod=local_kod;
if v_geom is NULL then
	return NULL;
end if;
v_geom = st_centroid(v_geom);
return (((((('http://localhost:8111/zoom?left='::text || ((st_x(st_transform(v_geom, 4326)) - 0.0002::double precision)::text)) || '&right='::text) || ((st_x(st_transform(v_geom, 4326)) + 0.0002::double precision)::text)) || '&top='::text) || ((st_y(st_transform(v_geom, 4326)) + 0.0002::double precision)::text)) || '&bottom='::text) || ((st_y(st_transform(v_geom, 4326)) - 0.0002::double precision)::text);

END;
$$;


ALTER FUNCTION import.josm_link(local_kod bigint) OWNER TO pgsnap;

--
-- Name: josm_link(public.geometry); Type: FUNCTION; Schema: import; Owner: pedro
--

CREATE FUNCTION josm_link(v_geom public.geometry) RETURNS text
    LANGUAGE plpgsql
    AS $$
DECLARE
BEGIN
if v_geom is NULL then
	return NULL;
end if;
v_geom = st_centroid(v_geom);
return (((((('http://localhost:8111/zoom?left='::text || ((st_x(st_transform(v_geom, 4326)) - 0.01::double precision)::text)) || '&right='::text) || ((st_x(st_transform(v_geom, 4326)) + 0.01::double precision)::text)) || '&top='::text) || ((st_y(st_transform(v_geom, 4326)) + 0.01::double precision)::text)) || '&bottom='::text) || ((st_y(st_transform(v_geom, 4326)) - 0.01::double precision)::text);

END;
$$;


ALTER FUNCTION import.josm_link(v_geom public.geometry) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

