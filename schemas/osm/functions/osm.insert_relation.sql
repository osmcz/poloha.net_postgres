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
-- Name: insert_relation(bigint); Type: FUNCTION; Schema: osm; Owner: osm
--

CREATE FUNCTION insert_relation(bigint) RETURNS void
    LANGUAGE plpgsql COST 10
    AS $_$
DECLARE i smallint;
BEGIN
select into i 1 from osm.relations a,osm.current_relations b  where a.relation_id=$1 and b.id=$1 and a.version=b.version;
if not found then
	insert into osm.relations (relation_id,changeset_id,"timestamp",version,visible)
		select id,changeset_id,"timestamp",version,visible
		from osm.current_relations where id=$1;
end if;
return;
END;$_$;


ALTER FUNCTION osm.insert_relation(bigint) OWNER TO osm;

--
-- PostgreSQL database dump complete
--

