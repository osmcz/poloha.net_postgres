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
-- Name: rn_okres; Type: TABLE; Schema: ruian; Owner: ruian
--

CREATE TABLE rn_okres (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    vusc_kod integer,
    kraj_1960_kod integer,
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


ALTER TABLE rn_okres OWNER TO ruian;

--
-- Name: rn_okres rn_okres_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian
--

ALTER TABLE ONLY rn_okres
    ADD CONSTRAINT rn_okres_pkey PRIMARY KEY (kod);


--
-- Name: rn_okres_hranice_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_okres_hranice_idx ON rn_okres USING gist (hranice);


--
-- Name: rn_okres_kraj_1960_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_okres_kraj_1960_kod_idx ON rn_okres USING btree (kraj_1960_kod);


--
-- Name: rn_okres_vusc_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_okres_vusc_kod_idx ON rn_okres USING btree (vusc_kod);


--
-- Name: rn_okres; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE rn_okres TO PUBLIC;


--
-- PostgreSQL database dump complete
--

