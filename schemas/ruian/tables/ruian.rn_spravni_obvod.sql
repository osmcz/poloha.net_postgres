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
-- Name: rn_spravni_obvod; Type: TABLE; Schema: ruian; Owner: ruian
--

CREATE TABLE rn_spravni_obvod (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    obec_kod integer,
    spravni_momc_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    zmena_grafiky boolean,
    definicni_bod public.geometry,
    hranice public.geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE rn_spravni_obvod OWNER TO ruian;

--
-- Name: rn_spravni_obvod rn_spravni_obvod_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian
--

ALTER TABLE ONLY rn_spravni_obvod
    ADD CONSTRAINT rn_spravni_obvod_pkey PRIMARY KEY (kod);


--
-- Name: rn_spravni_obvod_hranice_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_spravni_obvod_hranice_idx ON rn_spravni_obvod USING gist (hranice);


--
-- Name: rn_spravni_obvod_obec_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_spravni_obvod_obec_kod_idx ON rn_spravni_obvod USING btree (obec_kod);


--
-- Name: rn_spravni_obvod_spravni_momc_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_spravni_obvod_spravni_momc_kod_idx ON rn_spravni_obvod USING btree (spravni_momc_kod);


--
-- Name: rn_spravni_obvod; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE rn_spravni_obvod TO PUBLIC;


--
-- PostgreSQL database dump complete
--

