--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import, pg_catalog;

--
-- Name: co; Type: TYPE; Schema: import; Owner: import
--

CREATE TYPE co AS ENUM (
    'node',
    'way',
    'relation'
);


ALTER TYPE co OWNER TO import;

--
-- PostgreSQL database dump complete
--

