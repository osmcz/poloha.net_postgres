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
-- Name: badlands; Type: TABLE; Schema: public; Owner: pedro
--

CREATE TABLE badlands (
    id bigint,
    hranice geometry
);


ALTER TABLE badlands OWNER TO pedro;

--
-- Name: badlands_idx; Type: INDEX; Schema: public; Owner: pedro
--

CREATE INDEX badlands_idx ON badlands USING gist (hranice);


--
-- Name: badlands; Type: ACL; Schema: public; Owner: pedro
--

GRANT SELECT ON TABLE badlands TO PUBLIC;


--
-- PostgreSQL database dump complete
--

