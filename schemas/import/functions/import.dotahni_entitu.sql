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
-- Name: dotahni_entitu(co, bigint, text); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION dotahni_entitu(in_co co, in_id bigint, in_action text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
v_visible boolean;
v_version bigint;
xml_tags xml;
xml_waynodes xml;
xml_relationmembers xml;
v_record2 record;
BEGIN


xml_tags=NULL;
xml_waynodes=NULL;
xml_relationmembers=NULL;

case
when in_co='node' and in_action is NULL then
select into xml_tags 
xmlconcat(
    array_to_string(
    array_agg(
    xmlelement(name tag,
    xmlattributes(k as k,v as v))
    ),
    '')::xml
    )
    from osm.current_node_tags where
    node_id=in_id;
--select into v_record2 id,geom,visible,version from osm_adresy where id=in_id and co='node';
select into v_record2 id,latitude,longitude,visible,version from osm.current_nodes where id=in_id and id not in (select id from inchangeset where co='node');
if v_record2.id is not NULL then
	insert into text_changeset(xml) values (
		xmlelement(name node,
		xmlattributes(
		v_record2.id as id,
		case when in_action is not NULL then in_action else NULL end as action,
		v_record2.visible as visible,
		v_record2.version as version,
		v_record2.latitude::real/10000000 as lat,
		v_record2.longitude::real/10000000 as lon
		),
		xml_tags
		)
	);
end if;
-- raise notice '    Dotahuji uzel: %',v_record.id;


when in_co='node' and in_action ='delete' then
select into xml_tags 
xmlconcat(
    array_to_string(
    array_agg(
    xmlelement(name tag,
    xmlattributes(k as k,v as v))
    ),
    '')::xml
    )
    from osm.current_node_tags where
    node_id=in_id and k not like 'addr:%' and k not in (select tag from osmtables.delete_tags where tag=k) and
    k||v not in (select k||v from osmtables.itags_pos);
if xml_tags is not NULL or
in_id in (select node_id from osm.current_way_nodes where node_id=in_id) or
in_id in (select member_id from osm.current_relation_members where member_id=in_id and member_type='Node')
then
    in_action='modify';
end if;
--select into v_record2 id,geom,visible,version from osm_adresy where id=in_id and co='node';
select into v_record2 id,latitude,longitude,visible,version from osm.current_nodes where id=in_id;
insert into text_changeset(xml) values (
    xmlelement(name node,
    xmlattributes(
    v_record2.id as id,
    case when in_action is not NULL then in_action else NULL end as action,
    v_record2.visible as visible,
        v_record2.version as version,
    v_record2.latitude::real/10000000 as lat,
    v_record2.longitude::real/10000000 as lon
        ),
    xml_tags
        )
);




when in_co='way' and in_action is NULL then
    select into xml_tags 
    xmlconcat(
        array_to_string(
    array_agg(
        xmlelement(name tag,
        xmlattributes(k as k,v as v))
        ),
    '')::xml
        ) 
    from osm.current_way_tags where
    way_id=in_id;
    select into xml_waynodes
    xmlconcat(
        array_to_string(
    array_agg(
        xmlelement(name nd,
        xmlattributes(node_id as ref))
        ),
    '')::xml
        )
    from (select * from osm.current_way_nodes where
    way_id=in_id order by sequence_id) as foo;

--select into v_record2 id,visible,version from osm_adresy where id=in_id and co='way';
select into v_record2 id,visible,version from osm.current_ways where id=in_id and id not in (select id from inchangeset where co='way');
if v_record2.id is not NULL then
insert into text_changeset(xml) values (
    xmlelement(name way,
    xmlattributes(
        v_record2.id as id,
    case when in_action is not NULL then in_action else NULL end as action,
        v_record2.visible  as visible,
        v_record2.version as version
        ),
    xml_tags,
    xml_waynodes
        )
);
for v_record2 in select id,visible,version,latitude,longitude
from osm.current_nodes where id in 
(select node_id from osm.current_way_nodes where way_id = in_id) and id not in (select id from inchangeset where co='node') loop
    insert into text_changeset(xml) values(
    xmlelement(name node,xmlattributes(
    v_record2.id as id,
    v_record2.visible as visible,
    v_record2.version as version,
    v_record2.latitude::double precision /10000000 as lat,
    v_record2.longitude:: double precision /10000000 as lon)
    )
    );
end loop;
end if;


when in_co='way' and in_action = 'delete' then
    select into xml_tags 
    xmlconcat(
        array_to_string(
    array_agg(
        xmlelement(name tag,
        xmlattributes(k as k,v as v))
        ),
    '')::xml
        ) 
    from osm.current_way_tags where
    way_id=in_id and k not like 'addr:%' and k not in (select tag from osmtables.delete_tags where tag=k) and
    k||v not in (select k||v from osmtables.itags_pos);

in_action='modify';

    select into xml_waynodes
    xmlconcat(
        array_to_string(
    array_agg(
        xmlelement(name nd,
        xmlattributes(node_id as ref))
        ),
    '')::xml
        )
    from (select * from osm.current_way_nodes where
    way_id=in_id order by sequence_id) as foo;
--select into v_record2 id,visible,version from osm_adresy where id=in_id and co='way';
select into v_record2 id,visible,version from osm.current_ways where id=in_id;

insert into text_changeset(xml) values (
    xmlelement(name way,
    xmlattributes(
        v_record2.id as id,
    case when in_action is not NULL then in_action else NULL end as action,
        v_record2.visible  as visible,
        v_record2.version as version
        ),
    xml_tags,
    xml_waynodes
        )
);
for v_record2 in select id,visible,version,latitude,longitude
from osm.current_nodes where id in 
(select node_id from osm.current_way_nodes where way_id = in_id) loop
    insert into text_changeset(xml) values(
    xmlelement(name node,xmlattributes(
    v_record2.id as id,
    v_record2.visible as visible,
    v_record2.version as version,
    v_record2.latitude::double precision /10000000 as lat,
    v_record2.longitude:: double precision /10000000 as lon)
    )
    );
end loop;





when in_co='relation' and in_action is NULL then
    select into xml_tags
    xmlconcat(
        array_to_string(
    array_agg(
        xmlelement(name tag,
        xmlattributes(k as k,v as v))
        ),
    '')::xml
        )
    from osm.current_relation_tags where
    relation_id=in_id;
    select into xml_relationmembers
    xmlconcat(
        array_to_string(
    array_agg(
        xmlelement(name member,
        xmlattributes(lower(member_type::text) as type,member_id as ref,member_role as role))
        ),
    '')::xml
        )
    from (select * from osm.current_relation_members where
    relation_id=in_id order by sequence_id) as foo;
select into v_record2 id,visible,version from osm.current_relations where id=in_id and id not in (select id from inchangeset where co='relation');
if v_record2.id is not NULL then
insert into text_changeset(xml) values (
    xmlelement(name relation,
    xmlattributes(
        v_record2.id as id,
    case when in_action is not NULL then in_action else NULL end as action,
        v_record2.visible  as visible,
        v_record2.version as version
        ),
    xml_tags,
    xml_relationmembers
        )
);
end if;




when in_co='relation' and in_action = 'delete'  then
    select into xml_tags
    xmlconcat(
        array_to_string(
    array_agg(
        xmlelement(name tag,
        xmlattributes(k as k,v as v))
        ),
    '')::xml
        )
    from osm.current_relation_tags where
    relation_id=in_id and k not like 'addr:%' and k not in (select tag from osmtables.delete_tags where tag=k) and
    k||v not in (select k||v from osmtables.itags_pos);

in_action='modify';

    select into xml_relationmembers
    xmlconcat(
        array_to_string(
    array_agg(
        xmlelement(name member,
        xmlattributes(lower(member_type::text) as type,member_id as ref,member_role as role))
        ),
    '')::xml
        )
    from (select * from osm.current_relation_members where
    relation_id=in_id order by sequence_id) as foo;
select into v_record2 id,visible,version from osm.current_relations where id=in_id;
insert into text_changeset(xml) values (
    xmlelement(name relation,
    xmlattributes(
        v_record2.id as id,
    case when in_action is not NULL then in_action else NULL end as action,
        v_record2.visible  as visible,
        v_record2.version as version
        ),
    xml_tags,
    xml_relationmembers
        )
);







end case;

return;
END;
$$;


ALTER FUNCTION import.dotahni_entitu(in_co co, in_id bigint, in_action text) OWNER TO import;

--
-- PostgreSQL database dump complete
--

