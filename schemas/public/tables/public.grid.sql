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

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: grid; Type: TABLE; Schema: public; Owner: pedro
--

CREATE TABLE grid (
    kod integer,
    hranice geometry
);


ALTER TABLE grid OWNER TO pedro;

--
-- Name: grid_hranice; Type: INDEX; Schema: public; Owner: pedro
--

CREATE INDEX grid_hranice ON grid USING gist (hranice);


--
-- Name: grid; Type: ACL; Schema: public; Owner: pedro
--

GRANT SELECT ON TABLE grid TO PUBLIC;


--
-- PostgreSQL database dump complete
--

