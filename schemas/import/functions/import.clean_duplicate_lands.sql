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
-- Name: clean_duplicate_lands(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION clean_duplicate_lands() RETURNS void
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
kurzor cursor for select tbl.*
from import.overlap_lands_view tbl
left join gis.cz_polygon a on tbl.a_osm_id=a.osm_id
left join gis.cz_polygon b on tbl.b_osm_id=b.osm_id
where
    st_contains(v_geom,st_union(a.way,b.way))
    and procent > 0.85
    and a_source='lpis'
    and b_source='lpis'
    and a_ref=b_ref
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

v_days=abs(extract('day' from v_rec.a_timestamp - v_rec.b_timestamp));
if v_rec.a_timestamp > v_rec.b_timestamp and v_days > 0 then
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
if zachovat_osm_id not in (select id from inchangeset where id=zachovat_osm_id) and smazat_osm_id not in (select id from inchangeset where id=smazat_osm_id) then
	insert into inchangeset(id) values(zachovat_osm_id);
	insert into inchangeset(id) values(smazat_osm_id);
	if smazat_osm_id > 0 then -- cesta
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
	else -- relace
		select into v_record id,visible,version from osm.current_relations where id=-smazat_osm_id;
		insert into text_changeset(xml) values (
		xmlelement(name relation,
		    xmlattributes(
			v_record.id as id,
			'delete' as action,
			v_record.visible as visible,
			v_record.version as version
			)
		    )
		);
	end if;
end if;
end loop;
close kurzor;
insert into text_changeset(xml) values('</osm>');
update text_changeset set xml=replace(xml,'<tag/>','');
return;
END;
$$;


ALTER FUNCTION import.clean_duplicate_lands() OWNER TO import;

--
-- PostgreSQL database dump complete
--

