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
-- Name: cz_kct; Type: TABLE; Schema: gis; Owner: mapnik
--

CREATE TABLE cz_kct (
    osm_id bigint NOT NULL,
    route text,
    name text,
    network text,
    ref text,
    length integer,
    kct_yellow text,
    kct_green text,
    kct_blue text,
    kct_red text,
    way public.geometry
);


ALTER TABLE cz_kct OWNER TO mapnik;

--
-- Name: cz_kct cz_kct_pkey; Type: CONSTRAINT; Schema: gis; Owner: mapnik
--

ALTER TABLE ONLY cz_kct
    ADD CONSTRAINT cz_kct_pkey PRIMARY KEY (osm_id);


--
-- Name: cz_kct_way; Type: INDEX; Schema: gis; Owner: mapnik
--

CREATE INDEX cz_kct_way ON cz_kct USING gist (way);


--
-- Name: cz_kct; Type: ACL; Schema: gis; Owner: mapnik
--

GRANT SELECT ON TABLE cz_kct TO PUBLIC;


--
-- PostgreSQL database dump complete
--

