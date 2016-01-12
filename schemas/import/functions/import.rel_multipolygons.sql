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
-- Name: rel_multipolygons(text, text); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION rel_multipolygons(v_key text, v_value text) RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$
-- do v_value muzeme dat i % (like)
DECLARE
-- hlavni smycka linkuje relace k outer cestam, na kterych je nezadouci tag
kurzor cursor for select * from
(
select tmp.*,st_contains(ruian.hranice,ways.way) as celevcr from temp_a tmp
left join gis.cz_polygon ways on ways.osm_id=-tmp.relid
left join ruian.rn_stat ruian on true
limit 50
) foo
where celevcr and w_key is not NULL;
-- dotahuje inner cesty, pripadne z nich tag, ktery je (bude) na relaci
kurzor2 cursor for
	select members.member_id,tags.way_id is not NULL as modifyit
	from inchangeset inp
	left join osm.current_relation_members members on members.member_type='Way' and members.relation_id=inp.id and inp.co='relation' and members.member_role='inner'
	left join osm.current_way_tags tags on tags.way_id=members.member_id and inp.co='relation' and members.member_role='inner' and tags.k=v_key and tags.v like v_value
	where inp.co='relation' and member_id is not NULL and member_id not in (select id from inchangeset where co='way' and id=member_id)
	order by id;
v_rec record;
v_record record;
xml_tags xml;
xml_waynodes xml;
xml_relationmembers xml;
v_action text;
BEGIN
truncate text_changeset;
truncate inchangeset;
drop table if exists temp_a;
-- udelame si pomocnou tabuli, ve ktere pak budeme hledat cesty (outer i inner)
create table temp_a as
select * from
(
select ways.id as wayid,relations.id as relid,w_key.v::text as w_key,r_key.v::text as r_key,count(nodes) as nodes,relationtype.relation_id is not NULL as ismultipolygon,hastag.relation_id is not NULL as hastag
from osm.current_ways ways
left join osm.current_way_nodes nodes on nodes.way_id=ways.id -- jen kvuli poctu nodu
left join osm.current_way_tags w_key on w_key.way_id=ways.id and w_key.k=v_key
left join osm.current_relation_members members on members.member_id=ways.id and members.member_role='outer'
left join osm.current_relations relations on relations.id=members.relation_id
left join osm.current_relation_tags r_key on r_key.relation_id=relations.id and r_key.k=v_key
left join osm.current_relation_tags relationtype on relations.id=relationtype.relation_id and relationtype.k='type' and relationtype.v='multipolygon'
left join osm.current_relation_tags hastag on relations.id=hastag.relation_id and hastag.k=v_key and hastag.v like v_value
group by wayid,relid,w_key,r_key,ismultipolygon,hastag
) foo
where
relid is not NULL and ismultipolygon -- jde o cestu jako soucast relace, a to relace typu multipolygon
    and w_key like v_value -- s nasim k
    and 'outer' not in (select member_role from osm.current_relation_members where member_type='Way' and member_role='outer' and member_id != foo.wayid and relation_id=foo.relid) -- a outer je jedina
    and foo.wayid not in (select member_id from osm.current_relation_members where relation_id != foo.relid and member_type='Way' and member_id=foo.wayid); -- a nemotaji se nam do toho dalsi relace
analyze temp_a;
insert into text_changeset(xml) values('<osm version="0.6" generator="CzechAddress">');
open kurzor;
loop
fetch kurzor into v_rec;
if not found then
    exit;
end if;
-- nachystame si relaci do changesetu
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
    (select k,v from osm.current_way_tags where way_id=v_rec.wayid and k=v_key and k not in
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
	case when not v_rec.hastag then 'modify' else NULL::text end as action, -- pokud ji nemenime, nebude action=modify, setrime data
        (select visible from osm.current_relations where id=v_rec.relid)  as visible,
        (select version from osm.current_relations where id=v_rec.relid) as version
        ),
	xml_tags,
	xml_relationmembers
        ));
insert into inchangeset values ('relation',v_rec.relid); -- a poznamename si, ze jsme ji do changesetu zapsali, abychom se neopakovali

-- a chystame outer cestu
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
    (select k,v from osm.current_way_tags where way_id=v_rec.wayid and k!=v_key and k not in
	(select k from osm.current_relation_tags where relation_id=v_rec.relid)
    ) foo;
insert into text_changeset(xml) values (
    xmlelement(name way,
    xmlattributes(
        v_rec.wayid as id,
	'modify' as action, -- tu menime vzdy, proto celou akci delame :-)
        (select visible from osm.current_ways where id=v_rec.wayid)  as visible,
        (select version from osm.current_ways where id=v_rec.wayid) as version
        ),
	xml_tags,
	xml_waynodes
        ));
insert into inchangeset values ('way',v_rec.wayid); -- a opet si ji poznacime


-- dotahneme vsechny uzly k ceste, abychom ji v JOSM videli, ze        
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
    insert into inchangeset values ('node'::import.co,v_record.id); -- a zase poznacime, ze jsme dany uzel zapsali, abychom se neopakovali. muze byt soucasti i jine cesty
    end loop;

end loop;
close kurzor;
drop table if exists temp_a;

-- a jdeme na inner cesty
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
    (select k,v from osm.current_way_tags where way_id=v_rec.member_id and (k != v_key or not v like v_value)
    ) foo;
insert into text_changeset(xml) values (
    xmlelement(name way,
    xmlattributes(
        v_rec.member_id as id,
        case when v_rec.modifyit then 'modify' else NULL::text end as action,
        (select visible from osm.current_ways where id=v_rec.member_id)  as visible,
        (select version from osm.current_ways where id=v_rec.member_id) as version
        ),
	xml_tags,
	xml_waynodes
        ));
-- i k nim si pritahneme uzly jen pro nase poteseni v JOSM
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
-- no a to je vse
insert into text_changeset(xml) values('</osm>');
update text_changeset set xml=replace(xml,'<tag/>','');
return;
END;
$$;


ALTER FUNCTION import.rel_multipolygons(v_key text, v_value text) OWNER TO import;

--
-- PostgreSQL database dump complete
--

