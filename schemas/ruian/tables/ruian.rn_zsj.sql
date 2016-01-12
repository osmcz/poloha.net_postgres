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
-- Name: rn_zsj; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE rn_zsj (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    katuz_kod integer,
    charakter_zsj_kod integer,
    mluv_char_pad_2 character varying,
    mluv_char_pad_3 character varying,
    mluv_char_pad_4 character varying,
    mluv_char_pad_5 character varying,
    mluv_char_pad_6 character varying,
    mluv_char_pad_7 character varying,
    vymera bigint,
    plati_od date,
    zmena_grafiky boolean,
    nz_id_globalni bigint,
    id_trans_ruian bigint,
    definicni_bod public.geometry,
    hranice public.geometry,
    item_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE rn_zsj OWNER TO ruian;

--
-- Name: rn_zsj_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian; Tablespace: 
--

ALTER TABLE ONLY rn_zsj
    ADD CONSTRAINT rn_zsj_pkey PRIMARY KEY (kod);


--
-- Name: rn_zsj_definicni_bod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_zsj_definicni_bod_idx ON rn_zsj USING gist (definicni_bod);


--
-- Name: rn_zsj_hranice_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_zsj_hranice_idx ON rn_zsj USING gist (hranice);


--
-- Name: rn_zsj_katuz_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_zsj_katuz_kod_idx ON rn_zsj USING btree (katuz_kod);


--
-- Name: save_query; Type: TRIGGER; Schema: ruian; Owner: ruian
--

CREATE TRIGGER save_query BEFORE INSERT ON rn_zsj FOR EACH ROW EXECUTE PROCEDURE public.save_query();

ALTER TABLE rn_zsj DISABLE TRIGGER save_query;


--
-- Name: rn_zsj; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rn_zsj FROM PUBLIC;
REVOKE ALL ON TABLE rn_zsj FROM ruian;
GRANT ALL ON TABLE rn_zsj TO ruian;
GRANT SELECT ON TABLE rn_zsj TO PUBLIC;


--
-- PostgreSQL database dump complete
--

