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

SET search_path = ruian, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tmp_prekryvy; Type: TABLE; Schema: ruian; Owner: pedro
--

CREATE TABLE tmp_prekryvy (
    a_id bigint,
    a_kmenove_cislo integer,
    a_poddeleni_cisla integer,
    b_id bigint,
    b_kmenove_cislo integer,
    b_poddeleni_cisla integer,
    procento_prekryti double precision,
    souradnice text
);


ALTER TABLE tmp_prekryvy OWNER TO pedro;

--
-- Name: tmp_prekryvy; Type: ACL; Schema: ruian; Owner: pedro
--

GRANT SELECT ON TABLE tmp_prekryvy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

