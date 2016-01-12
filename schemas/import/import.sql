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
-- Name: import; Type: SCHEMA; Schema: -; Owner: import
--

CREATE SCHEMA import;


ALTER SCHEMA import OWNER TO import;

--
-- Name: import; Type: ACL; Schema: -; Owner: import
--

REVOKE ALL ON SCHEMA import FROM PUBLIC;
REVOKE ALL ON SCHEMA import FROM import;
GRANT ALL ON SCHEMA import TO import;
GRANT USAGE ON SCHEMA import TO PUBLIC;


--
-- PostgreSQL database dump complete
--

