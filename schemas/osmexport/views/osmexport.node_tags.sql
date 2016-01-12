--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osmexport, pg_catalog;

--
-- Name: node_tags; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW node_tags AS
 SELECT current_node_tags.node_id,
    x.version,
    current_node_tags.k,
    current_node_tags.v
   FROM (osm.current_node_tags
     LEFT JOIN osm.current_nodes x ON ((x.id = current_node_tags.node_id)));


ALTER TABLE node_tags OWNER TO pedro;

--
-- Name: node_tags; Type: ACL; Schema: osmexport; Owner: pedro
--

REVOKE ALL ON TABLE node_tags FROM PUBLIC;
REVOKE ALL ON TABLE node_tags FROM pedro;
GRANT ALL ON TABLE node_tags TO pedro;
GRANT SELECT ON TABLE node_tags TO osmexport;
GRANT SELECT ON TABLE node_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

