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
-- Name: overlap_buildings_view; Type: VIEW; Schema: import; Owner: pedro
--

CREATE VIEW overlap_buildings_view AS
 SELECT tbl.a_osm_id,
    tbl.a_prekryva_budov,
        CASE
            WHEN (tbl.a_osm_id > 0) THEN a_ways.version
            ELSE a_rels.version
        END AS a_version,
        CASE
            WHEN (tbl.a_osm_id > 0) THEN a_ways."timestamp"
            ELSE a_rels."timestamp"
        END AS a_timestamp,
        CASE
            WHEN (tbl.a_osm_id > 0) THEN a_ways_users.display_name
            ELSE a_rels_users.display_name
        END AS a_nick,
        CASE
            WHEN (tbl.a_osm_id > 0) THEN (tbl.a_osm_id IN ( SELECT current_way_tags.way_id
               FROM osm.current_way_tags
              WHERE ((((((current_way_tags.k)::text = 'building:part'::text) OR ((current_way_tags.k)::text = 'min_height'::text)) OR ((current_way_tags.k)::text = 'height'::text)) OR ((current_way_tags.k)::text = 'building:min_level'::text)) AND (current_way_tags.way_id = tbl.a_osm_id))))
            ELSE ((- tbl.a_osm_id) IN ( SELECT current_relation_tags.relation_id
               FROM osm.current_relation_tags
              WHERE ((((((current_relation_tags.k)::text = 'building:part'::text) OR ((current_relation_tags.k)::text = 'min_height'::text)) OR ((current_relation_tags.k)::text = 'height'::text)) OR ((current_relation_tags.k)::text = 'building:min_level'::text)) AND (current_relation_tags.relation_id = (- tbl.a_osm_id)))))
        END AS a_in3d,
    tbl.b_osm_id,
    tbl.b_prekryva_budov,
        CASE
            WHEN (tbl.b_osm_id > 0) THEN b_ways.version
            ELSE b_rels.version
        END AS b_version,
        CASE
            WHEN (tbl.b_osm_id > 0) THEN b_ways."timestamp"
            ELSE b_rels."timestamp"
        END AS b_timestamp,
        CASE
            WHEN (tbl.b_osm_id > 0) THEN b_ways_users.display_name
            ELSE b_rels_users.display_name
        END AS b_nick,
        CASE
            WHEN (tbl.b_osm_id > 0) THEN (tbl.b_osm_id IN ( SELECT current_way_tags.way_id
               FROM osm.current_way_tags
              WHERE ((((((current_way_tags.k)::text = 'building:part'::text) OR ((current_way_tags.k)::text = 'min_height'::text)) OR ((current_way_tags.k)::text = 'height'::text)) OR ((current_way_tags.k)::text = 'building:min_level'::text)) AND (current_way_tags.way_id = tbl.b_osm_id))))
            ELSE ((- tbl.b_osm_id) IN ( SELECT current_relation_tags.relation_id
               FROM osm.current_relation_tags
              WHERE ((((((current_relation_tags.k)::text = 'building:part'::text) OR ((current_relation_tags.k)::text = 'min_height'::text)) OR ((current_relation_tags.k)::text = 'height'::text)) OR ((current_relation_tags.k)::text = 'building:min_level'::text)) AND (current_relation_tags.relation_id = (- tbl.b_osm_id)))))
        END AS b_in3d,
    tbl.procent
   FROM ((((((((((((overlap_buildings tbl
     LEFT JOIN osm.current_ways a_ways ON (((tbl.a_osm_id = a_ways.id) AND (tbl.a_osm_id > 0))))
     LEFT JOIN osm.current_ways b_ways ON (((tbl.b_osm_id = b_ways.id) AND (tbl.b_osm_id > 0))))
     LEFT JOIN osm.current_relations a_rels ON (((tbl.a_osm_id = (- a_rels.id)) AND (tbl.a_osm_id < 0))))
     LEFT JOIN osm.current_relations b_rels ON (((tbl.b_osm_id = (- b_rels.id)) AND (tbl.b_osm_id < 0))))
     LEFT JOIN osm.changesets a_ways_changesets ON (((a_ways.changeset_id = a_ways_changesets.id) AND (tbl.a_osm_id > 0))))
     LEFT JOIN osm.changesets b_ways_changesets ON (((b_ways.changeset_id = b_ways_changesets.id) AND (tbl.b_osm_id > 0))))
     LEFT JOIN osm.changesets a_rels_changesets ON (((a_rels.changeset_id = a_rels_changesets.id) AND (tbl.a_osm_id < 0))))
     LEFT JOIN osm.changesets b_rels_changesets ON (((b_rels.changeset_id = b_rels_changesets.id) AND (tbl.b_osm_id < 0))))
     LEFT JOIN osm.users a_ways_users ON ((a_ways_users.id = a_ways_changesets.user_id)))
     LEFT JOIN osm.users b_ways_users ON ((b_ways_users.id = b_ways_changesets.user_id)))
     LEFT JOIN osm.users a_rels_users ON ((a_rels_users.id = a_rels_changesets.user_id)))
     LEFT JOIN osm.users b_rels_users ON ((b_rels_users.id = b_rels_changesets.user_id)));


ALTER TABLE overlap_buildings_view OWNER TO pedro;

--
-- Name: overlap_buildings_view; Type: ACL; Schema: import; Owner: pedro
--

REVOKE ALL ON TABLE overlap_buildings_view FROM PUBLIC;
REVOKE ALL ON TABLE overlap_buildings_view FROM pedro;
GRANT ALL ON TABLE overlap_buildings_view TO pedro;
GRANT SELECT ON TABLE overlap_buildings_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

