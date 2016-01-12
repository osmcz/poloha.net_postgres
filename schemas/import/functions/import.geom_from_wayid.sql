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
-- Name: geom_from_wayid(bigint); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION geom_from_wayid(v_id bigint) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$
declare geom geometry;
BEGIN
select into geom st_makeline(nodes) from
	(
	select st_setsrid(st_makepoint(nodes.lon/100,nodes.lat/100),900913) nodes from
		(select unnest(nodes) nid from gis.cz_ways ways where ways.id=v_id) foo
	left join gis.cz_nodes nodes on nodes.id=nid
) foo;
return geom;
END;
$$;


ALTER FUNCTION import.geom_from_wayid(v_id bigint) OWNER TO import;

--
-- PostgreSQL database dump complete
--

