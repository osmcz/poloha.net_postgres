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
-- Name: update_building_source_stat(); Type: FUNCTION; Schema: import; Owner: pedro
--

CREATE FUNCTION update_building_source_stat() RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
insert into osmtables.buildings_source (datum,km,ruian,oboje) select current_date as datum,sum(km) as km,sum(ruian) as ruian,sum(oboje) as oboje
from 
	(select
	case when v ilike '%cuzk:km%' and not v ilike '%cuzk:ruian%' then sum(pocet) else NULL end as km,
	case when v ilike '%cuzk:ruian%' and not v ilike '%cuzk:km%' then sum(pocet) else NULL end as ruian,
	case when v ilike '%cuzk:ruian%' and v ilike '%cuzk:km%' then sum(pocet) else NULL end as oboje,
	v
	from
		(
			select count(*) as pocet,v.v
			from osm.current_node_tags k
			left join osm.current_node_tags v on k.node_id = v.node_id
			left join osm.current_nodes s on s.id=k.node_id
			where k.k='building' and v.k='source' and (v.v ilike '%cuzk:km%' or v.v ilike '%cuzk:ruian%') and s.visible
			group by v.v
		union all
			select count(*) as pocet,v.v
			from osm.current_way_tags k
			left join osm.current_way_tags v on k.way_id = v.way_id
			left join osm.current_ways s on s.id=k.way_id
			where k.k='building' and v.k='source' and (v.v ilike '%cuzk:km%' or v.v ilike '%cuzk:ruian%') and s.visible
			group by v.v
		union all
			select count(*) as pocet,v.v
			from osm.current_relation_tags k
			left join osm.current_relation_tags v on k.relation_id = v.relation_id
			left join osm.current_relations s on s.id=k.relation_id
			where k.k='building' and v.k='source' and (v.v ilike '%cuzk:km%' or v.v ilike '%cuzk:ruian%') and s.visible
			group by v.v
		) foo
	group by v
	) f2
;
end $$;


ALTER FUNCTION import.update_building_source_stat() OWNER TO pedro;

--
-- Name: update_building_source_stat(); Type: ACL; Schema: import; Owner: pedro
--

REVOKE ALL ON FUNCTION update_building_source_stat() FROM PUBLIC;
REVOKE ALL ON FUNCTION update_building_source_stat() FROM pedro;
GRANT ALL ON FUNCTION update_building_source_stat() TO pedro;
GRANT ALL ON FUNCTION update_building_source_stat() TO PUBLIC;
GRANT ALL ON FUNCTION update_building_source_stat() TO osm;


--
-- PostgreSQL database dump complete
--

