--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = ruian, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: rn_zpusob_ochrany_objektu; Type: TABLE; Schema: ruian; Owner: ruian
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
-- Name: rn_zpusob_ochrany_objektu_stavobj_kod_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE INDEX rn_zpusob_ochrany_objektu_stavobj_kod_idx ON rn_zpusob_ochrany_objektu USING btree (stavobj_kod);


--
-- Name: rn_zpusob_ochrany_objektu; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE rn_zpusob_ochrany_objektu TO PUBLIC;


--
-- PostgreSQL database dump complete
--

