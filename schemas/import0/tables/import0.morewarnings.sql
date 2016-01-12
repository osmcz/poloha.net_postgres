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
-- Name: morewarnings; Type: TABLE; Schema: import0; Owner: import0; Tablespace: 
--

CREATE TABLE morewarnings (
    kod bigint,
    id bigint,
    distance real,
    co import.co
);


ALTER TABLE morewarnings OWNER TO import0;

--
-- Name: morewarnings; Type: ACL; Schema: import0; Owner: import0
--

REVOKE ALL ON TABLE morewarnings FROM PUBLIC;
REVOKE ALL ON TABLE morewarnings FROM import0;
GRANT ALL ON TABLE morewarnings TO import0;
GRANT SELECT ON TABLE morewarnings TO PUBLIC;


--
-- PostgreSQL database dump complete
--

