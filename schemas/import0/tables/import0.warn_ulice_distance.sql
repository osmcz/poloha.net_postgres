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
-- Name: warn_ulice_distance; Type: TABLE; Schema: import0; Owner: import0; Tablespace: 
--

CREATE TABLE warn_ulice_distance (
    kod bigint,
    distance real,
    ulice text
);


ALTER TABLE warn_ulice_distance OWNER TO import0;

--
-- Name: warn_ulice_distance; Type: ACL; Schema: import0; Owner: import0
--

REVOKE ALL ON TABLE warn_ulice_distance FROM PUBLIC;
REVOKE ALL ON TABLE warn_ulice_distance FROM import0;
GRANT ALL ON TABLE warn_ulice_distance TO import0;
GRANT SELECT ON TABLE warn_ulice_distance TO PUBLIC;


--
-- PostgreSQL database dump complete
--

