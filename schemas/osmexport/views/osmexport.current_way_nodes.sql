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

GRANT SELECT ON TABLE current_way_nodes TO PUBLIC;
GRANT SELECT ON TABLE current_way_nodes TO osmexport;


--
-- PostgreSQL database dump complete
--

