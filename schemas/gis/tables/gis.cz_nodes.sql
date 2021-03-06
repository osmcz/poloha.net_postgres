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

SET search_path = gis, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cz_nodes; Type: TABLE; Schema: gis; Owner: mapnik
--

CREATE TABLE cz_nodes (
    id bigint NOT NULL,
    lat integer NOT NULL,
    lon integer NOT NULL,
    tags text[]
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE cz_nodes OWNER TO mapnik;

--
-- Name: cz_nodes cz_nodes_pkey; Type: CONSTRAINT; Schema: gis; Owner: mapnik
--

ALTER TABLE ONLY cz_nodes
    ADD CONSTRAINT cz_nodes_pkey PRIMARY KEY (id);


--
-- Name: cz_nodes; Type: ACL; Schema: gis; Owner: mapnik
--

GRANT SELECT ON TABLE cz_nodes TO PUBLIC;


--
-- PostgreSQL database dump complete
--

