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
-- Name: insert_node(bigint); Type: FUNCTION; Schema: public; Owner: pedro
--

CREATE FUNCTION insert_node(bigint) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $_$
DECLARE i smallint;
BEGIN
select into i 1 from osm.nodes where node_id=$1;
if not found then
	insert into osm.nodes (node_id,latitude,longitude,changeset_id,visible,"timestamp",tile,version)
		select id,latitude,longitude,changeset_id,visible,"timestamp",tile,version
		from osm.current_nodes where id=$1;
end if;
return;
END;$_$;


ALTER FUNCTION public.insert_node(bigint) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

