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
-- Name: inprogress_changeset refresh_stats; Type: TRIGGER; Schema: osmtables; Owner: pedro
--

CREATE TRIGGER refresh_stats AFTER INSERT OR DELETE OR UPDATE ON inprogress_changeset FOR EACH STATEMENT EXECUTE PROCEDURE import.update_stats();

ALTER TABLE inprogress_changeset DISABLE TRIGGER refresh_stats;


--
-- Name: inprogress_changeset; Type: ACL; Schema: osmtables; Owner: pedro
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE inprogress_changeset TO import;
GRANT SELECT ON TABLE inprogress_changeset TO PUBLIC;


--
-- PostgreSQL database dump complete
--

