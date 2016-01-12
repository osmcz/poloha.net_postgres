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
-- Name: changesets; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW changesets AS
 SELECT changesets.id,
    changesets.user_id,
    changesets.created_at,
    changesets.min_lat,
    changesets.max_lat,
    changesets.min_lon,
    changesets.max_lon,
    changesets.closed_at,
    changesets.num_changes
   FROM osm.changesets;


ALTER TABLE changesets OWNER TO pedro;

--
-- Name: changesets; Type: ACL; Schema: osmexport; Owner: pedro
--

REVOKE ALL ON TABLE changesets FROM PUBLIC;
REVOKE ALL ON TABLE changesets FROM pedro;
GRANT ALL ON TABLE changesets TO pedro;
GRANT SELECT ON TABLE changesets TO osmexport;
GRANT SELECT ON TABLE changesets TO PUBLIC;


--
-- PostgreSQL database dump complete
--

