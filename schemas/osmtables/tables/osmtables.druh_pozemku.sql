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
-- Name: druh_pozemku; Type: TABLE; Schema: osmtables; Owner: marian
--

CREATE TABLE druh_pozemku (
    kod smallint,
    nazev text,
    zemedelska_kultura text,
    platnost_od date,
    platnost_do date,
    zkratka text,
    typppd_kod smallint,
    stavebni_parcela text,
    povinna_ochrana_poz text,
    povinny_zpusob_vyuz text,
    osmtag_v text,
    osmtag_k text
);


ALTER TABLE druh_pozemku OWNER TO marian;

--
-- Name: druh_pozemku; Type: ACL; Schema: osmtables; Owner: marian
--

GRANT SELECT ON TABLE druh_pozemku TO guest;


--
-- PostgreSQL database dump complete
--

