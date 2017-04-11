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

SET search_path = import, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: osm_tagy; Type: TABLE; Schema: import; Owner: import
--

CREATE TABLE osm_tagy (
    count numeric,
    k character varying(255),
    v character varying(255)
);


ALTER TABLE osm_tagy OWNER TO import;

--
-- Name: osm_tagy; Type: ACL; Schema: import; Owner: import
--

GRANT SELECT ON TABLE osm_tagy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

