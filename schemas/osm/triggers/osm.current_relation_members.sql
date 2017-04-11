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

SET search_path = osm, pg_catalog;

--
-- Name: current_relation_members delete_relation_members; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_relation_members BEFORE DELETE ON current_relation_members FOR EACH ROW EXECUTE PROCEDURE delete_relation_members();

ALTER TABLE current_relation_members DISABLE TRIGGER delete_relation_members;


--
-- Name: current_relation_members; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE current_relation_members TO PUBLIC;


--
-- PostgreSQL database dump complete
--

