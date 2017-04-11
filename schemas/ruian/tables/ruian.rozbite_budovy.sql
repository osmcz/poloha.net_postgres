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
-- Name: rozbite_budovy; Type: TABLE; Schema: ruian; Owner: ruian
--

CREATE TABLE rozbite_budovy (
    definicni_bod public.geometry,
    hranice public.geometry,
    spojnice public.geometry,
    kod bigint
);


ALTER TABLE rozbite_budovy OWNER TO ruian;

--
-- Name: rozbite_budovy; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE rozbite_budovy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

