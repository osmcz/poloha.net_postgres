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
-- Name: parcely_landuse_exception; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE parcely_landuse_exception (
    id bigint
);


ALTER TABLE parcely_landuse_exception OWNER TO pedro;

--
-- Name: parcely_landuse_exception; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE parcely_landuse_exception FROM PUBLIC;
REVOKE ALL ON TABLE parcely_landuse_exception FROM pedro;
GRANT ALL ON TABLE parcely_landuse_exception TO pedro;
GRANT SELECT ON TABLE parcely_landuse_exception TO PUBLIC;


--
-- PostgreSQL database dump complete
--

