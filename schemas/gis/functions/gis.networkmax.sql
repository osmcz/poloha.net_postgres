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

SET search_path = gis, pg_catalog;

--
-- Name: networkmax(text, text); Type: FUNCTION; Schema: gis; Owner: pedro
--

CREATE FUNCTION networkmax(state text, p text) RETURNS text
    LANGUAGE plpgsql
    AS $$
declare
	a smallint;
	b smallint;
BEGIN
	IF p IS NULL THEN
		RETURN state;
	END IF;
	if state is NULL then
		return p;
	end if;
	select into a prio from osmtables.networkmax where hodnota=p;
	if a is NULL then
		return state;
	end if;
	select into b prio from osmtables.networkmax where hodnota=state;
	if b is NULL then
		return p;
	end if;
	if a > b then
		return p;
	end if;
	return state;
  END;
$$;


ALTER FUNCTION gis.networkmax(state text, p text) OWNER TO pedro;

--
-- Name: networkmax(text); Type: AGGREGATE; Schema: gis; Owner: pedro
--

CREATE AGGREGATE networkmax(text) (
    SFUNC = gis.networkmax,
    STYPE = text
);


ALTER AGGREGATE gis.networkmax(text) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

