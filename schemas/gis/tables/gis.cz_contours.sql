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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cz_contours; Type: TABLE; Schema: gis; Owner: mapnik; Tablespace: 
--

CREATE TABLE cz_contours (
    height real,
    way public.geometry
);


ALTER TABLE cz_contours OWNER TO mapnik;

--
-- Name: cz_contours_way; Type: INDEX; Schema: gis; Owner: mapnik; Tablespace: 
--

CREATE INDEX cz_contours_way ON cz_contours USING gist (way);


--
-- Name: cz_contours; Type: ACL; Schema: gis; Owner: mapnik
--

REVOKE ALL ON TABLE cz_contours FROM PUBLIC;
REVOKE ALL ON TABLE cz_contours FROM mapnik;
GRANT ALL ON TABLE cz_contours TO mapnik;
GRANT SELECT ON TABLE cz_contours TO PUBLIC;


--
-- PostgreSQL database dump complete
--

