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
-- Name: zpusob_vyuziti_pozemku; Type: TABLE; Schema: osmtables; Owner: marian
--

CREATE TABLE zpusob_vyuziti_pozemku (
    kod smallint,
    nazev text,
    platnost_od date,
    platnost_do date,
    typppd_kod smallint,
    zkratka text,
    osmtag_v text,
    osmtag_k text
);


ALTER TABLE zpusob_vyuziti_pozemku OWNER TO marian;

--
-- Name: zpusob_vyuziti_pozemku; Type: ACL; Schema: osmtables; Owner: marian
--

GRANT SELECT ON TABLE zpusob_vyuziti_pozemku TO guest;


--
-- PostgreSQL database dump complete
--

