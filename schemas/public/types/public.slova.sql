--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: slova; Type: TYPE; Schema: public; Owner: pedro
--

CREATE TYPE slova AS (
	cizi text,
	cesky text
);


ALTER TYPE slova OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

