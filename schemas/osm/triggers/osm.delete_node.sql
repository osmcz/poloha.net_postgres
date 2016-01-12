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
-- Name: delete_node; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_node BEFORE DELETE ON current_nodes FOR EACH ROW EXECUTE PROCEDURE delete_nodes();

ALTER TABLE current_nodes DISABLE TRIGGER delete_node;


--
-- PostgreSQL database dump complete
--

