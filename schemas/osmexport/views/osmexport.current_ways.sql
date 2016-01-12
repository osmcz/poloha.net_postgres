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
-- Name: current_ways; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW current_ways AS
 SELECT current_ways.id,
    current_ways.changeset_id,
    current_ways."timestamp",
    current_ways.visible,
    current_ways.version
   FROM osm.current_ways;


ALTER TABLE current_ways OWNER TO pedro;

--
-- Name: current_ways; Type: ACL; Schema: osmexport; Owner: pedro
--

REVOKE ALL ON TABLE current_ways FROM PUBLIC;
REVOKE ALL ON TABLE current_ways FROM pedro;
GRANT ALL ON TABLE current_ways TO pedro;
GRANT SELECT ON TABLE current_ways TO osmexport;
GRANT SELECT ON TABLE current_ways TO PUBLIC;


--
-- PostgreSQL database dump complete
--

