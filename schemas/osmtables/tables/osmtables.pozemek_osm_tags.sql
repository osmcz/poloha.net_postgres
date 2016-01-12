--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osmtables, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: pozemek_osm_tags; Type: TABLE; Schema: osmtables; Owner: marian; Tablespace: 
--

CREATE TABLE pozemek_osm_tags (
    druh_kod smallint,
    druh_nazev text,
    druh_zkratka text,
    zpusob_vyuziti_kod smallint,
    zpusob_vyuziti_nazev text,
    zpusob_vyziti_zkratka text,
    osmtag_k text,
    osmtag_v text
);


ALTER TABLE pozemek_osm_tags OWNER TO marian;

--
-- PostgreSQL database dump complete
--

