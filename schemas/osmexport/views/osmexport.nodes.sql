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
-- Name: nodes; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW nodes AS
 SELECT current_nodes.id AS node_id,
    current_nodes.latitude,
    current_nodes.longitude,
    current_nodes.changeset_id,
    current_nodes.visible,
    current_nodes."timestamp",
    current_nodes.tile,
    current_nodes.version
   FROM osm.current_nodes;


ALTER TABLE nodes OWNER TO pedro;

--
-- Name: nodes; Type: ACL; Schema: osmexport; Owner: pedro
--

GRANT SELECT ON TABLE nodes TO PUBLIC;
GRANT SELECT ON TABLE nodes TO osmexport;


--
-- PostgreSQL database dump complete
--

