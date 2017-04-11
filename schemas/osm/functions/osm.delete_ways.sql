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

SET search_path = osm, pg_catalog;

--
-- Name: delete_ways(); Type: FUNCTION; Schema: osm; Owner: osm
--

CREATE FUNCTION delete_ways() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE i smallint;
BEGIN
select into i 1 from osm.ways where way_id=old.id and version=old.version;
if not found then
	insert into osm.ways (way_id,changeset_id,"timestamp",version,visible)
		values (old.id,old.changeset_id,old."timestamp",old.version,old.visible);
end if;
return old;
END;$$;


ALTER FUNCTION osm.delete_ways() OWNER TO osm;

--
-- PostgreSQL database dump complete
--

