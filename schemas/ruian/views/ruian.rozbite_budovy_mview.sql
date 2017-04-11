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

SET default_tablespace = '';

--
-- Name: rozbite_budovy_mview; Type: MATERIALIZED VIEW; Schema: ruian; Owner: ruian
--

CREATE MATERIALIZED VIEW rozbite_budovy_mview AS
 SELECT so.definicni_bod,
    so.hranice,
    public.st_makeline(so.definicni_bod, public.st_centroid(so.hranice)) AS spojnice,
    so.kod
   FROM rn_stavebni_objekt so
  WHERE ((NOT so.deleted) AND (so.hranice IS NOT NULL) AND ((so.definicni_bod IS NULL) OR (import.distance_meters(so.definicni_bod, so.hranice) >= (10)::double precision)))
  WITH NO DATA;


ALTER TABLE rozbite_budovy_mview OWNER TO ruian;

--
-- Name: rozbite_budovy_mview; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE rozbite_budovy_mview TO PUBLIC;


--
-- PostgreSQL database dump complete
--

