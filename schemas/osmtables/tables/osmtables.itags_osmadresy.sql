--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osmtables, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: itags_osmadresy; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE itags_osmadresy (
    tag text
);


ALTER TABLE itags_osmadresy OWNER TO pedro;

--
-- Name: itags_osmadresy; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE itags_osmadresy FROM PUBLIC;
REVOKE ALL ON TABLE itags_osmadresy FROM pedro;
GRANT ALL ON TABLE itags_osmadresy TO pedro;
GRANT SELECT ON TABLE itags_osmadresy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

