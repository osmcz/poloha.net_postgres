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
-- Name: rn_region_soudrznosti; Type: TABLE; Schema: ruian; Owner: ruian
--

CREATE TABLE rn_region_soudrznosti (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    stat_kod integer,
    id_trans_ruian bigint,
    nuts_lau character varying,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    definicni_bod public.geometry,
    hranice public.geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE rn_region_soudrznosti OWNER TO ruian;

--
-- Name: rn_region_soudrznosti rn_region_soudrznosti_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian
--

ALTER TABLE ONLY rn_region_soudrznosti
    ADD CONSTRAINT rn_region_soudrznosti_pkey PRIMARY KEY (kod);


--
-- Name: rn_region_soudrznosti_hranice_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_region_soudrznosti_hranice_idx ON rn_region_soudrznosti USING gist (hranice);


--
-- Name: rn_region_soudrznosti_stat_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_region_soudrznosti_stat_kod_idx ON rn_region_soudrznosti USING btree (stat_kod);


--
-- Name: rn_region_soudrznosti; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE rn_region_soudrznosti TO PUBLIC;


--
-- PostgreSQL database dump complete
--

