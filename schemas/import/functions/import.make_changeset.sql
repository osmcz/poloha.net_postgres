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
-- Name: make_changeset(boolean); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION make_changeset(update_mode boolean) RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$
DECLARE
v_boolean boolean;
v_zpracovat boolean;
v_addsuburb boolean;
v_addcity boolean;
v_addcountry boolean;
v_czgeom geometry;
v_czboundary geometry;
v_co import.co;
v_ruianid bigint;
v_osmid bigint;
v_conscriptionnumber text;
v_provisionalnumber text;
v_streetnumber text;
v_housenumber text;
v_street text;
v_place text;
v_suburb text;
v_city text;
v_postcode text;
v_osmgeom geometry;
v_ruiangeom geometry;
v_geom geometry;
v_visible boolean;
v_version bigint;
v_autocreate boolean;
v_source text;
v_sourceaddr text;
v_refruian text;
v_isin text;
xml_tags xml;
xml_waynodes xml;
xml_relationmembers xml;
v_record record;
v_record2 record;
v_osmrecord record;
v_kod_obce integer;
v_kod_momc integer;
v_polygon geometry;
v_sogeom geometry;
v_am_so_distance double precision;
kurzor cursor for select pg.co,pg.kod,pg.id,pg.cislo_popisne,pg.cislo_evidencni,pg.cislo_orientacni,
    pg.cislo_domu,pg.ulice,pg.cast_obce,pg.mestska_cast,pg.obec,pg.psc,pg.osmgeom,pg.ruiangeom,
    case
    when so.hranice is not NULL then st_centroid(so.hranice)
    else
    so.definicni_bod
    end as sogeom,
    pg.autocreate,pg.source,pg.sourceaddr,pg.refruian,pg.visible,pg.version,pg.is_in,pg.kod_obce,pg.kod_momc,pg.am_so_distance
    from parovane_geom pg
    left join ruian.rn_adresni_misto am on am.kod=pg.kod
    left join ruian.rn_stavebni_objekt so on so.kod=am.stavobj_kod
    where autocreate;
kurzor2 cursor for select co,id from morewarnings;
kurzor3 cursor for
	select id,co from (
		select id,co,geom from import.osm_adresy
		where v_polygon && geom
		and co::text||id::text not in
			(select co::text||osmid::text from ruian_osm where osmid is not NULL)
		) as foo
		where st_intersects(v_polygon,geom);
BEGIN
alter sequence new_nodes restart;
truncate text_changeset;
alter sequence text_changeset_id_seq restart;
v_boolean=false;
select into v_czgeom way from gis.cz_polygon where admin_level='2';
if not found then
	raise exception 'Problem s hranicemi CR';
end if;
v_czboundary=st_boundary(v_czgeom);
-- insert into text_changeset(xml) values('<?xml version="1.0"?>');
insert into text_changeset(xml) values('<osm version="0.6" generator="CZ_ADDRESS_RUIAN_BOT">');
open kurzor;
loop
fetch kurzor into v_co,v_ruianid,v_osmid,
    v_conscriptionnumber,v_provisionalnumber,v_streetnumber,v_housenumber,
    v_street,v_place,v_suburb,v_city,v_postcode,v_osmgeom,v_ruiangeom,v_sogeom,
    v_autocreate,v_source,v_sourceaddr,v_refruian,v_visible,v_version,v_isin,v_kod_obce,v_kod_momc,v_am_so_distance;
if not found then
    exit;
end if;
xml_tags=NULL;
xml_waynodes=NULL;
xml_relationmembers=NULL;
v_zpracovat=false;
v_addsuburb=false;
v_addcity=false;
v_addcountry=false;
select into v_osmrecord * from import.osm_adresy where co=v_co and id=v_osmid;
if not found or v_osmid is NULL then
	v_zpracovat=true;
