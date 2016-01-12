--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import, pg_catalog;

--
-- Name: trasy_v_mem_okoli_view; Type: VIEW; Schema: import; Owner: import
--

CREATE VIEW trasy_v_mem_okoli_view AS
 SELECT cz_line.osm_id,
    cz_line.name,
    cz_line.complete,
    public.st_distance(public.st_geographyfromtext('POINT(14.45873 50.07727)'::text), (public.st_transform(cz_line.way, 4326))::public.geography) AS st_distance
   FROM gis.cz_line
  WHERE ((((cz_line.kct_yellow IS NOT NULL) OR (cz_line.kct_blue IS NOT NULL)) OR (cz_line.kct_green IS NOT NULL)) OR (cz_line.kct_red IS NOT NULL))
  ORDER BY public.st_distance(public.st_geographyfromtext('POINT(14.45873 50.07727)'::text), (public.st_transform(cz_line.way, 4326))::public.geography);


ALTER TABLE trasy_v_mem_okoli_view OWNER TO import;

--
-- Name: trasy_v_mem_okoli_view; Type: ACL; Schema: import; Owner: import
--

REVOKE ALL ON TABLE trasy_v_mem_okoli_view FROM PUBLIC;
REVOKE ALL ON TABLE trasy_v_mem_okoli_view FROM import;
GRANT ALL ON TABLE trasy_v_mem_okoli_view TO import;
GRANT SELECT ON TABLE trasy_v_mem_okoli_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

