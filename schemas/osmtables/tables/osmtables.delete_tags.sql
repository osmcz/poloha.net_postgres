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
-- Name: delete_tags; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE delete_tags (
    tag character varying(255)
);


ALTER TABLE delete_tags OWNER TO pedro;

--
-- Name: delete_tags; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE delete_tags FROM PUBLIC;
REVOKE ALL ON TABLE delete_tags FROM pedro;
GRANT ALL ON TABLE delete_tags TO pedro;
GRANT SELECT ON TABLE delete_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

