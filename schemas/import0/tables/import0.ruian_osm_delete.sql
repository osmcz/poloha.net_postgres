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

SET search_path = import0, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ruian_osm_delete; Type: TABLE; Schema: import0; Owner: import0
--

CREATE TABLE ruian_osm_delete (
    ruianid bigint,
    osmid bigint,
    level smallint,
    deleteit boolean,
    co import.co,
    reallydelete boolean DEFAULT false
);


ALTER TABLE ruian_osm_delete OWNER TO import0;

--
-- Name: ruian_osm_delete; Type: ACL; Schema: import0; Owner: import0
--

GRANT SELECT ON TABLE ruian_osm_delete TO PUBLIC;


--
-- PostgreSQL database dump complete
--

