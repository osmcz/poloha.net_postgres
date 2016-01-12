--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ruian, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tmplanduse; Type: TABLE; Schema: ruian; Owner: pedro; Tablespace: 
--

CREATE TABLE tmplanduse (
    kod integer,
    hranice public.geometry,
    okres_kod integer
);


ALTER TABLE tmplanduse OWNER TO pedro;

--
-- Name: tmplanduse; Type: ACL; Schema: ruian; Owner: pedro
--

REVOKE ALL ON TABLE tmplanduse FROM PUBLIC;
REVOKE ALL ON TABLE tmplanduse FROM pedro;
GRANT ALL ON TABLE tmplanduse TO pedro;
GRANT SELECT ON TABLE tmplanduse TO PUBLIC;


--
-- PostgreSQL database dump complete
--

