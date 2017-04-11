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

SET search_path = import, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: stat_all; Type: TABLE; Schema: import; Owner: import
--

CREATE TABLE stat_all (
    okres character varying,
    okres_kod integer,
    obec character varying,
    obec_kod integer,
    cast_obce character varying,
    celkem bigint,
    importovano bigint,
    procent double precision,
    zpracovavano bigint,
    zpracovavanoprocent double precision,
    pocet_so integer,
    pocet_duchu integer,
    procent_duchu integer
);


ALTER TABLE stat_all OWNER TO import;

--
-- Name: stat_all; Type: ACL; Schema: import; Owner: import
--

GRANT SELECT ON TABLE stat_all TO PUBLIC;


--
-- PostgreSQL database dump complete
--

