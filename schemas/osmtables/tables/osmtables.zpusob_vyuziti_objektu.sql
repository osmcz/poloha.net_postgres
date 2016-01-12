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

SET default_with_oids = true;

--
-- Name: zpusob_vyuziti_objektu; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE zpusob_vyuziti_objektu (
    kod smallint,
    nazev text,
    zkratka text,
    osmtag_v text,
    platnost_od date,
    platnost_do date,
    osmtag_k text
);


ALTER TABLE zpusob_vyuziti_objektu OWNER TO pedro;

--
-- Name: zpusob_vyuziti_objektu; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE zpusob_vyuziti_objektu FROM PUBLIC;
REVOKE ALL ON TABLE zpusob_vyuziti_objektu FROM pedro;
GRANT ALL ON TABLE zpusob_vyuziti_objektu TO pedro;
GRANT SELECT ON TABLE zpusob_vyuziti_objektu TO PUBLIC;
GRANT ALL ON TABLE zpusob_vyuziti_objektu TO marian;


--
-- PostgreSQL database dump complete
--

