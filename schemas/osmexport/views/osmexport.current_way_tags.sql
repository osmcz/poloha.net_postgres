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
-- Name: current_way_tags; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW current_way_tags AS
 SELECT current_way_tags.way_id,
    current_way_tags.k,
    current_way_tags.v
   FROM osm.current_way_tags;


ALTER TABLE current_way_tags OWNER TO pedro;

--
-- Name: current_way_tags; Type: ACL; Schema: osmexport; Owner: pedro
--

REVOKE ALL ON TABLE current_way_tags FROM PUBLIC;
REVOKE ALL ON TABLE current_way_tags FROM pedro;
GRANT ALL ON TABLE current_way_tags TO pedro;
GRANT SELECT ON TABLE current_way_tags TO osmexport;
GRANT SELECT ON TABLE current_way_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

