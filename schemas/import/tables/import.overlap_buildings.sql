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
-- Name: overlap_buildings; Type: TABLE; Schema: import; Owner: pedro
--

CREATE TABLE overlap_buildings (
    a_osm_id bigint,
    a_prekryva_budov integer,
    b_osm_id bigint,
    b_prekryva_budov integer,
    procent double precision
);


ALTER TABLE overlap_buildings OWNER TO pedro;

--
-- Name: overlap_buildings; Type: ACL; Schema: import; Owner: pedro
--

GRANT SELECT ON TABLE overlap_buildings TO PUBLIC;


--
-- PostgreSQL database dump complete
--

