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
-- Name: rn_vo; Type: TABLE; Schema: ruian; Owner: ruian
--

CREATE TABLE rn_vo (
    kod integer NOT NULL,
    cislo integer,
    nespravny boolean,
    obec_kod integer,
    momc_kod integer,
    poznamka character varying,
    plati_od date,
    plati_do date,
    id_trans_ruian bigint,
    nz_id_globalni bigint,
    definicni_bod public.geometry,
    hranice public.geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE rn_vo OWNER TO ruian;

--
-- Name: rn_vo rn_vo_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian
--

ALTER TABLE ONLY rn_vo
    ADD CONSTRAINT rn_vo_pkey PRIMARY KEY (kod);


--
-- PostgreSQL database dump complete
--

