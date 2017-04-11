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
-- Name: buildings_todo; Type: TABLE; Schema: ruian; Owner: mapnik
--

CREATE TABLE buildings_todo (
    kod bigint
);


ALTER TABLE buildings_todo OWNER TO mapnik;

--
-- Name: buildings_todo_idx; Type: INDEX; Schema: ruian; Owner: mapnik
--

CREATE INDEX buildings_todo_idx ON buildings_todo USING btree (kod);


--
-- Name: buildings_todo; Type: ACL; Schema: ruian; Owner: mapnik
--

GRANT SELECT ON TABLE buildings_todo TO PUBLIC;


--
-- PostgreSQL database dump complete
--

