--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: jsontiles; Type: SCHEMA; Schema: -; Owner: pedro
--

CREATE SCHEMA jsontiles;


ALTER SCHEMA jsontiles OWNER TO pedro;

--
-- Name: jsontiles; Type: ACL; Schema: -; Owner: pedro
--

REVOKE ALL ON SCHEMA jsontiles FROM PUBLIC;
REVOKE ALL ON SCHEMA jsontiles FROM pedro;
GRANT ALL ON SCHEMA jsontiles TO pedro;
GRANT USAGE ON SCHEMA jsontiles TO PUBLIC;


--
-- PostgreSQL database dump complete
--

