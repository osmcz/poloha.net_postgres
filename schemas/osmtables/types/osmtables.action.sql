--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osmtables, pg_catalog;

--
-- Name: action; Type: TYPE; Schema: osmtables; Owner: pedro
--

CREATE TYPE action AS ENUM (
    'I',
    'U',
    'D'
);


ALTER TYPE action OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

