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

SET search_path = public, pg_catalog;

--
-- Name: maptile_for_point(bigint, bigint, integer); Type: FUNCTION; Schema: public; Owner: pedro
--

CREATE FUNCTION maptile_for_point(bigint, bigint, integer) RETURNS integer
    LANGUAGE c STRICT
    AS '$libdir/libpgosm', 'maptile_for_point';


ALTER FUNCTION public.maptile_for_point(bigint, bigint, integer) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

