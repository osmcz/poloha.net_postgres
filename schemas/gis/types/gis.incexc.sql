--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = gis, pg_catalog;

--
-- Name: incexc; Type: TYPE; Schema: gis; Owner: pedro
--

CREATE TYPE incexc AS ENUM (
    'I',
    'E'
);


ALTER TYPE incexc OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

