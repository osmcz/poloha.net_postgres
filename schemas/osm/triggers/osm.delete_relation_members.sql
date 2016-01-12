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
-- Name: delete_relation_members; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_relation_members BEFORE DELETE ON current_relation_members FOR EACH ROW EXECUTE PROCEDURE delete_relation_members();

ALTER TABLE current_relation_members DISABLE TRIGGER delete_relation_members;


--
-- PostgreSQL database dump complete
--

