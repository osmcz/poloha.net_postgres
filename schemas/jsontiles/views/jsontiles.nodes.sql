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
-- Name: nodes; Type: VIEW; Schema: jsontiles; Owner: pedro
--

CREATE VIEW nodes AS
 SELECT cz_nodes.id,
    cz_nodes.tags
   FROM gis.cz_nodes;


ALTER TABLE nodes OWNER TO pedro;

--
-- Name: nodes; Type: ACL; Schema: jsontiles; Owner: pedro
--

REVOKE ALL ON TABLE nodes FROM PUBLIC;
REVOKE ALL ON TABLE nodes FROM pedro;
GRANT ALL ON TABLE nodes TO pedro;
GRANT SELECT ON TABLE nodes TO PUBLIC;


--
-- PostgreSQL database dump complete
--

