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
-- Name: delete_nodes(); Type: FUNCTION; Schema: osm; Owner: osm
--

CREATE FUNCTION delete_nodes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE i smallint;
BEGIN
select into i 1 from osm.nodes where node_id=old.id and version=old.version;
if not found then
	insert into osm.nodes (node_id,latitude,longitude,changeset_id,visible,"timestamp",tile,version)
		values (old.id,old.latitude,old.longitude,old.changeset_id,old.visible,old."timestamp",old.tile,old.version);
end if;
return old;
END;$$;


ALTER FUNCTION osm.delete_nodes() OWNER TO osm;

--
-- PostgreSQL database dump complete
--

