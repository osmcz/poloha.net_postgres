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
-- Name: geom_rel(bigint); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION geom_rel(id bigint) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$DECLARE
cesta geometry;
BEGIN
select into cesta st_union(way) from (

select way from gis.cz_line where way is not NULL and osm_id in 
	(select member_id from osm.current_relation_members where relation_id=id and member_type='Way')
union
select way from gis.cz_polygon where way is not NULL and osm_id in 
	(select member_id from osm.current_relation_members where relation_id=id and member_type='Way')
union
select way from gis.cz_point where way is not NULL and osm_id in 
	(select member_id from osm.current_relation_members where relation_id=id and member_type='Node')
union
select way from gis.cz_line where way is not NULL and osm_id = -id
union
select way from gis.cz_polygon where way is not NULL and osm_id = -id
) as foo;
return cesta;
END;
$$;


ALTER FUNCTION import.geom_rel(id bigint) OWNER TO import;

--
-- Name: geom_rel(bigint); Type: ACL; Schema: import; Owner: import
--

GRANT ALL ON FUNCTION geom_rel(id bigint) TO studanky;


--
-- PostgreSQL database dump complete
--

