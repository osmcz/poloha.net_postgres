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
-- Name: insert_way(bigint); Type: FUNCTION; Schema: public; Owner: pedro
--

CREATE FUNCTION insert_way(bigint) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $_$
DECLARE i smallint;
BEGIN
select into i 1 from osm.ways where way_id=$1;
if not found then
	insert into osm.ways (way_id,changeset_id,"timestamp",version,visible)
		select id,changeset_id,"timestamp",version,visible
		from osm.current_ways where id=$1;
end if;
return;
END;$_$;


ALTER FUNCTION public.insert_way(bigint) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

