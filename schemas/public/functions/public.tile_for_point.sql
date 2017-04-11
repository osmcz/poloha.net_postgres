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
-- Name: tile_for_point(integer, integer); Type: FUNCTION; Schema: public; Owner: pedro
--

CREATE FUNCTION tile_for_point(integer, integer) RETURNS bigint
    LANGUAGE c STRICT
    AS '$libdir/libpgosm', 'tile_for_point';


ALTER FUNCTION public.tile_for_point(integer, integer) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

