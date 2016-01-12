--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = gis, pg_catalog;

--
-- Name: cz_hillshade_rid_seq; Type: SEQUENCE; Schema: gis; Owner: mapnik
--

CREATE SEQUENCE cz_hillshade_rid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cz_hillshade_rid_seq OWNER TO mapnik;

--
-- Name: cz_hillshade_rid_seq; Type: SEQUENCE OWNED BY; Schema: gis; Owner: mapnik
--

ALTER SEQUENCE cz_hillshade_rid_seq OWNED BY cz_hillshade.rid;


--
-- PostgreSQL database dump complete
--

