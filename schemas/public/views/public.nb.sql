--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: nb; Type: VIEW; Schema: public; Owner: pedro
--

CREATE VIEW nb AS
 SELECT nb.kod,
    nb.geom,
    so.hranice
   FROM (osmtables.neplatne_budovy nb
     LEFT JOIN ruian.rn_stavebni_objekt so ON ((nb.kod = so.kod)))
  WHERE (((NOT so.deleted) AND (nb.geom IS NOT NULL)) AND (so.hranice IS NOT NULL));


ALTER TABLE nb OWNER TO pedro;

--
-- Name: nb; Type: ACL; Schema: public; Owner: pedro
--

REVOKE ALL ON TABLE nb FROM PUBLIC;
REVOKE ALL ON TABLE nb FROM pedro;
GRANT ALL ON TABLE nb TO pedro;
GRANT SELECT ON TABLE nb TO PUBLIC;


--
-- PostgreSQL database dump complete
--

