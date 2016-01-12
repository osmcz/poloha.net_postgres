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
-- Name: ulice; Type: VIEW; Schema: ruian; Owner: ruian
--

CREATE VIEW ulice AS
 SELECT rn_ulice.definicni_cara AS way,
    rn_ulice.nazev
   FROM rn_ulice
  WHERE (NOT rn_ulice.deleted);


ALTER TABLE ulice OWNER TO ruian;

--
-- Name: ulice; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE ulice FROM PUBLIC;
REVOKE ALL ON TABLE ulice FROM ruian;
GRANT ALL ON TABLE ulice TO ruian;
GRANT SELECT ON TABLE ulice TO PUBLIC;


--
-- PostgreSQL database dump complete
--

