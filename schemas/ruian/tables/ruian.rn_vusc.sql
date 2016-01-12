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
-- Name: rn_vusc; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE rn_vusc (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
    regsoudr_kod integer,
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


ALTER TABLE rn_vusc OWNER TO ruian;

--
-- Name: rn_vusc_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian; Tablespace: 
--

ALTER TABLE ONLY rn_vusc
    ADD CONSTRAINT rn_vusc_pkey PRIMARY KEY (kod);


--
-- Name: rn_vusc_definicni_bod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_vusc_definicni_bod_idx ON rn_vusc USING gist (definicni_bod);


--
-- Name: rn_vusc_hranice_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_vusc_hranice_idx ON rn_vusc USING gist (hranice);


--
-- Name: rn_vusc_regsoudr_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_vusc_regsoudr_kod_idx ON rn_vusc USING btree (regsoudr_kod);


--
-- Name: rn_vusc; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rn_vusc FROM PUBLIC;
REVOKE ALL ON TABLE rn_vusc FROM ruian;
GRANT ALL ON TABLE rn_vusc TO ruian;
GRANT SELECT ON TABLE rn_vusc TO PUBLIC;


--
-- PostgreSQL database dump complete
--

