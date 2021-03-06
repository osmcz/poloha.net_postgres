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

SET search_path = jsontiles, pg_catalog;

--
-- Name: sinh(double precision); Type: FUNCTION; Schema: jsontiles; Owner: pedro
--

CREATE FUNCTION sinh(n double precision) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE COST 1
    AS $$
declare
BEGIN
return  (1 - power(2.7182818284, -2*n)) / (2 * power(2.7182818284, -n));
  END;
$$;


ALTER FUNCTION jsontiles.sinh(n double precision) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

