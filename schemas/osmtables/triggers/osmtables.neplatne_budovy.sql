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

SET search_path = osmtables, pg_catalog;

--
-- Name: neplatne_budovy update_building; Type: TRIGGER; Schema: osmtables; Owner: pedro
--

CREATE TRIGGER update_building AFTER INSERT OR DELETE OR UPDATE ON neplatne_budovy FOR EACH ROW EXECUTE PROCEDURE update_building();


--
-- Name: neplatne_budovy; Type: ACL; Schema: osmtables; Owner: pedro
--

GRANT SELECT ON TABLE neplatne_budovy TO PUBLIC;
GRANT ALL ON TABLE neplatne_budovy TO marian;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE neplatne_budovy TO hlasenibudov;


--
-- PostgreSQL database dump complete
--

