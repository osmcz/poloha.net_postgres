--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: gis; Type: SCHEMA; Schema: -; Owner: mapnik
--

CREATE SCHEMA gis;


ALTER SCHEMA gis OWNER TO mapnik;

--
-- Name: gis; Type: ACL; Schema: -; Owner: mapnik
--

REVOKE ALL ON SCHEMA gis FROM PUBLIC;
REVOKE ALL ON SCHEMA gis FROM mapnik;
GRANT ALL ON SCHEMA gis TO mapnik;
GRANT USAGE ON SCHEMA gis TO PUBLIC;


--
-- PostgreSQL database dump complete
--

