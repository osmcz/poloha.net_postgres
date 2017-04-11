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
-- Name: landuse; Type: TABLE; Schema: ruian; Owner: pedro
--

CREATE TABLE landuse (
    kod integer,
    hranice public.geometry,
    okres_kod integer
);


ALTER TABLE landuse OWNER TO pedro;

--
-- Name: landuse_index; Type: INDEX; Schema: ruian; Owner: pedro
--

CREATE INDEX landuse_index ON landuse USING gist (hranice);


--
-- Name: landuse; Type: ACL; Schema: ruian; Owner: pedro
--

GRANT SELECT ON TABLE landuse TO PUBLIC;


--
-- PostgreSQL database dump complete
--

