--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: polygon; Type: TABLE; Schema: import; Owner: pedro; Tablespace: 
--

CREATE TABLE polygon (
    hranice public.geometry
);


ALTER TABLE polygon OWNER TO pedro;

--
-- Name: polygon; Type: ACL; Schema: import; Owner: pedro
--

REVOKE ALL ON TABLE polygon FROM PUBLIC;
REVOKE ALL ON TABLE polygon FROM pedro;
GRANT ALL ON TABLE polygon TO pedro;
GRANT SELECT ON TABLE polygon TO PUBLIC;
GRANT ALL ON TABLE polygon TO buildings;


--
-- PostgreSQL database dump complete
--

