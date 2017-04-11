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
-- Name: relations; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW relations AS
 SELECT current_relations.id AS relation_id,
    current_relations.changeset_id,
    current_relations."timestamp",
    current_relations.visible,
    current_relations.version
   FROM osm.current_relations;


ALTER TABLE relations OWNER TO pedro;

--
-- Name: relations; Type: ACL; Schema: osmexport; Owner: pedro
--

GRANT SELECT ON TABLE relations TO PUBLIC;
GRANT SELECT ON TABLE relations TO osmexport;


--
-- PostgreSQL database dump complete
--

