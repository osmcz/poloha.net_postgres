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

SET search_path = jsontiles, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: minustags; Type: TABLE; Schema: jsontiles; Owner: pedro
--

CREATE TABLE minustags (
    k character varying
);


ALTER TABLE minustags OWNER TO pedro;

--
-- Name: minustags; Type: ACL; Schema: jsontiles; Owner: pedro
--

GRANT SELECT ON TABLE minustags TO PUBLIC;
GRANT ALL ON TABLE minustags TO marian;


--
-- PostgreSQL database dump complete
--

