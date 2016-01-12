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
-- Name: delete_way; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_way BEFORE DELETE ON current_ways FOR EACH ROW EXECUTE PROCEDURE delete_ways();

ALTER TABLE current_ways DISABLE TRIGGER delete_way;


--
-- PostgreSQL database dump complete
--

