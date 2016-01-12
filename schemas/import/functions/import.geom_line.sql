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
-- Name: geom_line(bigint); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION geom_line(id bigint) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$DECLARE
cesta geometry;
BEGIN
select into cesta st_union(way) from (
select way from gis.cz_line where way is not NULL and osm_id in 
	(select -relation_id from osm.current_relation_members where member_id=id and member_type='Way')
union
select way from gis.cz_polygon where way is not NULL and osm_id in 
	(select -relation_id from osm.current_relation_members where member_id=id and member_type='Way')) as foo;
return cesta;
END;
$$;


ALTER FUNCTION import.geom_line(id bigint) OWNER TO import;

--
-- Name: geom_line(bigint); Type: ACL; Schema: import; Owner: import
--

REVOKE ALL ON FUNCTION geom_line(id bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION geom_line(id bigint) FROM import;
GRANT ALL ON FUNCTION geom_line(id bigint) TO import;
GRANT ALL ON FUNCTION geom_line(id bigint) TO PUBLIC;
GRANT ALL ON FUNCTION geom_line(id bigint) TO studanky;


--
-- PostgreSQL database dump complete
--

