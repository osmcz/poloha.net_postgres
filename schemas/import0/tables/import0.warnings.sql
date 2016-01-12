--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import0, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: warnings; Type: TABLE; Schema: import0; Owner: import0; Tablespace: 
--

CREATE TABLE warnings (
    kod_a bigint,
    kod_b bigint,
    distance double precision
);


ALTER TABLE warnings OWNER TO import0;

--
-- Name: warnings; Type: ACL; Schema: import0; Owner: import0
--

REVOKE ALL ON TABLE warnings FROM PUBLIC;
REVOKE ALL ON TABLE warnings FROM import0;
GRANT ALL ON TABLE warnings TO import0;
GRANT SELECT ON TABLE warnings TO PUBLIC;


--
-- PostgreSQL database dump complete
--

