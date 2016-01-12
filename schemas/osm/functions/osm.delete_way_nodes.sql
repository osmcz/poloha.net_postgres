--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osm, pg_catalog;

--
-- Name: delete_way_nodes(); Type: FUNCTION; Schema: osm; Owner: osm
--

CREATE FUNCTION delete_way_nodes() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
v_version bigint;
i smallint;
BEGIN
select into v_version version from osm.current_way_nodes a
	left join osm.current_ways b on a.way_id=b.id
	where a.way_id=old.way_id and a.node_id=old.node_id;
select into i 1 from osm.way_nodes where way_id=old.way_id and version=v_version and node_id=old.node_id;
if not found then
	perform (select osm.insert_way(old.way_id));
	insert into osm.way_nodes (way_id,node_id,version,sequence_id)
		values (old.way_id,old.node_id,v_version,old.sequence_id);
end if;
return old;
END;$$;


ALTER FUNCTION osm.delete_way_nodes() OWNER TO osm;

--
-- PostgreSQL database dump complete
--

