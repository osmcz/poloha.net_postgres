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
-- Name: current_node_tags delete_node_tags; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_node_tags BEFORE DELETE ON current_node_tags FOR EACH ROW EXECUTE PROCEDURE delete_node_tags();

ALTER TABLE current_node_tags DISABLE TRIGGER delete_node_tags;


--
-- Name: current_node_tags; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE current_node_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

