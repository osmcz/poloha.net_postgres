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
-- Name: current_relations; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW current_relations AS
 SELECT current_relations.id,
    current_relations.changeset_id,
    current_relations."timestamp",
    current_relations.visible,
    current_relations.version
   FROM osm.current_relations;


ALTER TABLE current_relations OWNER TO pedro;

--
-- Name: current_relations; Type: ACL; Schema: osmexport; Owner: pedro
--

REVOKE ALL ON TABLE current_relations FROM PUBLIC;
REVOKE ALL ON TABLE current_relations FROM pedro;
GRANT ALL ON TABLE current_relations TO pedro;
GRANT SELECT ON TABLE current_relations TO osmexport;
GRANT SELECT ON TABLE current_relations TO PUBLIC;


--
-- PostgreSQL database dump complete
--

