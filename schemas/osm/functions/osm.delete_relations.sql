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
-- Name: delete_relations(); Type: FUNCTION; Schema: osm; Owner: osm
--

CREATE FUNCTION delete_relations() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE i smallint;
BEGIN
select into i 1 from osm.relations where relation_id=old.id and version=old.version;
if not found then
	insert into osm.relations (relation_id,changeset_id,"timestamp",version,visible)
		values (old.id,old.changeset_id,old."timestamp",old.version,old.visible);
end if;
return old;
END;$$;


ALTER FUNCTION osm.delete_relations() OWNER TO osm;

--
-- PostgreSQL database dump complete
--

