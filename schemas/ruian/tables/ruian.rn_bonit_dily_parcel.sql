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
-- Name: rn_bonit_dily_parcel; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE rn_bonit_dily_parcel (
    parcela_id bigint,
    bpej_kod integer,
    vymera integer,
    id_trans_ruian bigint,
    rizeni_id bigint,
    deleted boolean DEFAULT false
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE rn_bonit_dily_parcel OWNER TO ruian;

--
-- Name: rn_bonit_dily_parcel_parcela_id_idx; Type: INDEX; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE INDEX rn_bonit_dily_parcel_parcela_id_idx ON rn_bonit_dily_parcel USING btree (parcela_id);


--
-- Name: rn_bonit_dily_parcel; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rn_bonit_dily_parcel FROM PUBLIC;
REVOKE ALL ON TABLE rn_bonit_dily_parcel FROM ruian;
GRANT ALL ON TABLE rn_bonit_dily_parcel TO ruian;
GRANT SELECT ON TABLE rn_bonit_dily_parcel TO PUBLIC;


--
-- PostgreSQL database dump complete
--

