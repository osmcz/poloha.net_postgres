--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = jsontiles, pg_catalog;

--
-- Name: rels; Type: VIEW; Schema: jsontiles; Owner: pedro
--

CREATE VIEW rels AS
 SELECT cz_rels.id,
    cz_rels.tags
   FROM gis.cz_rels;


ALTER TABLE rels OWNER TO pedro;

--
-- Name: rels; Type: ACL; Schema: jsontiles; Owner: pedro
--

REVOKE ALL ON TABLE rels FROM PUBLIC;
REVOKE ALL ON TABLE rels FROM pedro;
GRANT ALL ON TABLE rels TO pedro;
GRANT SELECT ON TABLE rels TO PUBLIC;


--
-- PostgreSQL database dump complete
--

