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
-- Name: hlavicka; Type: TABLE; Schema: ruian; Owner: ruian
--

CREATE TABLE hlavicka (
    typ_zaznamu character varying,
    typ_davky character varying,
    typ_souboru character varying,
    datum date,
    transakce_od_id integer,
    transakce_od_zapsano timestamp without time zone,
    transakce_do_id integer,
    transakce_do_zapsano timestamp without time zone,
    predchozi_soubor character varying,
    plny_soubor character varying,
    metadata character varying,
    import_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE hlavicka OWNER TO ruian;

--
-- Name: hlavicka; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE hlavicka TO PUBLIC;


--
-- PostgreSQL database dump complete
--

