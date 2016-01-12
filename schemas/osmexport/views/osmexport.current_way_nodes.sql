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
-- Name: current_way_nodes; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW current_way_nodes AS
 SELECT current_way_nodes.way_id,
    current_way_nodes.node_id,
    current_way_nodes.sequence_id
   FROM osm.current_way_nodes;


ALTER TABLE current_way_nodes OWNER TO pedro;

--
-- Name: current_way_nodes; Type: ACL; Schema: osmexport; Owner: pedro
--

REVOKE ALL ON TABLE current_way_nodes FROM PUBLIC;
REVOKE ALL ON TABLE current_way_nodes FROM pedro;
GRANT ALL ON TABLE current_way_nodes TO pedro;
GRANT SELECT ON TABLE current_way_nodes TO osmexport;
GRANT SELECT ON TABLE current_way_nodes TO PUBLIC;


--
-- PostgreSQL database dump complete
--

