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
-- Name: adresni_misto_deleted; Type: TABLE; Schema: osmtables; Owner: import0
--

CREATE TABLE adresni_misto_deleted (
    kod integer,
    nespravny boolean,
    adrp_psc integer,
    ulice_kod integer,
    stavobj_kod integer,
    cislo_domovni integer,
    cislo_orientacni_hodnota integer,
    cislo_orientacni_pismeno character varying,
    id_trans_ruian bigint,
    plati_od date,
    zmena_grafiky boolean,
    nz_id_globalni bigint,
    definicni_bod public.geometry,
    zachranka public.geometry,
    hasici public.geometry,
    item_timestamp timestamp without time zone,
    deleted boolean,
    vo_kod integer
);


ALTER TABLE adresni_misto_deleted OWNER TO import0;

--
-- PostgreSQL database dump complete
--

