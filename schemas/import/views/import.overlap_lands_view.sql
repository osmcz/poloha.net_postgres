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
-- Name: overlap_lands_view; Type: VIEW; Schema: import; Owner: pedro
--

CREATE VIEW overlap_lands_view AS
 SELECT tbl.a_osm_id,
    landuse_a.landuse AS a_landuse,
    tbl.a_prekryva,
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
            WHEN (a_ways_source.v IS NOT NULL) THEN a_ways_source.v
            ELSE a_rels_source.v
        END AS a_source,
        CASE
            WHEN (a_ways_ref.v IS NOT NULL) THEN a_ways_ref.v
            ELSE a_rels_ref.v
        END AS a_ref,
    tbl.b_osm_id,
    landuse_b.landuse AS b_landuse,
    tbl.b_prekryva,
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
            WHEN (b_ways_source.v IS NOT NULL) THEN b_ways_source.v
            ELSE b_rels_source.v
        END AS b_source,
        CASE
            WHEN (b_ways_ref.v IS NOT NULL) THEN b_ways_ref.v
            ELSE b_rels_ref.v
        END AS b_ref,
    tbl.procent
   FROM ((((((((((((((((((((((overlap_lands tbl
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
     LEFT JOIN osm.users b_rels_users ON ((b_rels_users.id = b_rels_changesets.user_id)))
     LEFT JOIN osm.current_way_tags a_ways_source ON (((a_ways_source.way_id = a_ways.id) AND ((a_ways_source.k)::text = 'source'::text))))
     LEFT JOIN osm.current_way_tags b_ways_source ON (((b_ways_source.way_id = b_ways.id) AND ((b_ways_source.k)::text = 'source'::text))))
     LEFT JOIN osm.current_relation_tags a_rels_source ON (((a_rels_source.relation_id = a_rels.id) AND ((a_rels_source.k)::text = 'source'::text))))
     LEFT JOIN osm.current_relation_tags b_rels_source ON (((b_rels_source.relation_id = b_rels.id) AND ((b_rels_source.k)::text = 'source'::text))))
     LEFT JOIN osm.current_way_tags a_ways_ref ON (((a_ways_ref.way_id = a_ways.id) AND ((a_ways_ref.k)::text = 'ref'::text))))
     LEFT JOIN osm.current_way_tags b_ways_ref ON (((b_ways_ref.way_id = b_ways.id) AND ((b_ways_ref.k)::text = 'ref'::text))))
     LEFT JOIN osm.current_relation_tags a_rels_ref ON (((a_rels_ref.relation_id = a_rels.id) AND ((a_rels_ref.k)::text = 'ref'::text))))
     LEFT JOIN osm.current_relation_tags b_rels_ref ON (((b_rels_ref.relation_id = b_rels.id) AND ((b_rels_ref.k)::text = 'ref'::text))))
     LEFT JOIN gis.cz_polygon landuse_a ON ((tbl.a_osm_id = landuse_a.osm_id)))
     LEFT JOIN gis.cz_polygon landuse_b ON ((tbl.b_osm_id = landuse_b.osm_id)));


ALTER TABLE overlap_lands_view OWNER TO pedro;

--
-- Name: overlap_lands_view; Type: ACL; Schema: import; Owner: pedro
--

GRANT SELECT ON TABLE overlap_lands_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

