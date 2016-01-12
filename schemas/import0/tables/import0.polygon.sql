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
-- Name: polygon; Type: TABLE; Schema: import0; Owner: import0; Tablespace: 
--

CREATE TABLE polygon (
    hranice public.geometry
);


ALTER TABLE polygon OWNER TO import0;

--
-- Name: polygon; Type: ACL; Schema: import0; Owner: import0
--

REVOKE ALL ON TABLE polygon FROM PUBLIC;
REVOKE ALL ON TABLE polygon FROM import0;
GRANT ALL ON TABLE polygon TO import0;
GRANT SELECT ON TABLE polygon TO PUBLIC;


--
-- PostgreSQL database dump complete
--

