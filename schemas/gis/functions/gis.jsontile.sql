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
v_bbox geometry;
BEGIN
v_bbox = gis.tile2bbox(v_z,v_x,v_y);
if v_z <= 13 then
	return (
         SELECT json_build_object('type', 'FeatureCollection', 'features', json_agg(foo.json)) AS json_build_object
         FROM ( SELECT json_build_object('type', 'Feature', 'geometry', st_asgeojson(st_transform(gis.way, 4326),5,0)::json,
                       'properties', json_build_object('osm_type', 'node', 'osm_id', gis.osm_id, 'tags', json_object_agg(osm.k, osm.v))) AS json
           FROM (select osm_id,way from gis.cz_point where place is not NULL and st_intersects(v_bbox,way)) gis
               LEFT JOIN osm.current_node_tags osm ON
                 gis.osm_id = osm.node_id and osm.k not in (select k from osmtables.supplemental_tags)
                 and osm.k not in (select k from osmtables.jsonobjects where flag='E' and v_z >= zoom_min and v_z <= zoom_max and v is NULL)
                 and osm.k || osm.v not in (select k || v from osmtables.jsonobjects where flag='E' and v_z >= zoom_min and v_z <= zoom_max)
	   where gis.isincluded(v_z::smallint,'node'::import.co,gis.osm_id::bigint)
           GROUP BY gis.osm_id, gis.way
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
				'tags', json_object_agg(osm.k, osm.v))
				) AS json
		   FROM gis.cz_point gis
		       LEFT JOIN osm.current_node_tags osm ON
			 gis.osm_id = osm.node_id and osm.k not in (select k from osmtables.supplemental_tags)
			 and osm.k not in (select k from osmtables.jsonobjects where flag='E' and v_z >= zoom_min and v_z <= zoom_max and v is NULL)
			 and osm.k || osm.v not in (select k || v from osmtables.jsonobjects where flag='E' and v_z >= zoom_min and v_z <= zoom_max)
		   WHERE st_intersects(v_bbox,gis.way)
			 and gis.isincluded(v_z::smallint,'node'::import.co,gis.osm_id::bigint)
		   GROUP BY gis.osm_id, gis.way

		UNION ALL

	 SELECT json_build_object('type', 'Feature',
		'geometry', st_asgeojson(st_transform(st_pointonsurface(gis.way), 4326),5,0)::json,
		'properties',
		json_build_object(
			'osm_type', case when gis.osm_id > 0 then 'way' else 'relation' end,
			'osm_id', abs(gis.osm_id),
			'tags', json_object_agg(
				case when gis.osm_id > 0 then osm_way.k else osm_rel.k end, case when gis.osm_id > 0 then osm_way.v else osm_rel.v end)
				)
			) AS json
	   FROM gis.cz_polygon gis
	       LEFT JOIN osm.current_way_tags osm_way ON gis.osm_id > 0
		 and gis.osm_id = osm_way.way_id and osm_way.k not in (select k from osmtables.supplemental_tags)
		 and osm_way.k not in (select k from osmtables.jsonobjects where flag='E' and v_z >= zoom_min and v_z <= zoom_max and v is NULL)
		 and osm_way.k || osm_way.v not in (select k || v from osmtables.jsonobjects where flag='E' and v_z >= zoom_min and v_z <= zoom_max)
	       LEFT JOIN osm.current_relation_tags osm_rel ON gis.osm_id < 0
		 and -gis.osm_id = osm_rel.relation_id and osm_rel.k not in (select k from osmtables.supplemental_tags)
		 and osm_rel.k not in (select k from osmtables.jsonobjects where flag='E' and v_z >= zoom_min and v_z <= zoom_max and v is NULL)
		 and osm_rel.k || osm_rel.v not in (select k || v from osmtables.jsonobjects where flag='E' and v_z >= zoom_min and v_z <= zoom_max)
	   WHERE st_intersects(v_bbox,gis.way) and st_intersects(v_bbox,st_pointonsurface(gis.way))
		 and gis.isincluded(v_z::smallint,case when gis.osm_id > 0 then 'way'::import.co else 'relation'::import.co end,abs(gis.osm_id)::bigint)
	   GROUP BY gis.osm_id, gis.way
          ) foo
       );
end if;
END;
$$;


ALTER FUNCTION gis.jsontile(v_z integer, v_x integer, v_y integer) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

