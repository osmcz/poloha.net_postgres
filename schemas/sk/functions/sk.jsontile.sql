--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = sk, pg_catalog;

--
-- Name: jsontile(integer, integer, integer); Type: FUNCTION; Schema: sk; Owner: pedro
--

CREATE FUNCTION jsontile(v_z integer, v_x integer, v_y integer) RETURNS json
    LANGUAGE plpgsql COST 50
    AS $$
declare
v_bbox geometry;
v_minustags text[];
BEGIN
v_bbox = jsontiles.tile2bbox(v_z,v_x,v_y);
v_minustags = array(select k from osmtables.supplemental_tags);
if v_z <= 13 then
	return (
         SELECT json_build_object('type', 'FeatureCollection', 'features', json_agg(foo.json)) AS json_build_object
         FROM ( SELECT json_build_object('type', 'Feature', 'geometry', st_asgeojson(st_transform(gis.way, 4326),5,0)::json,
                       'properties', json_build_object('osm_type', 'node', 'osm_id', gis.osm_id, 'tags', hstore_to_json(hstore(nodes.tags)-v_minustags))) AS json
           FROM (select osm_id,way from sk.sk_point where place is not NULL and st_intersects(v_bbox,way)) gis
               LEFT JOIN sk.sk_nodes nodes ON nodes.id=gis.osm_id
	   where sk.isincluded(v_z::smallint,'node'::import.co,gis.osm_id::bigint)
           GROUP BY gis.osm_id, gis.way, nodes.tags
          ) foo
       );
else -- zoom >= 14
	return (
         SELECT json_build_object('type', 'FeatureCollection', 'features', json_agg(foo.json)) AS json_build_object
         FROM (
		 SELECT json_build_object('type', 'Feature',
		        'geometry', st_asgeojson(st_transform(gis.way, 4326),5,0)::json,
			'properties',
			json_build_object(
				'osm_type', 'node',
				'osm_id', gis.osm_id,
				'tags', hstore_to_json(hstore(nodes.tags)-v_minustags))
				) AS json
		   FROM sk.sk_point gis
			LEFT JOIN sk.sk_nodes nodes ON nodes.id=gis.osm_id
		   WHERE st_intersects(v_bbox,gis.way)
			 and sk.isincluded(v_z::smallint,'node'::import.co,gis.osm_id::bigint)
		   GROUP BY gis.osm_id, gis.way, nodes.tags

		UNION ALL

	 SELECT json_build_object('type', 'Feature',
		'geometry', st_asgeojson(st_transform(st_pointonsurface(gis.way), 4326),5,0)::json,
		'properties',
		json_build_object(
			'osm_type', case when gis.osm_id > 0 then 'way' else 'relation' end,
			'osm_id', abs(gis.osm_id),
			'tags', hstore_to_json(
				case when gis.osm_id > 0 then hstore(osm_ways.tags)-v_minustags else hstore(osm_rels.tags)-v_minustags end)
				)
			) AS json
	   FROM sk.sk_polygon gis
	       LEFT JOIN sk.sk_ways osm_ways ON gis.osm_id > 0
		 and gis.osm_id = osm_ways.id
	       LEFT JOIN sk.sk_rels osm_rels ON gis.osm_id < 0
		 and -gis.osm_id = osm_rels.id
	   WHERE st_intersects(v_bbox,gis.way) and st_intersects(v_bbox,st_pointonsurface(gis.way))
		 and sk.isincluded(v_z::smallint,case when gis.osm_id > 0 then 'way'::import.co else 'relation'::import.co end,abs(gis.osm_id)::bigint)
	   GROUP BY gis.osm_id, gis.way, osm_ways.tags, osm_rels.tags
          ) foo
       );
end if;
END;
$$;


ALTER FUNCTION sk.jsontile(v_z integer, v_x integer, v_y integer) OWNER TO pedro;

--
-- Name: jsontile(integer, integer, integer); Type: ACL; Schema: sk; Owner: pedro
--

REVOKE ALL ON FUNCTION jsontile(v_z integer, v_x integer, v_y integer) FROM PUBLIC;
REVOKE ALL ON FUNCTION jsontile(v_z integer, v_x integer, v_y integer) FROM pedro;
GRANT ALL ON FUNCTION jsontile(v_z integer, v_x integer, v_y integer) TO pedro;
GRANT ALL ON FUNCTION jsontile(v_z integer, v_x integer, v_y integer) TO PUBLIC;


--
-- PostgreSQL database dump complete
--

