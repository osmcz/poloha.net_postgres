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
-- Name: rn_katastralni_uzemi; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE rn_katastralni_uzemi (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    obec_kod integer,
    ma_dkm boolean,
    mluv_char_pad_2 character varying,
    mluv_char_pad_3 character varying,
    mluv_char_pad_4 character varying,
    mluv_char_pad_5 character varying,
    mluv_char_pad_6 character varying,
    mluv_char_pad_7 character varying,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    rizeni_id bigint,
    definicni_bod public.geometry,
    hranice public.geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE rn_katastralni_uzemi OWNER TO ruian;

--
-- Name: rn_katastralni_uzemi_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian; Tablespace: 
--

ALTER TABLE ONLY rn_katastralni_uzemi
    ADD CONSTRAINT rn_katastralni_uzemi_pkey PRIMARY KEY (kod);


--
-- Name: rn_katastralni_uzemi_hranice_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_katastralni_uzemi_hranice_idx ON rn_katastralni_uzemi USING gist (hranice);


--
-- Name: rn_katastralni_uzemi_obec_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_katastralni_uzemi_obec_kod_idx ON rn_katastralni_uzemi USING btree (obec_kod);


--
-- Name: rn_katastralni_uzemi; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rn_katastralni_uzemi FROM PUBLIC;
REVOKE ALL ON TABLE rn_katastralni_uzemi FROM ruian;
GRANT ALL ON TABLE rn_katastralni_uzemi TO ruian;
GRANT SELECT ON TABLE rn_katastralni_uzemi TO PUBLIC;


--
-- PostgreSQL database dump complete
--

