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
-- Name: rozbite_definicni_bod; Type: VIEW; Schema: ruian; Owner: pedro
--

CREATE VIEW rozbite_definicni_bod AS
 SELECT rozbite_budovy.definicni_bod AS building
   FROM rozbite_budovy
  WHERE (rozbite_budovy.definicni_bod IS NOT NULL);


ALTER TABLE rozbite_definicni_bod OWNER TO pedro;

--
-- Name: rozbite_definicni_bod; Type: ACL; Schema: ruian; Owner: pedro
--

GRANT SELECT ON TABLE rozbite_definicni_bod TO PUBLIC;


--
-- PostgreSQL database dump complete
--