end if;
if v_conscriptionnumber != v_osmrecord.conscriptionnumber or (v_conscriptionnumber is NULL and v_osmrecord.conscriptionnumber is not NULL) or (v_conscriptionnumber is not NULL and v_osmrecord.conscriptionnumber is NULL) then
	v_zpracovat=true;
end if;
if v_provisionalnumber != v_osmrecord.provisionalnumber or (v_provisionalnumber is NULL and v_osmrecord.provisionalnumber is not NULL) or (v_provisionalnumber is not NULL and v_osmrecord.provisionalnumber is NULL) then
	v_zpracovat=true;
end if;
if v_streetnumber != v_osmrecord.streetnumber or (v_streetnumber is NULL and v_osmrecord.streetnumber is not NULL) or (v_streetnumber is not NULL and v_osmrecord.streetnumber is NULL) then
	v_zpracovat=true;
end if;
if v_housenumber != v_osmrecord.housenumber or (v_housenumber is NULL and v_osmrecord.housenumber is not NULL) or (v_housenumber is not NULL and v_osmrecord.housenumber is NULL) then
	v_zpracovat=true;
end if;
if v_street != v_osmrecord.street or (v_street is NULL and v_osmrecord.street is not NULL) or (v_street is not NULL and v_osmrecord.street is NULL) then
	v_zpracovat=true;
end if;
if v_postcode != v_osmrecord.postcode or (v_postcode is NULL and v_osmrecord.postcode is not NULL) or (v_postcode is not NULL and v_osmrecord.postcode is NULL) then
	v_zpracovat=true;
end if;
if v_place != v_osmrecord.place or (v_place is NULL and v_osmrecord.place is not NULL) or (v_place is not NULL and v_osmrecord.place is NULL and v_osmrecord.street is NULL) then
	v_zpracovat=true;
end if;
if (v_suburb != v_osmrecord.suburb and v_osmrecord.suburb is not NULL and v_suburb is not NULL) or (v_osmrecord.suburb is not NULL and v_suburb is NULL) then
	v_zpracovat=true;
end if;
if v_osmrecord.suburb is not NULL then
	v_addsuburb=true;
end if;
if (v_city != v_osmrecord.city and v_osmrecord.city is not NULL and v_city is not NULL) or (v_osmrecord.city is not NULL and v_city is NULL) then
	v_zpracovat=true;
end if;
if v_osmrecord.city is not NULL then
	v_addcity=true;
end if;
if 'CZ' != v_osmrecord.country and v_osmrecord.country is not NULL then
	v_zpracovat=true;
end if;
if v_osmrecord.country is not NULL then
	v_addcountry=true;
end if;
if v_co is NULL then
	v_geom = v_ruiangeom;
else
	v_geom = v_osmgeom;
end if;
if v_kod_momc is not NULL then
	select into v_polygon hranice from ruian.rn_momc where kod=v_kod_momc;
	if v_polygon is NULL then
		v_addsuburb=true;
	end if;
	if not st_contains(v_polygon,v_geom) then
		v_addsuburb=true;
	end if;
end if;
if v_kod_obce is not NULL then
	select into v_polygon hranice from ruian.rn_obec where kod=v_kod_obce;
	if v_polygon is NULL then
		v_addcity=true;
	end if;
	if not st_contains(v_polygon,v_geom) then
		v_addcity=true;
	end if;
end if;
-- if not st_contains(v_czgeom,v_geom) then
-- 	v_addcountry=true;
-- end if;
-- if distance_meters(v_geom,v_czboundary) < 100 then
-- 	v_addcountry=true;
-- end if;
case
when v_co='node' then
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
    node_id=v_osmid and k not in
    (select tag from osmtables.itags) and k || v not in
    (select k || v from osmtables.itags_pos);
when v_co='way' then
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
    way_id=v_osmid and k not in
    (select tag from osmtables.itags) and k || v not in
    (select k || v from osmtables.itags_pos);
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
    way_id=v_osmid order by sequence_id) as foo;
