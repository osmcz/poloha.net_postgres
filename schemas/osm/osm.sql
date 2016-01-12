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
-- Name: osm; Type: SCHEMA; Schema: -; Owner: osm
--

CREATE SCHEMA osm;


ALTER SCHEMA osm OWNER TO osm;

--
-- Name: osm; Type: ACL; Schema: -; Owner: osm
--

REVOKE ALL ON SCHEMA osm FROM PUBLIC;
REVOKE ALL ON SCHEMA osm FROM osm;
GRANT ALL ON SCHEMA osm TO osm;
GRANT USAGE ON SCHEMA osm TO PUBLIC;


--
-- PostgreSQL database dump complete
--

