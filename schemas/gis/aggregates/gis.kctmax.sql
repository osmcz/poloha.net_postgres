--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = gis, pg_catalog;

--
-- Name: kctmax(text); Type: AGGREGATE; Schema: gis; Owner: pedro
--

CREATE AGGREGATE kctmax(text) (
    SFUNC = kctmax_every_deleteme,
    STYPE = text
);


ALTER AGGREGATE gis.kctmax(text) OWNER TO pedro;

--
-- Name: kctmax(text); Type: ACL; Schema: gis; Owner: pedro
--

REVOKE ALL ON FUNCTION kctmax(text) FROM PUBLIC;
REVOKE ALL ON FUNCTION kctmax(text) FROM pedro;
GRANT ALL ON FUNCTION kctmax(text) TO pedro;
GRANT ALL ON FUNCTION kctmax(text) TO PUBLIC;


--
-- PostgreSQL database dump complete
--

