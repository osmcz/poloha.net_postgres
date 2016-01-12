--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ruian, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: rn_detailni_tea; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
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
WITH (autovacuum_vacuum_scale_factor=0.02, autovacuum_analyze_scale_factor=0.02);


ALTER TABLE rn_detailni_tea OWNER TO ruian;

--
-- Name: rn_detailni_tea_adresni_misto_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_detailni_tea_adresni_misto_kod_idx ON rn_detailni_tea USING btree (adresni_misto_kod);


--
-- Name: rn_detailni_tea_stavobj_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_detailni_tea_stavobj_kod_idx ON rn_detailni_tea USING btree (stavobj_kod);


--
-- Name: rn_detailni_tea; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rn_detailni_tea FROM PUBLIC;
REVOKE ALL ON TABLE rn_detailni_tea FROM ruian;
GRANT ALL ON TABLE rn_detailni_tea TO ruian;
GRANT SELECT ON TABLE rn_detailni_tea TO PUBLIC;


--
-- PostgreSQL database dump complete
--

