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
-- Name: cleanaddresses(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION cleanaddresses() RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$DECLARE
v_oldrecord record;
v_record record;
v_polygon geometry;
BEGIN

select into v_polygon hranice from polygon;

update ruian_osm set naceste = true where co='node' and osmid in (select node_id from osm.current_way_nodes where node_id=ruian_osm.osmid);

update ruian_osm set osmid = NULL,level = NULL,co=NULL;

raise notice 'Start level 0';
update ruian_osm set osmid = (nearest_osm_address0(ruianid)).id,co = (nearest_osm_address0(ruianid)).co;
update ruian_osm set level = 0 where level is NULL and osmid is not NULL;
raise notice 'Start level 1';
update ruian_osm set osmid = (nearest_osm_address1(ruianid)).id,co = (nearest_osm_address1(ruianid)).co where osmid is NULL and (nearest_osm_address1(ruianid)).co::text || (nearest_osm_address1(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
update ruian_osm set level = 1 where level is NULL and osmid is not NULL;
raise notice 'Start level 2';
update ruian_osm set osmid = (nearest_osm_address2(ruianid)).id,co = (nearest_osm_address2(ruianid)).co where osmid is NULL and (nearest_osm_address2(ruianid)).co::text || (nearest_osm_address2(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
update ruian_osm set level = 2 where level is NULL and osmid is not NULL;
raise notice 'Start level 3';
update ruian_osm set osmid = (nearest_osm_address3(ruianid)).id,co = (nearest_osm_address3(ruianid)).co where osmid is NULL and (nearest_osm_address3(ruianid)).co::text || (nearest_osm_address3(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
update ruian_osm set level = 3 where level is NULL and osmid is not NULL;
raise notice 'Start level 4';
update ruian_osm set osmid = (nearest_osm_address4(ruianid)).id,co = (nearest_osm_address4(ruianid)).co where osmid is NULL and (nearest_osm_address4(ruianid)).co::text || (nearest_osm_address4(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
update ruian_osm set level = 4 where level is NULL and osmid is not NULL;
raise notice 'Start level 5';
update ruian_osm set osmid = (nearest_osm_address5(ruianid)).id,co = (nearest_osm_address5(ruianid)).co where osmid is NULL and (nearest_osm_address5(ruianid)).co::text || (nearest_osm_address5(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
update ruian_osm set level = 5 where level is NULL and osmid is not NULL;
raise notice 'Start level 6';
update ruian_osm set osmid = (nearest_osm_address6(ruianid)).id,co = (nearest_osm_address6(ruianid)).co where osmid is NULL and (nearest_osm_address6(ruianid)).co::text || (nearest_osm_address6(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
update ruian_osm set level = 6 where level is NULL and osmid is not NULL;


raise notice 'Start analyze';
analyze ruian_osm;

--raise notice 'Start opecuj_changeset';
--select into v_record opecuj_changeset2(update_mode);

truncate ruian_osm_delete;
	insert into ruian_osm_delete (co,osmid,deleteit) select co,id,true from
		(select co,id,geom,conscriptionnumber,provisionalnumber,housenumber from osm_adresy where v_polygon && geom) as foo
		where
			st_contains(v_polygon,geom)
			and not isphysical(foo.co,foo.id)
			and foo.co::text || foo.id::text not in
				(select co::text || osmid::text from ruian_osm where co is not NULL)
			and (foo.conscriptionnumber is not NULL or foo.provisionalnumber is not NULL or foo.housenumber is not NULL);
update ruian_osm_delete set deleteit=false where co::text||osmid::text in (
	select o.co::text||o.id::text from ruian_osm_delete par
	left join import.osm_adresy o on par.co=o.co and par.osmid=o.id
	left join ruian.rn_obec obec on st_contains(obec.hranice,o.geom)
	left join ruian.rn_katastralni_uzemi ku on st_contains(ku.hranice,o.geom)
	left join import.ruian_adresy_mview r on
		(o.conscriptionnumber=r.cislo_popisne::text or o.provisionalnumber=r.cislo_evidencni::text)
		and (difference(o.street,r.ulice) > 3 or (o.street is NULL and r.ulice is NULL))
		and (o.place=r.cast_obce or o.city=r.obec or r.obec=obec.nazev or r.cast_obce=ku.nazev)
	where r.id is not NULL);

-- chrabrosovy budovy
update ruian_osm_delete set deleteit=false where co::text||osmid::text in (
	select a.co,a.osmid
	from
	(
	select d.co,d.osmid,o.conscriptionnumber,o.provisionalnumber,o.housenumber,o.street,o.streetnumber,o.place,o.geom
	from import0.ruian_osm_delete d
	left join import.osm_adresy o on d.osmid=o.id and d.co=o.co
	where d.co != 'node' and d.deleteit and o.streetnumber is NULL --and (o.conscriptionnumber is not NULL or o.provisionalnumber is not NULL)
	) a
	left join import.osm_adresy o on o.streetnumber is not NULL
		and
		case
			when a.conscriptionnumber is not NULL then a.conscriptionnumber = o.conscriptionnumber
			when a.provisionalnumber is not NULL then a.provisionalnumber = o.provisionalnumber
		else false end
		and import.distance_meters(a.geom,o.geom) < 100
		and a.osmid != o.id
	left join import.ruian_adresy_mview r on r.cislo_orientacni is not NULL
		and 
		case
			when a.conscriptionnumber is not NULL then a.conscriptionnumber = r.cislo_popisne::text
			when a.provisionalnumber is not NULL then a.provisionalnumber = r.cislo_evidencni::text
		else false end
		and import.distance_meters(a.geom,r.geom) < 100
	group by a.co,a.osmid,a.conscriptionnumber,a.provisionalnumber,a.housenumber,a.street,a.streetnumber
	having count(o.*) > 1 or count(r.*) > 1
);

truncate ruian_osm;
raise notice 'Start make_changeset';
select into v_record make_changeset2(false);
END;
$$;


ALTER FUNCTION import.cleanaddresses() OWNER TO import;

--
-- PostgreSQL database dump complete
--

