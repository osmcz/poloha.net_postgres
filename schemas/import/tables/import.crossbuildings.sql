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
-- Name: crossbuildings; Type: TABLE; Schema: import; Owner: pedro; Tablespace: 
--

CREATE TABLE crossbuildings (
    osm_id bigint
);


ALTER TABLE crossbuildings OWNER TO pedro;

--
-- Name: crossbuildings; Type: ACL; Schema: import; Owner: pedro
--

REVOKE ALL ON TABLE crossbuildings FROM PUBLIC;
REVOKE ALL ON TABLE crossbuildings FROM pedro;
GRANT ALL ON TABLE crossbuildings TO pedro;
GRANT SELECT ON TABLE crossbuildings TO PUBLIC;


--
-- PostgreSQL database dump complete
--

