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
-- Name: supplemental_tags; Type: TABLE; Schema: osmtables; Owner: pedro
--

CREATE TABLE supplemental_tags (
    k character varying
);


ALTER TABLE supplemental_tags OWNER TO pedro;

--
-- Name: supplemental_tags; Type: ACL; Schema: osmtables; Owner: pedro
--

GRANT SELECT ON TABLE supplemental_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

