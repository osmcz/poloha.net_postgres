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
-- Name: networkmax; Type: TABLE; Schema: osmtables; Owner: mapnik; Tablespace: 
--

CREATE TABLE networkmax (
    prio smallint,
    hodnota text
);


ALTER TABLE networkmax OWNER TO mapnik;

--
-- Name: networkmax; Type: ACL; Schema: osmtables; Owner: mapnik
--

REVOKE ALL ON TABLE networkmax FROM PUBLIC;
REVOKE ALL ON TABLE networkmax FROM mapnik;
GRANT ALL ON TABLE networkmax TO mapnik;
GRANT SELECT ON TABLE networkmax TO PUBLIC;


--
-- PostgreSQL database dump complete
--

