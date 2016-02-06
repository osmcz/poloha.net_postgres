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
-- Name: sk; Type: SCHEMA; Schema: -; Owner: sk
--

CREATE SCHEMA sk;


ALTER SCHEMA sk OWNER TO sk;

--
-- Name: sk; Type: ACL; Schema: -; Owner: sk
--

REVOKE ALL ON SCHEMA sk FROM PUBLIC;
REVOKE ALL ON SCHEMA sk FROM sk;
GRANT ALL ON SCHEMA sk TO sk;
GRANT USAGE ON SCHEMA sk TO PUBLIC;


--
-- PostgreSQL database dump complete
--

