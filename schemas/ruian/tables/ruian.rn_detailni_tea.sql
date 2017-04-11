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
-- Name: rn_detailni_tea; Type: TABLE; Schema: ruian; Owner: ruian
--

CREATE TABLE rn_detailni_tea (
    kod integer,
    stavobj_kod integer,
    adresni_misto_kod integer,
    nespravny boolean,
    pocet_bytu integer,
    pocet_podlazi integer,
    druh_konstrukce_kod integer,
    pripoj_kanal_sit_kod integer,
    pripoj_plyn_kod integer,
    pripoj_vodovod_kod integer,
    pripoj_el_energie boolean,
    zpusob_vytapeni_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    deleted boolean DEFAULT false
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE rn_detailni_tea OWNER TO ruian;

--
-- Name: rn_detailni_tea_adresni_misto_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_detailni_tea_adresni_misto_kod_idx ON rn_detailni_tea USING btree (adresni_misto_kod);


--
-- Name: rn_detailni_tea_stavobj_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_detailni_tea_stavobj_kod_idx ON rn_detailni_tea USING btree (stavobj_kod);


--
-- Name: rn_detailni_tea; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE rn_detailni_tea TO PUBLIC;


--
-- PostgreSQL database dump complete
--

