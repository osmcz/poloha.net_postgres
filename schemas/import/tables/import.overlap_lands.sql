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
-- Name: overlap_lands; Type: TABLE; Schema: import; Owner: pedro
--

CREATE TABLE overlap_lands (
    a_osm_id bigint,
    a_prekryva integer,
    b_osm_id bigint,
    b_prekryva integer,
    procent double precision
);


ALTER TABLE overlap_lands OWNER TO pedro;

--
-- Name: overlap_lands; Type: ACL; Schema: import; Owner: pedro
--

GRANT SELECT ON TABLE overlap_lands TO PUBLIC;


--
-- PostgreSQL database dump complete
--

