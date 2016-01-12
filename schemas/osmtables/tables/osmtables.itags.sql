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

SET default_with_oids = true;

--
-- Name: itags; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE itags (
    tag text
);


ALTER TABLE itags OWNER TO pedro;

--
-- Name: itags; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE itags FROM PUBLIC;
REVOKE ALL ON TABLE itags FROM pedro;
GRANT ALL ON TABLE itags TO pedro;
GRANT SELECT ON TABLE itags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

