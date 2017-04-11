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

SET search_path = osm, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: relation_tags; Type: TABLE; Schema: osm; Owner: osm
--

CREATE TABLE relation_tags (
    relation_id bigint DEFAULT (0)::bigint NOT NULL,
    k character varying(255) DEFAULT ''::character varying NOT NULL,
    v character varying(255) DEFAULT ''::character varying NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE relation_tags OWNER TO osm;

--
-- Name: relation_tags relation_tags_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY relation_tags
    ADD CONSTRAINT relation_tags_pkey PRIMARY KEY (relation_id, version, k);


--
-- Name: relation_tags; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE relation_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

