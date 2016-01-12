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
-- Name: delete_way_nodes; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_way_nodes BEFORE DELETE ON current_way_nodes FOR EACH ROW EXECUTE PROCEDURE delete_way_nodes();

ALTER TABLE current_way_nodes DISABLE TRIGGER delete_way_nodes;


--
-- PostgreSQL database dump complete
--

