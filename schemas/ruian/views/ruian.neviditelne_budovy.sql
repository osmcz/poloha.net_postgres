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
-- Name: neviditelne_budovy; Type: VIEW; Schema: ruian; Owner: ruian
--

CREATE VIEW neviditelne_budovy AS
 SELECT rn_stavebni_objekt.definicni_bod AS building
   FROM rn_stavebni_objekt
  WHERE ((NOT rn_stavebni_objekt.deleted) AND (rn_stavebni_objekt.hranice IS NULL) AND (rn_stavebni_objekt.definicni_bod IS NOT NULL));


ALTER TABLE neviditelne_budovy OWNER TO ruian;

--
-- Name: neviditelne_budovy; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE neviditelne_budovy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

