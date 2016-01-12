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
-- Name: adresni_misto_timestamp; Type: TABLE; Schema: osmtables; Owner: import0; Tablespace: 
--

CREATE TABLE adresni_misto_timestamp (
    kod integer,
    item_timestamp timestamp without time zone
);


ALTER TABLE adresni_misto_timestamp OWNER TO import0;

--
-- PostgreSQL database dump complete
--

