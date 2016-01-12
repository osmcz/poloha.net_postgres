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

SET default_tablespace = '';

--
-- Name: rozbite_budovy_mview; Type: MATERIALIZED VIEW; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE MATERIALIZED VIEW rozbite_budovy_mview AS
 SELECT so.definicni_bod,
    so.hranice,
    public.st_makeline(so.definicni_bod, public.st_centroid(so.hranice)) AS spojnice,
    so.kod
   FROM rn_stavebni_objekt so
  WHERE (((NOT so.deleted) AND (so.hranice IS NOT NULL)) AND ((so.definicni_bod IS NULL) OR (import.distance_meters(so.definicni_bod, so.hranice) >= (10)::double precision)))
  WITH NO DATA;


ALTER TABLE rozbite_budovy_mview OWNER TO ruian;

--
-- Name: rozbite_budovy_mview; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rozbite_budovy_mview FROM PUBLIC;
REVOKE ALL ON TABLE rozbite_budovy_mview FROM ruian;
GRANT ALL ON TABLE rozbite_budovy_mview TO ruian;
GRANT SELECT ON TABLE rozbite_budovy_mview TO PUBLIC;


--
-- PostgreSQL database dump complete
--

