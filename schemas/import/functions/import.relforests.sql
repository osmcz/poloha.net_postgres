--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import, pg_catalog;

--
-- Name: relforests(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION relforests() RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$
DECLARE
kurzor cursor for select * from
(
select blb.*,st_contains(ruian.hranice,ways.way) as celevcr from temp_a blb
left join gis.cz_polygon ways on ways.osm_id=-blb.relid
--left join osm.current_way_tags tags on tags.way_id=blb.wayid
left join ruian.rn_stat ruian on true
limit 5) foo
where celevcr and wlanduse is not NULL;
kurzor2 cursor for
	select members.member_id
	from inchangeset inp
	left join osm.current_relation_members members on members.member_type='Way' and members.relation_id=inp.id and inp.co='relation' and members.member_role='inner'
	where inp.co='relation' and member_id is not NULL and member_id not in (select id from inchangeset where co='way' and id=member_id)
	order by id;
v_rec record;
v_record record;
xml_tags xml;
xml_waynodes xml;
xml_relationmembers xml;
BEGIN
truncate text_changeset;
truncate inchangeset;
drop table if exists temp_a;
create table temp_a as
select * from
(
select ways.id as wayid,relations.id as relid,wlanduse.v::text as wlanduse,rlanduse.v::text as rlanduse,count(nodes) as nodes,source.v as source
from osm.current_ways ways
left join osm.current_way_nodes nodes on nodes.way_id=ways.id
left join osm.current_way_tags wlanduse on wlanduse.way_id=ways.id and wlanduse.k='landuse'
left join osm.current_way_tags source on source.way_id=ways.id and source.k='source'
left join osm.current_relation_members members on members.member_id=ways.id and members.member_role='outer'
left join osm.current_relations relations on relations.id=members.relation_id
left join osm.current_relation_tags rlanduse on rlanduse.relation_id=relations.id and rlanduse.k='landuse'
group by wayid,relid,wlanduse,rlanduse,source
) foo
where
relid is not NULL
    and (
    wlanduse = 'forest' 
    --or rlanduse = 'forest'
    )
    -- and source='uhul:wms'
    and 'outer' not in (select member_role from osm.current_relation_members where member_type='Way' and member_role='outer' and member_id != foo.wayid and relation_id=foo.relid)
    and foo.wayid not in (select member_id from osm.current_relation_members where relation_id != foo.relid and member_type='Way' and member_id=foo.wayid)
    -- and relid not in (select relation_id from osm.current_relation_tags where relation_id=foo.relid and k != 'type' and v != 'multipolygon')
;
analyze temp_a;
insert into text_changeset(xml) values('<osm version="0.6" generator="CzechAddress">');
open kurzor;
loop
fetch kurzor into v_rec;
if not found then
    exit;
end if;

xml_tags=NULL;
xml_waynodes=NULL;
xml_relationmembers=NULL;


    select into xml_tags
    xmlconcat(
        array_to_string(
	array_agg(
	    xmlelement(name tag,
	    xmlattributes(k as k,v as v))
	    ),
	'')::xml
        )
    from 
    (select k,v from osm.current_relation_tags where relation_id=v_rec.relid
    union
    (select k,v from osm.current_way_tags where way_id=v_rec.wayid and k='landuse' and k not in
	(select k from osm.current_relation_tags where relation_id=v_rec.relid))
    ) foo;
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
    relation_id=v_rec.relid order by sequence_id) as foo;
insert into text_changeset(xml) values (
    xmlelement(name relation,
    xmlattributes(
        v_rec.relid as id,
	'modify' as action,
        (select visible from osm.current_relations where id=v_rec.relid)  as visible,
        (select version from osm.current_relations where id=v_rec.relid) as version
        ),
	xml_tags,
	xml_relationmembers
        ));
insert into inchangeset values ('relation',v_rec.relid);


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
    way_id=v_rec.wayid order by sequence_id) as foo;
    select into xml_tags
    xmlconcat(
        array_to_string(
	array_agg(
	    xmlelement(name tag,
	    xmlattributes(k as k,v as v))
	    ),
	'')::xml
        )
    from 
    (select k,v from osm.current_way_tags where way_id=v_rec.wayid and k!='landuse' and k not in
	(select k from osm.current_relation_tags where relation_id=v_rec.relid)
    ) foo;
insert into text_changeset(xml) values (
    xmlelement(name way,
    xmlattributes(
        v_rec.wayid as id,
	'modify' as action,
        (select visible from osm.current_ways where id=v_rec.wayid)  as visible,
        (select version from osm.current_ways where id=v_rec.wayid) as version
        ),
	xml_tags,
	xml_waynodes
        ));
insert into inchangeset values ('way',v_rec.wayid);


        
    for v_record in select id,visible,version,latitude,longitude
    from osm.current_nodes where id in 
    (select node_id from osm.current_way_nodes where way_id = v_rec.wayid) and id not in (select id from inchangeset where co='node') loop
    insert into text_changeset(xml) values(
    xmlelement(name node,xmlattributes(
    v_record.id as id,
    v_record.visible as visible,
    v_record.version as version,
    v_record.latitude::double precision /10000000 as lat,
    v_record.longitude:: double precision /10000000 as lon)
	        )
    );
    insert into inchangeset values ('node'::import.co,v_record.id);
    end loop;

end loop;
close kurzor;
drop table if exists temp_a;

open kurzor2;
loop
fetch kurzor2 into v_rec;
if not found then
    exit;
end if;
if v_rec.member_id not in (select id from inchangeset where co='way' and id=v_rec.member_id) then
	insert into inchangeset values('way',v_rec.member_id);




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
    way_id=v_rec.member_id order by sequence_id) as foo;
    select into xml_tags
    xmlconcat(
        array_to_string(
	array_agg(
	    xmlelement(name tag,
	    xmlattributes(k as k,v as v))
	    ),
	'')::xml
        )
    from 
    (select k,v from osm.current_way_tags where way_id=v_rec.member_id 
    ) foo;
insert into text_changeset(xml) values (
    xmlelement(name way,
    xmlattributes(
        v_rec.member_id as id,
        (select visible from osm.current_ways where id=v_rec.member_id)  as visible,
        (select version from osm.current_ways where id=v_rec.member_id) as version
        ),
	xml_tags,
	xml_waynodes
        ));

    for v_record in select id,visible,version,latitude,longitude
    from osm.current_nodes where id in 
    (select node_id from osm.current_way_nodes where way_id = v_rec.member_id) and id not in (select id from inchangeset where co='node') loop
    insert into text_changeset(xml) values(
    xmlelement(name node,xmlattributes(
    v_record.id as id,
    v_record.visible as visible,
    v_record.version as version,
    v_record.latitude::double precision /10000000 as lat,
    v_record.longitude:: double precision /10000000 as lon)
	        )
    );
    insert into inchangeset values ('node'::import.co,v_record.id);
    end loop;





end if;
end loop;
close kurzor2;

insert into text_changeset(xml) values('</osm>');
update text_changeset set xml=replace(xml,'<tag/>','');
return;
END;
$$;


ALTER FUNCTION import.relforests() OWNER TO import;

--
-- PostgreSQL database dump complete
--

