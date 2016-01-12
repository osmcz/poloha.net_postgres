--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ruian, pg_catalog;

--
-- Name: save_query; Type: TRIGGER; Schema: ruian; Owner: ruian
--

CREATE TRIGGER save_query BEFORE INSERT ON rn_zsj FOR EACH ROW EXECUTE PROCEDURE public.save_query();

ALTER TABLE rn_zsj DISABLE TRIGGER save_query;


--
-- PostgreSQL database dump complete
--

