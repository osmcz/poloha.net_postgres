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
-- Name: rn_stat; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE rn_stat (
    kod integer NOT NULL,
    nazev character varying,
    nespravny boolean,
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


ALTER TABLE rn_stat OWNER TO ruian;

--
-- Name: rn_stat_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian; Tablespace: 
--

ALTER TABLE ONLY rn_stat
    ADD CONSTRAINT rn_stat_pkey PRIMARY KEY (kod);


--
-- Name: rn_stat; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rn_stat FROM PUBLIC;
REVOKE ALL ON TABLE rn_stat FROM ruian;
GRANT ALL ON TABLE rn_stat TO ruian;
GRANT SELECT ON TABLE rn_stat TO PUBLIC;


--
-- PostgreSQL database dump complete
--