when v_co='relation' then
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
    relation_id=v_osmid and k not in
    (select tag from osmtables.itags) and k || v not in
    (select k || v from osmtables.itags_pos);
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
    relation_id=v_osmid order by sequence_id) as foo;
else
end case;

insert into text_changeset(xml) values (
case
when v_co='node' or v_co is NULL then
    xmlelement(name node,
    xmlattributes(
        case when v_co is not NULL then
	v_osmid
	else nextval('new_nodes')
        end as id,
        case
		when v_co is not NULL and v_zpracovat then 'modify'
		when v_co is not NULL and not v_zpracovat then NULL
		else 'create'
        end as action,
        case when v_co is not NULL then
	v_visible 
	else true
        end as visible,
        v_version as version,
        case
        when v_co is not NULL then st_y(st_transform(v_osmgeom,4326))
	when v_co is NULL and v_am_so_distance > 50 then st_y(st_transform(v_sogeom,4326))
	else st_y(st_transform(v_ruiangeom,4326))
        end as lat,
        case
        when v_co is not NULL then st_x(st_transform(v_osmgeom,4326))
	when v_co is NULL and v_am_so_distance > 50 then st_x(st_transform(v_sogeom,4326))
	else st_x(st_transform(v_ruiangeom,4326))
        end as lon
        ),
        xmlelement(
	name tag,xmlattributes(
	    case when v_conscriptionnumber is not NULL then 'addr:conscriptionnumber' else NULL end as k,
	    v_conscriptionnumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_provisionalnumber is not NULL then 'addr:provisionalnumber' else NULL end as k,
	    v_provisionalnumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_streetnumber is not NULL then 'addr:streetnumber' else NULL end as k,
	    v_streetnumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_housenumber is not NULL then 'addr:housenumber' else NULL end as k,
	    v_housenumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_street is not NULL then 'addr:street' else NULL end as k,
	    v_street as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_place is not NULL then 'addr:place' else NULL end as k,
	    v_place as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_addsuburb and v_suburb is not NULL then 'addr:suburb' else NULL end as k,
	    case when v_addsuburb and v_suburb is not NULL then v_suburb else NULL end as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_addcity and v_city is not NULL then 'addr:city' else NULL end as k,
	    case when v_addcity and v_city is not NULL then v_city else NULL end as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_postcode is not NULL then 'addr:postcode' else NULL end as k,
	    v_postcode as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_addcountry then 'addr:country' else NULL end as k,
	    case when v_addcountry then 'CZ' else NULL end as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_isin is not NULL then 'is_in' else NULL end as k,
	    v_isin as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    'ref:ruian:addr' as k,
	    v_ruianid as v)
	),
	xml_tags
        )
when v_co='way' then
    xmlelement(name way,
    xmlattributes(
        v_osmid as id,
        case
		when v_zpracovat then 'modify'
		else NULL
        end as action,
        v_visible  as visible,
        v_version as version
        ),
        xmlelement(
	name tag,xmlattributes(
	    case when v_conscriptionnumber is not NULL then 'addr:conscriptionnumber' else NULL end as k,
	    v_conscriptionnumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_provisionalnumber is not NULL then 'addr:provisionalnumber' else NULL end as k,
	    v_provisionalnumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_streetnumber is not NULL then 'addr:streetnumber' else NULL end as k,
	    v_streetnumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_housenumber is not NULL then 'addr:housenumber' else NULL end as k,
	    v_housenumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_street is not NULL then 'addr:street' else NULL end as k,
	    v_street as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_place is not NULL then 'addr:place' else NULL end as k,
	    v_place as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_addsuburb and v_suburb is not NULL then 'addr:suburb' else NULL end as k,
	    case when v_addsuburb and v_suburb is not NULL then v_suburb else NULL end as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_addcity and v_city is not NULL then 'addr:city' else NULL end as k,
	    case when v_addcity and v_city is not NULL then v_city else NULL end as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_postcode is not NULL then 'addr:postcode' else NULL end as k,
	    v_postcode as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_addcountry then 'addr:country' else NULL end as k,
	    case when v_addcountry then 'CZ' else NULL end as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_isin is not NULL then 'is_in' else NULL end as k,
	    v_isin as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    'ref:ruian:addr' as k,
	    v_ruianid as v)
	),
	xml_tags,
	xml_waynodes
        )
when v_co='relation' then
    xmlelement(name relation,
    xmlattributes(
        v_osmid as id,
        case
		when v_zpracovat then 'modify'
		else NULL
        end as action,
        v_visible  as visible,
        v_version as version
        ),
        xmlelement(
	name tag,xmlattributes(
	    case when v_conscriptionnumber is not NULL then 'addr:conscriptionnumber' else NULL end as k,
	    v_conscriptionnumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_provisionalnumber is not NULL then 'addr:provisionalnumber' else NULL end as k,
	    v_provisionalnumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_streetnumber is not NULL then 'addr:streetnumber' else NULL end as k,
	    v_streetnumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_housenumber is not NULL then 'addr:housenumber' else NULL end as k,
	    v_housenumber as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_street is not NULL then 'addr:street' else NULL end as k,
	    v_street as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_place is not NULL then 'addr:place' else NULL end as k,
	    v_place as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_addsuburb and v_suburb is not NULL then 'addr:suburb' else NULL end as k,
	    case when v_addsuburb and v_suburb is not NULL then v_suburb else NULL end as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_addcity and v_city is not NULL then 'addr:city' else NULL end as k,
	    case when v_addcity and v_city is not NULL then v_city else NULL end as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_postcode is not NULL then 'addr:postcode' else NULL end as k,
	    v_postcode as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_addcountry then 'addr:country' else NULL end as k,
	    case when v_addcountry then 'CZ' else NULL end as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    case when v_isin is not NULL then 'is_in' else NULL end as k,
	    v_isin as v)
	),
        xmlelement(
	name tag,xmlattributes(
	    'ref:ruian:addr' as k,
	    v_ruianid as v)
	),
	xml_tags,
	xml_relationmembers
        )
else
    NULL::xml
end
);
if v_co='way' -- dotazeni uzlu k ceste
then
    -- raise notice '    I: %',v_ruianid;
    for v_record in select id,visible,version,latitude,longitude
    from osm.current_nodes where id in 
    (select node_id from osm.current_way_nodes where way_id = v_osmid) loop
    insert into text_changeset(xml) values(
    xmlelement(name node,xmlattributes(
    v_record.id as id,
    v_record.visible as visible,
    v_record.version as version,
    v_record.latitude::double precision /10000000 as lat,
    v_record.longitude:: double precision /10000000 as lon)
	        )
    );
    end loop;
end if;
end loop;
close kurzor;


if update_mode then
v_record=NULL;
open kurzor2;
loop
fetch kurzor2 into v_record;
if not found then
    exit;
end if;
select into v_record2 import.dotahni_entitu(v_record.co,v_record.id,NULL);
end loop;
end if; -- update_mode


if not update_mode then
-- Vytvoreni polygonu, ve kterem se budou dotahovat entity
select into v_polygon
	st_concavehull(st_union(case when osmgeom is not NULL then osmgeom else ruiangeom end),0.45) from parovane_geom;
-- raise notice 'Dotahovani ...';
open kurzor3;
loop
fetch kurzor3 into v_record;
if not found then
    exit;
end if;
select into v_record2 import.dotahni_entitu(v_record.co,v_record.id,NULL);
end loop;
end if; -- update_mode
if update_mode then
	select into v_record2 make_delete();
end if;

insert into text_changeset(xml) values('</osm>');
update text_changeset set xml=replace(xml,'<tag/>','');
return;
END;
$$;


ALTER FUNCTION import.make_changeset(update_mode boolean) OWNER TO import;

--
-- PostgreSQL database dump complete
--

