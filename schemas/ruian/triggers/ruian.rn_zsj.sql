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

SET search_path = ruian, pg_catalog;

--
-- Name: rn_zsj save_query; Type: TRIGGER; Schema: ruian; Owner: ruian
--

CREATE TRIGGER save_query BEFORE INSERT ON rn_zsj FOR EACH ROW EXECUTE PROCEDURE public.save_query();

ALTER TABLE rn_zsj DISABLE TRIGGER save_query;


--
-- Name: rn_zsj; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE rn_zsj TO PUBLIC;


--
-- PostgreSQL database dump complete
--

