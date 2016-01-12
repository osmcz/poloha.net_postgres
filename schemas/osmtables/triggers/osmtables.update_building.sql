--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osmtables, pg_catalog;

--
-- Name: update_building; Type: TRIGGER; Schema: osmtables; Owner: pedro
--

CREATE TRIGGER update_building AFTER INSERT OR DELETE OR UPDATE ON neplatne_budovy FOR EACH ROW EXECUTE PROCEDURE update_building();


--
-- PostgreSQL database dump complete
--

