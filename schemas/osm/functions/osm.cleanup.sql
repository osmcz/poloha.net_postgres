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
-- Name: cleanup(); Type: FUNCTION; Schema: osm; Owner: pedro
--

CREATE FUNCTION cleanup() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
truncate osm.changesets_subscribers;
delete from osm.current_node_tags where node_id in (select id from osm.current_nodes where visible=false);
delete from osm.current_way_nodes where node_id in (select id from osm.current_nodes where visible=false)
	or way_id in (select id from osm.current_ways where visible=false);
delete from osm.current_relation_members where member_type='Node' and member_id in (select id from osm.current_nodes where visible=false);

delete from osm.current_way_tags where way_id in (select id from osm.current_ways where visible=false);
delete from osm.current_relation_members where member_type='Way' and member_id in (select id from osm.current_ways where visible=false);

delete from osm.current_relation_tags where relation_id in (select id from osm.current_relations where visible=false);
delete from osm.current_relation_members where member_type='Relation' and member_id in (select id from osm.current_relations where visible=false);
delete from osm.current_relation_members where relation_id in (select id from osm.current_relations where visible=false);

delete from osm.current_nodes where visible=false;
delete from osm.current_ways where visible=false;
delete from osm.current_relations where visible=false;


drop table if exists temp_zzz;
create temp table temp_zzz as
select changeset_id from
(
select changeset_id from osm.current_nodes group by changeset_id
union
select changeset_id from osm.current_ways group by changeset_id
union
select changeset_id from osm.current_relations group by changeset_id
) as foo group by changeset_id;
create index temp_zzz_idx on temp_zzz (changeset_id);
analyze temp_zzz;
set constraints all deferred;
truncate osm.ways,osm.way_tags,osm.way_nodes,osm.relation_members,osm.relation_tags,osm.relations,osm.nodes,osm.node_tags;
delete from osm.changeset_tags where changeset_id not in (select changeset_id from temp_zzz);
delete from osm.changesets where id not in (select changeset_id from temp_zzz);
drop table temp_zzz;
return;
END;
$$;


ALTER FUNCTION osm.cleanup() OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

