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
-- Name: budovy; Type: VIEW; Schema: ruian; Owner: pedro
--

CREATE VIEW budovy AS
 SELECT so.hranice AS building,
    neplatne.duvod
   FROM (rn_stavebni_objekt so
     LEFT JOIN osmtables.neplatne_budovy neplatne ON ((so.kod = neplatne.kod)))
  WHERE ((((NOT so.deleted) AND (so.hranice IS NOT NULL)) AND (so.definicni_bod IS NOT NULL)) AND (import.distance_meters(so.definicni_bod, so.hranice) < (10)::double precision));


ALTER TABLE budovy OWNER TO pedro;

--
-- Name: budovy; Type: ACL; Schema: ruian; Owner: pedro
--

REVOKE ALL ON TABLE budovy FROM PUBLIC;
REVOKE ALL ON TABLE budovy FROM pedro;
GRANT ALL ON TABLE budovy TO pedro;
GRANT SELECT ON TABLE budovy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

