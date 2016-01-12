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
-- Name: min(real, real); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION min(real, real) RETURNS real
    LANGUAGE plpgsql
    AS $_$
BEGIN
if $1 < $2 then
	return $1;
else
	return $2;
end if;
end;
$_$;


ALTER FUNCTION import.min(real, real) OWNER TO import;

--
-- Name: min(bigint, bigint); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION min(bigint, bigint) RETURNS bigint
    LANGUAGE plpgsql
    AS $_$
BEGIN
if $1 < $2 then
	return $1;
else
	return $2;
end if;
end;
$_$;


ALTER FUNCTION import.min(bigint, bigint) OWNER TO import;

--
-- PostgreSQL database dump complete
--

