--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osm, pg_catalog;

--
-- Name: delete_node_tags; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_node_tags BEFORE DELETE ON current_node_tags FOR EACH ROW EXECUTE PROCEDURE delete_node_tags();

ALTER TABLE current_node_tags DISABLE TRIGGER delete_node_tags;


--
-- PostgreSQL database dump complete
--

