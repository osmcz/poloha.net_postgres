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
-- Name: rn_momc; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE rn_momc (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    obec_kod integer,
    mop_kod integer,
    spravobv_kod integer,
    mluv_char_pad_2 character varying,
    mluv_char_pad_3 character varying,
    mluv_char_pad_4 character varying,
    mluv_char_pad_5 character varying,
    mluv_char_pad_6 character varying,
    mluv_char_pad_7 character varying,
    zmena_grafiky boolean,
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
);


ALTER TABLE rn_momc OWNER TO ruian;

--
-- Name: rn_momc_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian; Tablespace: 
--

ALTER TABLE ONLY rn_momc
    ADD CONSTRAINT rn_momc_pkey PRIMARY KEY (kod);


--
-- Name: rn_momc_hranice_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_momc_hranice_idx ON rn_momc USING gist (hranice);


--
-- Name: rn_momc_mop_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_momc_mop_kod_idx ON rn_momc USING btree (mop_kod);


--
-- Name: rn_momc_obec_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_momc_obec_kod_idx ON rn_momc USING btree (obec_kod);


--
-- Name: rn_momc_spravobv_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_momc_spravobv_kod_idx ON rn_momc USING btree (spravobv_kod);


--
-- Name: rn_momc; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rn_momc FROM PUBLIC;
REVOKE ALL ON TABLE rn_momc FROM ruian;
GRANT ALL ON TABLE rn_momc TO ruian;
GRANT SELECT ON TABLE rn_momc TO PUBLIC;


--
-- PostgreSQL database dump complete
--

