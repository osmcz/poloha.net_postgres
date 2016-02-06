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
-- Name: polygon; Type: VIEW; Schema: jsontiles; Owner: pedro
--

CREATE VIEW polygon AS
 SELECT cz_polygon.osm_id,
    cz_polygon.way
   FROM gis.cz_polygon;


ALTER TABLE polygon OWNER TO pedro;

--
-- Name: polygon; Type: ACL; Schema: jsontiles; Owner: pedro
--

REVOKE ALL ON TABLE polygon FROM PUBLIC;
REVOKE ALL ON TABLE polygon FROM pedro;
GRANT ALL ON TABLE polygon TO pedro;
GRANT SELECT ON TABLE polygon TO PUBLIC;


--
-- PostgreSQL database dump complete
--

