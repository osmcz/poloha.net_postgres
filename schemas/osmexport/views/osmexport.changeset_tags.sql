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
-- Name: changeset_tags; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW changeset_tags AS
 SELECT changeset_tags.changeset_id,
    changeset_tags.k,
    changeset_tags.v
   FROM osm.changeset_tags;


ALTER TABLE changeset_tags OWNER TO pedro;

--
-- Name: changeset_tags; Type: ACL; Schema: osmexport; Owner: pedro
--

REVOKE ALL ON TABLE changeset_tags FROM PUBLIC;
REVOKE ALL ON TABLE changeset_tags FROM pedro;
GRANT ALL ON TABLE changeset_tags TO pedro;
GRANT SELECT ON TABLE changeset_tags TO osmexport;
GRANT SELECT ON TABLE changeset_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

