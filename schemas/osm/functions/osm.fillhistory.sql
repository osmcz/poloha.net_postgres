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
-- Name: fillhistory(); Type: FUNCTION; Schema: osm; Owner: pedro
--

CREATE FUNCTION fillhistory() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
insert into osm.ways (way_id,changeset_id,timestamp,version,visible) 
    select id,changeset_id,timestamp,version,visible 
    from osm.current_ways;
insert into osm.way_tags (way_id,k,v,version) 
    select a.way_id,a.k,a.v,b.version 
    from osm.current_way_tags a 
    left join osm.current_ways b on a.way_id=b.id;
insert into osm.way_nodes (way_id,node_id,version,sequence_id) 
    select a.way_id,a.node_id,b.version,a.sequence_id 
    from osm.current_way_nodes a 
    left join osm.current_ways b on a.node_id=b.id;

insert into osm.relations (relation_id,changeset_id,timestamp,version,visible) 
    select id,changeset_id,timestamp,version,visible 
    from osm.current_relations;
insert into osm.relation_tags(relation_id,k,v,version) 
    select a.relation_id,a.k,a.v,b.version 
    from osm.current_relation_tags a 
    left join osm.current_relations b on a.relation_id=b.id;
insert into osm.relation_members(relation_id,member_type,member_id,member_role,version,sequence_id) 
    select a.relation_id,a.member_type,a.member_id,a.member_role,b.version,a.sequence_id 
    from osm.current_relation_members a 
    left join osm.current_relations b on a.relation_id=b.id;

insert into osm.nodes (node_id,latitude,longitude,changeset_id,visible,timestamp,tile,version)  
    select id as node_id,latitude,longitude,changeset_id,visible,timestamp,tile,version
    from osm.current_nodes;

insert into osm.node_tags (node_id,version,k,v)
    select a.node_id,b.version,a.k,a.v 
    from osm.current_node_tags a
    left join osm.current_nodes b on a.node_id=b.id;

return;
END;
$$;


ALTER FUNCTION osm.fillhistory() OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

