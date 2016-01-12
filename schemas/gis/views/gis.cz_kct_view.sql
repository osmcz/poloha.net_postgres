--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = gis, pg_catalog;

--
-- Name: cz_kct_view; Type: VIEW; Schema: gis; Owner: mapnik
--

CREATE VIEW cz_kct_view AS
 SELECT cz_kct.osm_id,
    cz_kct.route,
    cz_kct.name,
    cz_kct.length,
    cz_kct.kct_yellow,
    cz_kct.kct_green,
    cz_kct.kct_blue,
    cz_kct.kct_red
   FROM cz_kct;


ALTER TABLE cz_kct_view OWNER TO mapnik;

--
-- Name: cz_kct_view; Type: ACL; Schema: gis; Owner: mapnik
--

REVOKE ALL ON TABLE cz_kct_view FROM PUBLIC;
REVOKE ALL ON TABLE cz_kct_view FROM mapnik;
GRANT ALL ON TABLE cz_kct_view TO mapnik;
GRANT SELECT ON TABLE cz_kct_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

