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
-- Name: osmexport; Type: SCHEMA; Schema: -; Owner: pedro
--

CREATE SCHEMA osmexport;


ALTER SCHEMA osmexport OWNER TO pedro;

--
-- Name: osmexport; Type: ACL; Schema: -; Owner: pedro
--

REVOKE ALL ON SCHEMA osmexport FROM PUBLIC;
REVOKE ALL ON SCHEMA osmexport FROM pedro;
GRANT ALL ON SCHEMA osmexport TO pedro;
GRANT USAGE ON SCHEMA osmexport TO PUBLIC;


--
-- PostgreSQL database dump complete
--

