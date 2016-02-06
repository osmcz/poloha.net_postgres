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
-- Name: point; Type: VIEW; Schema: jsontiles; Owner: pedro
--

CREATE VIEW point AS
 SELECT cz_point.osm_id,
    cz_point.place,
    cz_point.way
   FROM gis.cz_point;


ALTER TABLE point OWNER TO pedro;

--
-- Name: point; Type: ACL; Schema: jsontiles; Owner: pedro
--

REVOKE ALL ON TABLE point FROM PUBLIC;
REVOKE ALL ON TABLE point FROM pedro;
GRANT ALL ON TABLE point TO pedro;
GRANT SELECT ON TABLE point TO PUBLIC;


--
-- PostgreSQL database dump complete
--

