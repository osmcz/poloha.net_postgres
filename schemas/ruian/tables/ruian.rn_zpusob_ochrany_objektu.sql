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
-- Name: rn_zpusob_ochrany_objektu; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE rn_zpusob_ochrany_objektu (
    stavobj_kod integer,
    kod integer,
    zpusob_ochrany_kod integer,
    id_trans_ruian bigint,
    rizeni_id bigint,
    deleted boolean DEFAULT false
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE rn_zpusob_ochrany_objektu OWNER TO ruian;

--
-- Name: rn_zpusob_ochrany_objektu_stavobj_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_zpusob_ochrany_objektu_stavobj_kod_idx ON rn_zpusob_ochrany_objektu USING btree (stavobj_kod);


--
-- Name: rn_zpusob_ochrany_objektu; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rn_zpusob_ochrany_objektu FROM PUBLIC;
REVOKE ALL ON TABLE rn_zpusob_ochrany_objektu FROM ruian;
GRANT ALL ON TABLE rn_zpusob_ochrany_objektu TO ruian;
GRANT SELECT ON TABLE rn_zpusob_ochrany_objektu TO PUBLIC;


--
-- PostgreSQL database dump complete
--

