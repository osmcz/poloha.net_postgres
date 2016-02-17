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
-- Name: rn_obec; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE rn_obec (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    okres_kod integer,
    pou_kod integer,
    nuts_lau character varying,
    mluv_char_pad_2 character varying,
    mluv_char_pad_3 character varying,
    mluv_char_pad_4 character varying,
    mluv_char_pad_5 character varying,
    mluv_char_pad_6 character varying,
    mluv_char_pad_7 character varying,
    zmena_grafiky boolean,
    cleneni_sm_rozsah_kod integer,
    cleneni_sm_typ_kod integer,
    status_kod integer,
    vlajka_text character varying,
    vlajka_obrazek bytea,
    znak_text character varying,
    znak_obrazek bytea,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    definicni_bod public.geometry,
    hranice public.geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE rn_obec OWNER TO ruian;

--
-- Name: rn_obec_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian; Tablespace: 
--

ALTER TABLE ONLY rn_obec
    ADD CONSTRAINT rn_obec_pkey PRIMARY KEY (kod);


--
-- Name: rn_obec_hranice_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_obec_hranice_idx ON rn_obec USING gist (hranice);


--
-- Name: rn_obec_okres_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_obec_okres_kod_idx ON rn_obec USING btree (okres_kod);


--
-- Name: rn_obec_pou_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_obec_pou_kod_idx ON rn_obec USING btree (pou_kod);


--
-- Name: rn_obec; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rn_obec FROM PUBLIC;
REVOKE ALL ON TABLE rn_obec FROM ruian;
GRANT ALL ON TABLE rn_obec TO ruian;
GRANT SELECT ON TABLE rn_obec TO PUBLIC;


--
-- PostgreSQL database dump complete
--

