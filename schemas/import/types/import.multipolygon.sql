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
-- Name: multipolygon; Type: TYPE; Schema: import; Owner: pedro
--

CREATE TYPE multipolygon AS (
	building integer,
	ring integer,
	point integer,
	geom public.geometry
);


ALTER TYPE multipolygon OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

