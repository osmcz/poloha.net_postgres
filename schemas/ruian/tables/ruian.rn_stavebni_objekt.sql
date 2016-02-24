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
-- Name: rn_stavebni_objekt; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE rn_stavebni_objekt (
    kod integer NOT NULL,
    nespravny boolean,
    identifikacni_parcela_id bigint,
    momc_kod integer,
    cobce_kod integer,
    budova_id bigint,
    cisla_domovni integer[],
    dokonceni date,
    je_vytah_kod integer,
    zmena_grafiky boolean,
    druh_konstrukce_kod integer,
    zmena_detailu boolean,
    obestaveny_prostor integer,
    pocet_bytu integer,
    pocet_podlazi integer,
    podlahova_plocha integer,
    pripoj_el_energie boolean,
    pripoj_kanal_sit_kod integer,
    pripoj_plyn_kod integer,
    pripoj_vodovod_kod integer,
    typ_kod integer,
    zastavena_plocha integer,
    zpusob_vytapeni_kod integer,
    zpusob_vyuziti_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    definicni_bod public.geometry,
    hranice public.geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
)
WITH (autovacuum_enabled='true', autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE rn_stavebni_objekt OWNER TO ruian;

--
-- Name: rn_stavebni_objekt_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian; Tablespace: 
--

ALTER TABLE ONLY rn_stavebni_objekt
    ADD CONSTRAINT rn_stavebni_objekt_pkey PRIMARY KEY (kod);


--
-- Name: rn_stavebni_objekt_cobce_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_stavebni_objekt_cobce_kod_idx ON rn_stavebni_objekt USING btree (cobce_kod);


--
-- Name: rn_stavebni_objekt_definicni_bod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_stavebni_objekt_definicni_bod_idx ON rn_stavebni_objekt USING gist (definicni_bod) WHERE ((definicni_bod IS NOT NULL) AND (hranice IS NULL));


--
-- Name: rn_stavebni_objekt_hranice_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_stavebni_objekt_hranice_idx ON rn_stavebni_objekt USING gist (hranice);


--
-- Name: rn_stavebni_objekt_identifikacni_parcela_id_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_stavebni_objekt_identifikacni_parcela_id_idx ON rn_stavebni_objekt USING btree (identifikacni_parcela_id);


--
-- Name: rn_stavebni_objekt_momc_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_stavebni_objekt_momc_kod_idx ON rn_stavebni_objekt USING btree (momc_kod);


--
-- Name: rn_stavebni_objekt; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rn_stavebni_objekt FROM PUBLIC;
REVOKE ALL ON TABLE rn_stavebni_objekt FROM ruian;
GRANT ALL ON TABLE rn_stavebni_objekt TO ruian;
GRANT SELECT ON TABLE rn_stavebni_objekt TO PUBLIC;


--
-- PostgreSQL database dump complete
--

