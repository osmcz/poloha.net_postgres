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
-- Name: datatimestamp; Type: TABLE; Schema: import; Owner: pedro
--

CREATE TABLE datatimestamp (
    ruian timestamp with time zone,
    osm timestamp with time zone,
    buildings_todo timestamp with time zone,
    landuse timestamp with time zone
);


ALTER TABLE datatimestamp OWNER TO pedro;

--
-- Name: datatimestamp; Type: ACL; Schema: import; Owner: pedro
--

GRANT SELECT ON TABLE datatimestamp TO PUBLIC;


--
-- Name: datatimestamp.ruian; Type: ACL; Schema: import; Owner: pedro
--

GRANT UPDATE(ruian) ON TABLE datatimestamp TO ruian;


--
-- Name: datatimestamp.osm; Type: ACL; Schema: import; Owner: pedro
--

GRANT UPDATE(osm) ON TABLE datatimestamp TO mapnik;


--
-- Name: datatimestamp.buildings_todo; Type: ACL; Schema: import; Owner: pedro
--

GRANT UPDATE(buildings_todo) ON TABLE datatimestamp TO mapnik;


--
-- PostgreSQL database dump complete
--

