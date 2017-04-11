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
-- Name: geom_point(bigint); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION geom_point(id bigint) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$
DECLARE
cesta geometry;
BEGIN
select into cesta st_union(way) from gis.cz_point where way is not NULL and osm_id in 
	(select -relation_id from osm.current_relation_members where member_id=id and member_type='Node');
return cesta;
END;
$$;


ALTER FUNCTION import.geom_point(id bigint) OWNER TO import;

--
-- Name: geom_point(bigint); Type: ACL; Schema: import; Owner: import
--

GRANT ALL ON FUNCTION geom_point(id bigint) TO studanky;


--
-- PostgreSQL database dump complete
--

