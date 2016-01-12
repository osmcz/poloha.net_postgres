--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osmexport, pg_catalog;

--
-- Name: relation_tags; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW relation_tags AS
 SELECT current_relation_tags.relation_id,
    x.version,
    current_relation_tags.k,
    current_relation_tags.v
   FROM (osm.current_relation_tags
     LEFT JOIN osm.current_relations x ON ((x.id = current_relation_tags.relation_id)));


ALTER TABLE relation_tags OWNER TO pedro;

--
-- Name: relation_tags; Type: ACL; Schema: osmexport; Owner: pedro
--

REVOKE ALL ON TABLE relation_tags FROM PUBLIC;
REVOKE ALL ON TABLE relation_tags FROM pedro;
GRANT ALL ON TABLE relation_tags TO pedro;
GRANT SELECT ON TABLE relation_tags TO osmexport;
GRANT SELECT ON TABLE relation_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

