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
-- Name: osmtables; Type: SCHEMA; Schema: -; Owner: pedro
--

CREATE SCHEMA osmtables;


ALTER SCHEMA osmtables OWNER TO pedro;

--
-- Name: osmtables; Type: ACL; Schema: -; Owner: pedro
--

REVOKE ALL ON SCHEMA osmtables FROM PUBLIC;
REVOKE ALL ON SCHEMA osmtables FROM pedro;
GRANT ALL ON SCHEMA osmtables TO pedro;
GRANT USAGE ON SCHEMA osmtables TO PUBLIC;
GRANT ALL ON SCHEMA osmtables TO marian;
GRANT ALL ON SCHEMA osmtables TO import0;


--
-- PostgreSQL database dump complete
--

