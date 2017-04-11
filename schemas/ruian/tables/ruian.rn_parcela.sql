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
-- Name: rn_parcela; Type: TABLE; Schema: ruian; Owner: ruian
--

CREATE TABLE rn_parcela (
    id bigint NOT NULL,
    nespravny boolean,
    katuz_kod integer,
    druh_pozemku_kod integer,
    druh_cislovani_kod integer,
    kmenove_cislo integer,
    poddeleni_cisla integer,
    vymera_parcely bigint,
    id_trans_ruian bigint,
    zpusob_vyu_poz_kod integer,
    rizeni_id bigint,
    plati_od date,
    definicni_bod public.geometry,
    hranice public.geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
)
WITH (autovacuum_enabled='true', autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02', toast.autovacuum_enabled='true', toast.autovacuum_vacuum_scale_factor='0.05');


ALTER TABLE rn_parcela OWNER TO ruian;

--
-- Name: rn_parcela rn_parcela_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian
--

ALTER TABLE ONLY rn_parcela
    ADD CONSTRAINT rn_parcela_pkey PRIMARY KEY (id);


--
-- Name: rn_parcela_hranice_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_parcela_hranice_idx ON rn_parcela USING gist (hranice);


--
-- Name: rn_parcela; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE rn_parcela TO PUBLIC;


--
-- PostgreSQL database dump complete
--

