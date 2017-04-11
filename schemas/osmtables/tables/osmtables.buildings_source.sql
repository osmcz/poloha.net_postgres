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
-- Name: buildings_source; Type: TABLE; Schema: osmtables; Owner: pedro
--

CREATE TABLE buildings_source (
    datum date,
    km integer,
    ruian integer,
    oboje integer
);


ALTER TABLE buildings_source OWNER TO pedro;

--
-- Name: buildings_source; Type: ACL; Schema: osmtables; Owner: pedro
--

GRANT SELECT ON TABLE buildings_source TO PUBLIC;
GRANT INSERT ON TABLE buildings_source TO osm;


--
-- PostgreSQL database dump complete
--

