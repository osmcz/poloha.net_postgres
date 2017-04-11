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

SET search_path = osmtables, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: kctmax; Type: TABLE; Schema: osmtables; Owner: mapnik
--

CREATE TABLE kctmax (
    prio smallint,
    hodnota text
);


ALTER TABLE kctmax OWNER TO mapnik;

--
-- Name: kctmax; Type: ACL; Schema: osmtables; Owner: mapnik
--

GRANT SELECT ON TABLE kctmax TO PUBLIC;


--
-- PostgreSQL database dump complete
--

