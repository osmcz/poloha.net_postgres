--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = gis, pg_catalog;

--
-- Name: tile2bbox(integer, integer, integer); Type: FUNCTION; Schema: gis; Owner: pedro
--

CREATE FUNCTION tile2bbox(v_z integer, v_x integer, v_y integer) RETURNS public.geometry
    LANGUAGE plpgsql IMMUTABLE COST 20
    AS $$
declare
BEGIN

return  st_transform(st_makeenvelope(gis.tile2lon(v_x,v_z),gis.tile2lat(v_y + 1,v_z),gis.tile2lon(v_x + 1,v_z),gis.tile2lat(v_y,v_z),4326),900913);
  END;
$$;


ALTER FUNCTION gis.tile2bbox(v_z integer, v_x integer, v_y integer) OWNER TO pedro;

--
-- Name: tile2bbox(integer, integer, integer); Type: ACL; Schema: gis; Owner: pedro
--

REVOKE ALL ON FUNCTION tile2bbox(v_z integer, v_x integer, v_y integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION tile2bbox(v_z integer, v_x integer, v_y integer) FROM pedro;
GRANT ALL ON FUNCTION tile2bbox(v_z integer, v_x integer, v_y integer) TO pedro;
GRANT ALL ON FUNCTION tile2bbox(v_z integer, v_x integer, v_y integer) TO PUBLIC;


--
-- PostgreSQL database dump complete
--

