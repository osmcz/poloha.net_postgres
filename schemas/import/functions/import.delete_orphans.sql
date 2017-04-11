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

SET search_path = import, pg_catalog;

--
-- Name: delete_orphans(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION delete_orphans() RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$
DECLARE
v_rec record;
statgeom geometry;
nodes cursor for
select * from
(select distinct on (nodes.id) nodes.id,nodes.version,nodes.latitude::real/10000000 as lat, nodes.longitude::real/10000000 as lon from osm.current_nodes nodes
left join osm.current_node_tags tags on nodes.id=tags.node_id and tags.k not in (select k from osmtables.supplemental_tags) and k not ilike 'source:%' and k not ilike 'ref:%'
left join osm.current_relation_members members on nodes.id=members.member_id and members.member_type='Node'
left join osm.current_way_nodes waynodes on nodes.id=waynodes.node_id
left join osm.changesets changesets on nodes.changeset_id=changesets.id
where tags.node_id is NULL
and members.member_id is NULL
and waynodes.node_id is NULL
and nodes.visible=true
and changesets.created_at < now() - interval '10 days') foo
where import.node_in_cz(foo.id)
;
ways cursor for
select * from
(select distinct on (id) ways.id,ways.version from osm.current_ways ways
left join osm.current_way_tags tags on ways.id=tags.way_id and tags.k not in (select k from osmtables.supplemental_tags) and k not ilike 'source:%' and k not ilike 'ref:%'
left join osm.current_relation_members members on ways.id=members.member_id and members.member_type='Way'
left join osm.changesets changesets on ways.changeset_id=changesets.id
left join osm.users on users.id = changesets.user_id
where tags.way_id is NULL
and members.member_id is NULL
and ways.visible=true
and changesets.created_at < now() - interval '10 days'
and users.display_name != 'Pfadfinder2013') foo
where import.line_in_cz(foo.id)
;
relations cursor for
select distinct on (id) relations.id,relations.version from osm.current_relations relations
left join osm.current_relation_tags tags on relations.id=tags.relation_id and tags.k not in (select k from osmtables.supplemental_tags) and k not ilike 'source:%' and k not ilike 'ref:%'
left join osm.current_relation_members members on relations.id=members.member_id and members.member_type='Relation'
left join osm.current_relation_members babies on relations.id=babies.relation_id
left join osm.changesets changesets on relations.changeset_id=changesets.id
where tags.relation_id is NULL
and members.member_id is NULL
and babies.relation_id is NULL
and relations.visible=true
and changesets.created_at < now() - interval '10 days'
;
BEGIN
select into statgeom hranice from ruian.rn_stat where not deleted;
truncate text_changeset;
truncate inchangeset;
insert into text_changeset(xml) values('<osm version="0.6" generator="CzechAddress">');

open nodes;
loop
fetch nodes into v_rec;
if not found then
    exit;
end if;
if v_rec.id not in (select id from inchangeset where co='node' and id=v_rec.id) then
insert into text_changeset(xml) values (
    xmlelement(name node,
    xmlattributes(
	v_rec.id as id,
	'delete' as action,
	true as visible,
        v_rec.version as version,
        v_rec.lat as lat,
        v_rec.lon as lon
        )));
insert into inchangeset(co,id) values('node',v_rec.id);
end if;
end loop;
close nodes;

open ways;
loop
fetch ways into v_rec;
if not found then
    exit;
end if;
if v_rec.id not in (select id from inchangeset where co='way' and id=v_rec.id) and st_contains(statgeom,import.geom_from_wayid(v_rec.id)) then
insert into text_changeset(xml) values (
    xmlelement(name way,
    xmlattributes(
	v_rec.id as id,
	'delete' as action,
	true as visible,
        v_rec.version as version
        )));
insert into inchangeset(co,id) values('way',v_rec.id);
end if;
end loop;
close ways;

open relations;
loop
fetch relations into v_rec;
if not found then
    exit;
end if;
if v_rec.id not in (select id from inchangeset where co='relation' and id=v_rec.id) then
insert into text_changeset(xml) values (
    xmlelement(name relation,
    xmlattributes(
	v_rec.id as id,
	'delete' as action,
	true as visible,
        v_rec.version as version
        )));
insert into inchangeset(co,id) values('relation',v_rec.id);
end if;
end loop;
close relations;

insert into text_changeset(xml) values('</osm>');
update text_changeset set xml=replace(xml,'<tag/>','');
return;
END;
$$;


ALTER FUNCTION import.delete_orphans() OWNER TO import;

--
-- PostgreSQL database dump complete
--

