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
-- Name: ways; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW ways AS
 SELECT current_ways.id AS way_id,
    current_ways.changeset_id,
    current_ways."timestamp",
    current_ways.visible,
    current_ways.version
   FROM osm.current_ways;


ALTER TABLE ways OWNER TO pedro;

--
-- Name: ways; Type: ACL; Schema: osmexport; Owner: pedro
--

REVOKE ALL ON TABLE ways FROM PUBLIC;
REVOKE ALL ON TABLE ways FROM pedro;
GRANT ALL ON TABLE ways TO pedro;
GRANT SELECT ON TABLE ways TO osmexport;
GRANT SELECT ON TABLE ways TO PUBLIC;


--
-- PostgreSQL database dump complete
--

