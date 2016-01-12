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
-- Name: rozbite_spojnice; Type: VIEW; Schema: ruian; Owner: pedro
--

CREATE VIEW rozbite_spojnice AS
 SELECT rozbite_budovy.spojnice AS building
   FROM rozbite_budovy
  WHERE (rozbite_budovy.spojnice IS NOT NULL);


ALTER TABLE rozbite_spojnice OWNER TO pedro;

--
-- Name: rozbite_spojnice; Type: ACL; Schema: ruian; Owner: pedro
--

REVOKE ALL ON TABLE rozbite_spojnice FROM PUBLIC;
REVOKE ALL ON TABLE rozbite_spojnice FROM pedro;
GRANT ALL ON TABLE rozbite_spojnice TO pedro;
GRANT SELECT ON TABLE rozbite_spojnice TO PUBLIC;


--
-- PostgreSQL database dump complete
--

