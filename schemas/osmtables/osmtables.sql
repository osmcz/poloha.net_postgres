--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: osmtables; Type: SCHEMA; Schema: -; Owner: pedro
--

CREATE SCHEMA osmtables;


ALTER SCHEMA osmtables OWNER TO pedro;

--
-- Name: osmtables; Type: ACL; Schema: -; Owner: pedro
--

GRANT ALL ON SCHEMA osmtables TO marian;
GRANT ALL ON SCHEMA osmtables TO import0;
GRANT USAGE ON SCHEMA osmtables TO PUBLIC;


--
-- PostgreSQL database dump complete
--

