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
-- Name: cz_rels; Type: TABLE; Schema: gis; Owner: mapnik
--

CREATE TABLE cz_rels (
    id bigint NOT NULL,
    way_off smallint,
    rel_off smallint,
    parts bigint[],
    members text[],
    tags text[]
);


ALTER TABLE cz_rels OWNER TO mapnik;

--
-- Name: cz_rels cz_rels_pkey; Type: CONSTRAINT; Schema: gis; Owner: mapnik
--

ALTER TABLE ONLY cz_rels
    ADD CONSTRAINT cz_rels_pkey PRIMARY KEY (id);


--
-- Name: cz_rels_parts; Type: INDEX; Schema: gis; Owner: mapnik
--

CREATE INDEX cz_rels_parts ON cz_rels USING gin (parts) WITH (fastupdate=off);


--
-- Name: cz_rels; Type: ACL; Schema: gis; Owner: mapnik
--

GRANT SELECT ON TABLE cz_rels TO PUBLIC;


--
-- PostgreSQL database dump complete
--

