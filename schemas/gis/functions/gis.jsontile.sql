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
-- Name: jsontile(integer, integer, integer); Type: FUNCTION; Schema: gis; Owner: pedro
--

CREATE FUNCTION jsontile(v_z integer, v_x integer, v_y integer) RETURNS json
    LANGUAGE plpgsql COST 50
    AS $$
declare
BEGIN
return (
	SELECT json_build_object('type', 'FeatureCollection', 'features', json_agg(foo.json)) AS json_build_object
	FROM ( SELECT json_build_object('osm_type', 'point', 'osm_id', gis.osm_id, 'geometry', st_asgeojson(st_transform(gis.way, 4326))::json, 'tags', json_object_agg(osm.k, osm.v)) AS json
           FROM gis.cz_point gis
             LEFT JOIN osm.current_node_tags osm ON gis.osm_id = osm.node_id and osm.k not in (select k from osmtables.supplemental_tags)
          WHERE st_intersects(gis.tile2bbox(v_z,v_x,v_y),gis.way) and import.isphysical('node',gis.osm_id)
          GROUP BY gis.osm_id, gis.way) foo);
  END;
$$;


ALTER FUNCTION gis.jsontile(v_z integer, v_x integer, v_y integer) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

