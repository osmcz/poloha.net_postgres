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
-- Name: tagy_view; Type: VIEW; Schema: import; Owner: import
--

CREATE VIEW tagy_view AS
 SELECT 'way'::text AS co,
    current_way_tags.way_id AS id,
    current_way_tags.k,
    current_way_tags.v
   FROM osm.current_way_tags
UNION
 SELECT 'node'::text AS co,
    current_node_tags.node_id AS id,
    current_node_tags.k,
    current_node_tags.v
   FROM osm.current_node_tags
UNION
 SELECT 'relation'::text AS co,
    current_relation_tags.relation_id AS id,
    current_relation_tags.k,
    current_relation_tags.v
   FROM osm.current_relation_tags;


ALTER TABLE tagy_view OWNER TO import;

--
-- Name: tagy_view; Type: ACL; Schema: import; Owner: import
--

REVOKE ALL ON TABLE tagy_view FROM PUBLIC;
REVOKE ALL ON TABLE tagy_view FROM import;
GRANT ALL ON TABLE tagy_view TO import;
GRANT SELECT ON TABLE tagy_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

