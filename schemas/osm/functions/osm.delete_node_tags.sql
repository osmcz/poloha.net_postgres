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
-- Name: delete_node_tags(); Type: FUNCTION; Schema: osm; Owner: osm
--

CREATE FUNCTION delete_node_tags() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
v_version bigint;
i smallint;
BEGIN
select into v_version version from osm.current_node_tags a
	left join osm.current_nodes b on a.node_id=b.id
	where a.node_id=old.node_id and a.k=old.k;
select into i 1 from osm.node_tags where node_id=old.node_id and version=v_version and k=old.k;
if not found then
	perform (select osm.insert_node(old.node_id));
	insert into osm.node_tags (node_id,k,v,version)
		values (old.node_id,old.k,old.v,v_version);
end if;
return old;
END;$$;


ALTER FUNCTION osm.delete_node_tags() OWNER TO osm;

--
-- PostgreSQL database dump complete
--

