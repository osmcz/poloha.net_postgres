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
-- Name: current_way_nodes delete_way_nodes; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_way_nodes BEFORE DELETE ON current_way_nodes FOR EACH ROW EXECUTE PROCEDURE delete_way_nodes();

ALTER TABLE current_way_nodes DISABLE TRIGGER delete_way_nodes;


--
-- Name: current_way_nodes; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE current_way_nodes TO PUBLIC;


--
-- PostgreSQL database dump complete
--

