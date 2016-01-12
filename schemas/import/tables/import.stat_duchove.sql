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
-- Name: stat_duchove; Type: TABLE; Schema: import; Owner: import0; Tablespace: 
--

CREATE TABLE stat_duchove (
    cobce_kod integer,
    pocet_celkem integer,
    pocet_duchove integer
);


ALTER TABLE stat_duchove OWNER TO import0;

--
-- Name: stat_duchove; Type: ACL; Schema: import; Owner: import0
--

REVOKE ALL ON TABLE stat_duchove FROM PUBLIC;
REVOKE ALL ON TABLE stat_duchove FROM import0;
GRANT ALL ON TABLE stat_duchove TO import0;
GRANT SELECT ON TABLE stat_duchove TO PUBLIC;


--
-- PostgreSQL database dump complete
--

