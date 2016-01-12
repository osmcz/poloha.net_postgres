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
-- Name: modre_budovy; Type: VIEW; Schema: ruian; Owner: pedro
--

CREATE VIEW modre_budovy AS
 SELECT rn_stavebni_objekt.kod,
    rn_stavebni_objekt.hranice
   FROM rn_stavebni_objekt
  WHERE ((NOT rn_stavebni_objekt.deleted) AND (rn_stavebni_objekt.hranice IS NOT NULL));


ALTER TABLE modre_budovy OWNER TO pedro;

--
-- Name: modre_budovy; Type: ACL; Schema: ruian; Owner: pedro
--

REVOKE ALL ON TABLE modre_budovy FROM PUBLIC;
REVOKE ALL ON TABLE modre_budovy FROM pedro;
GRANT ALL ON TABLE modre_budovy TO pedro;
GRANT SELECT ON TABLE modre_budovy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

