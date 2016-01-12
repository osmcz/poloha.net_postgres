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
-- Name: clean_duplicate_buildings(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION clean_duplicate_buildings() RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$
DECLARE
v_geom geometry;
v_rec record;
v_record record;
xml_tags xml;
xml_waynodes xml;
zachovat_osm_id bigint;
zachovat_version integer;
smazat_osm_id bigint;
smazat_version integer;
v_days integer;
cnt integer;
a_source text;
b_source text;
kurzor cursor for select tbl.*
from import.overlap_buildings_view tbl
left join gis.cz_polygon a on tbl.a_osm_id=a.osm_id
left join gis.cz_polygon b on tbl.b_osm_id=b.osm_id
where
    a_osm_id > 0
    and b_osm_id > 0
    and st_contains(v_geom,st_union(a.way,b.way))
    and not a_in3d
    and not b_in3d
    and procent > 0.55
    order by max(a_prekryva_budov,b_prekryva_budov) desc
--	limit 100
    ;
BEGIN
select into v_geom hranice from ruian.rn_stat;
truncate text_changeset;
truncate inchangeset;
insert into text_changeset(xml) values('<osm version="0.6" generator="CzechAddress">');
open kurzor;
loop
fetch kurzor into v_rec;
if not found then
    exit;
end if;

select into a_source case when current_way_tags.v is not NULL then current_way_tags.v else '' end || case when changeset_tags.v is not NULL then changeset_tags.v else '' end
    from osm.current_way_tags
    left join osm.current_ways on current_way_tags.way_id=current_ways.id
    left join osm.changeset_tags on changeset_tags.changeset_id=current_ways.changeset_id and changeset_tags.k='source'
    where current_way_tags.way_id=v_rec.a_osm_id and current_way_tags.k='source';
select into b_source case when current_way_tags.v is not NULL then current_way_tags.v else '' end || case when changeset_tags.v is not NULL then changeset_tags.v else '' end
    from osm.current_way_tags
    left join osm.current_ways on current_way_tags.way_id=current_ways.id
    left join osm.changeset_tags on changeset_tags.changeset_id=current_ways.changeset_id and changeset_tags.k='source'
    where current_way_tags.way_id=v_rec.b_osm_id and current_way_tags.k='source';
--select into a_source v from osm.current_way_tags where way_id=v_rec.a_osm_id and k='source';
--select into b_source v from osm.current_way_tags where way_id=v_rec.b_osm_id and k='source';
v_days=abs(extract('day' from v_rec.a_timestamp - v_rec.b_timestamp));
case
when v_rec.a_prekryva_budov > v_rec.b_prekryva_budov then
    zachovat_osm_id = v_rec.b_osm_id;
    zachovat_version = v_rec.b_version;
    smazat_osm_id = v_rec.a_osm_id;
    smazat_version = v_rec.a_version;
when v_rec.a_prekryva_budov < v_rec.b_prekryva_budov then
    zachovat_osm_id = v_rec.a_osm_id;
    zachovat_version = v_rec.a_version;
    smazat_osm_id = v_rec.b_osm_id;
    smazat_version = v_rec.b_version;
else	
    if v_rec.a_timestamp > v_rec.b_timestamp and v_days > 0
     or (v_days = 0 and a_source ilike '%ruian%') 
     or (v_days = 0 and v_rec.a_timestamp > v_rec.b_timestamp and b_source not ilike '%ruian%') then
	zachovat_osm_id = v_rec.a_osm_id;
	zachovat_version = v_rec.a_version;
	smazat_osm_id = v_rec.b_osm_id;
	smazat_version = v_rec.b_version;
    else
	zachovat_osm_id = v_rec.b_osm_id;
	zachovat_version = v_rec.b_version;
	smazat_osm_id = v_rec.a_osm_id;
	smazat_version = v_rec.a_version;
    end if;
end case;
if zachovat_osm_id not in (select id from inchangeset where id=zachovat_osm_id) and smazat_osm_id not in (select id from inchangeset where id=smazat_osm_id) then
insert into inchangeset(id) values(zachovat_osm_id);
insert into inchangeset(id) values(smazat_osm_id);
    select into cnt count(*)
	from osm.current_way_tags
	where
	way_id=smazat_osm_id
	and k not in (select k from osm.current_way_tags where way_id=zachovat_osm_id);
    if cnt > 0 then -- budeme pridavat tagy z mazane budovy na tu, co se ma zachovat
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
	    (select k,v from osm.current_way_tags where way_id=zachovat_osm_id
	union
	    select k,v from osm.current_way_tags where way_id = smazat_osm_id and k not in (select k from osm.current_way_tags where way_id=zachovat_osm_id)
	    ) xxz;
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
	way_id=zachovat_osm_id order by sequence_id) as foo;
	select into v_record id,visible,version from osm.current_ways where id=zachovat_osm_id;
	insert into text_changeset(xml) values (
	    xmlelement(name way,
		xmlattributes(
		    v_record.id as id,
		    'modify' as action,
		    v_record.visible as visible,
		    v_record.version as version
		),
		xml_tags,
		xml_waynodes
	    )
	);
    end if;
    select into v_record id,visible,version from osm.current_ways where id=smazat_osm_id;
    insert into text_changeset(xml) values (
	xmlelement(name way,
	    xmlattributes(
		v_record.id as id,
		'delete' as action,
		v_record.visible as visible,
		v_record.version as version
		)
	    )
	);

    end if;
end loop;
close kurzor;
insert into text_changeset(xml) values('</osm>');
update text_changeset set xml=replace(xml,'<tag/>','');
return;
END;
$$;


ALTER FUNCTION import.clean_duplicate_buildings() OWNER TO import;

--
-- PostgreSQL database dump complete
--

