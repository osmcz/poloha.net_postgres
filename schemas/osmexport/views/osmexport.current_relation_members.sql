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
-- Name: current_relation_members; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW current_relation_members AS
 SELECT current_relation_members.relation_id,
    current_relation_members.member_type,
    current_relation_members.member_id,
    current_relation_members.member_role,
    current_relation_members.sequence_id
   FROM osm.current_relation_members;


ALTER TABLE current_relation_members OWNER TO pedro;

--
-- Name: current_relation_members; Type: ACL; Schema: osmexport; Owner: pedro
--

GRANT SELECT ON TABLE current_relation_members TO PUBLIC;
GRANT SELECT ON TABLE current_relation_members TO osmexport;


--
-- PostgreSQL database dump complete
--

