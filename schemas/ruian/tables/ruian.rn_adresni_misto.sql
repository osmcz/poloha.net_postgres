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
-- Name: rn_adresni_misto; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE rn_adresni_misto (
    kod integer NOT NULL,
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
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE rn_adresni_misto OWNER TO ruian;

--
-- Name: rn_adresni_misto_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian; Tablespace: 
--

ALTER TABLE ONLY rn_adresni_misto
    ADD CONSTRAINT rn_adresni_misto_pkey PRIMARY KEY (kod);


--
-- Name: rn_adresni_misto_definicni_bod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_adresni_misto_definicni_bod_idx ON rn_adresni_misto USING gist (definicni_bod);


--
-- Name: rn_adresni_misto_stavobj_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_adresni_misto_stavobj_kod_idx ON rn_adresni_misto USING btree (stavobj_kod);


--
-- Name: rn_adresni_misto_ulice_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_adresni_misto_ulice_kod_idx ON rn_adresni_misto USING btree (ulice_kod);


--
-- Name: rn_adresni_misto; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rn_adresni_misto FROM PUBLIC;
REVOKE ALL ON TABLE rn_adresni_misto FROM ruian;
GRANT ALL ON TABLE rn_adresni_misto TO ruian;
GRANT SELECT ON TABLE rn_adresni_misto TO PUBLIC;
GRANT DELETE ON TABLE rn_adresni_misto TO import0;


--
-- PostgreSQL database dump complete
--

