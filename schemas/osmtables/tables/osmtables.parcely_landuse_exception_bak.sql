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
-- Name: parcely_landuse_exception_bak; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE parcely_landuse_exception_bak (
    id bigint
);


ALTER TABLE parcely_landuse_exception_bak OWNER TO pedro;

--
-- Name: parcely_landuse_exception_bak; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE parcely_landuse_exception_bak FROM PUBLIC;
REVOKE ALL ON TABLE parcely_landuse_exception_bak FROM pedro;
GRANT ALL ON TABLE parcely_landuse_exception_bak TO pedro;
GRANT SELECT ON TABLE parcely_landuse_exception_bak TO PUBLIC;


--
-- PostgreSQL database dump complete
--

