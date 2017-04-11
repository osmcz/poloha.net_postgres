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

SET search_path = ruian, pg_catalog;

--
-- Name: nextokres(smallint); Type: FUNCTION; Schema: ruian; Owner: pedro
--

CREATE FUNCTION nextokres(ithread smallint) RETURNS integer
    LANGUAGE plpgsql COST 1
    AS $$
DECLARE
iokres integer;
BEGIN
select into iokres kod from ruian.tmplands_okresy where not inprogress and not done and thread=ithread limit 1;
update ruian.tmplands_okresy set inprogress=true where kod=iokres;
return iokres;
END;
$$;


ALTER FUNCTION ruian.nextokres(ithread smallint) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

