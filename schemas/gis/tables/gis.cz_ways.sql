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
-- Name: cz_ways; Type: TABLE; Schema: gis; Owner: mapnik
--

CREATE TABLE cz_ways (
    id bigint NOT NULL,
    nodes bigint[] NOT NULL,
    tags text[]
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE cz_ways OWNER TO mapnik;

--
-- Name: cz_ways cz_ways_pkey; Type: CONSTRAINT; Schema: gis; Owner: mapnik
--

ALTER TABLE ONLY cz_ways
    ADD CONSTRAINT cz_ways_pkey PRIMARY KEY (id);


--
-- Name: cz_ways_nodes; Type: INDEX; Schema: gis; Owner: mapnik
--

CREATE INDEX cz_ways_nodes ON cz_ways USING gin (nodes) WITH (fastupdate=off);


--
-- Name: cz_ways; Type: ACL; Schema: gis; Owner: mapnik
--

GRANT SELECT ON TABLE cz_ways TO PUBLIC;


--
-- PostgreSQL database dump complete
--

