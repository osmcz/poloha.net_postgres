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
-- Name: itags_pos; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE itags_pos (
    k text,
    v text
);


ALTER TABLE itags_pos OWNER TO pedro;

--
-- Name: itags_pos; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE itags_pos FROM PUBLIC;
REVOKE ALL ON TABLE itags_pos FROM pedro;
GRANT ALL ON TABLE itags_pos TO pedro;
GRANT SELECT ON TABLE itags_pos TO PUBLIC;


--
-- PostgreSQL database dump complete
--

