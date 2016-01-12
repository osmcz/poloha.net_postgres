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
-- Name: refresh_ruian_osm2(boolean); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION refresh_ruian_osm2(update_mode boolean) RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$DECLARE
v_oldrecord record;
v_record record;
v_polygon geometry;
BEGIN

if not update_mode then
	select into v_polygon hranice from polygon;
end if;

update ruian_osm set naceste = true where co='node' and osmid in (select node_id from osm.current_way_nodes where node_id=ruian_osm.osmid);

update ruian_osm set osmid = NULL,level = NULL,co=NULL;

raise notice 'Start level 0';
if update_mode then
	update ruian_osm set osmid = (unearest_osm_address0(ruianid)).id,co = (unearest_osm_address0(ruianid)).co;
	update ruian_osm_delete set osmid = (unearest_osm_address0(ruianid)).id,co = (unearest_osm_address0(ruianid)).co;
	update ruian_osm_delete set level = 0 where level is NULL and osmid is not NULL;
else
	update ruian_osm set osmid = (nearest_osm_address0(ruianid)).id,co = (nearest_osm_address0(ruianid)).co;
end if;
update ruian_osm set level = 0 where level is NULL and osmid is not NULL;
raise notice 'Start level 1';
if update_mode then
	update ruian_osm set osmid = (unearest_osm_address1(ruianid)).id,co = (unearest_osm_address1(ruianid)).co where osmid is NULL and (unearest_osm_address1(ruianid)).co::text || (unearest_osm_address1(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
	update ruian_osm_delete set osmid = (unearest_osm_address1(ruianid)).id,co = (unearest_osm_address1(ruianid)).co where osmid is NULL and (unearest_osm_address1(ruianid)).co::text || (unearest_osm_address1(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm_delete where osmid is not NULL);
	update ruian_osm_delete set level = 1 where level is NULL and osmid is not NULL;
else
	update ruian_osm set osmid = (nearest_osm_address1(ruianid)).id,co = (nearest_osm_address1(ruianid)).co where osmid is NULL and (nearest_osm_address1(ruianid)).co::text || (nearest_osm_address1(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
end if;
update ruian_osm set level = 1 where level is NULL and osmid is not NULL;

raise notice 'Start level 2';
if update_mode then
	update ruian_osm set osmid = (unearest_osm_address2(ruianid)).id,co = (unearest_osm_address2(ruianid)).co where osmid is NULL and (unearest_osm_address2(ruianid)).co::text || (unearest_osm_address2(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
	update ruian_osm_delete set osmid = (unearest_osm_address2(ruianid)).id,co = (unearest_osm_address2(ruianid)).co where osmid is NULL and (unearest_osm_address2(ruianid)).co::text || (unearest_osm_address2(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm_delete where osmid is not NULL);
	update ruian_osm_delete set level = 2 where level is NULL and osmid is not NULL;
else
	update ruian_osm set osmid = (nearest_osm_address2(ruianid)).id,co = (nearest_osm_address2(ruianid)).co where osmid is NULL and (nearest_osm_address2(ruianid)).co::text || (nearest_osm_address2(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
end if;
update ruian_osm set level = 2 where level is NULL and osmid is not NULL;

raise notice 'Start level 3';
if update_mode then
	update ruian_osm set osmid = (unearest_osm_address3(ruianid)).id,co = (unearest_osm_address3(ruianid)).co where osmid is NULL and (unearest_osm_address3(ruianid)).co::text || (unearest_osm_address3(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
	update ruian_osm_delete set osmid = (unearest_osm_address3(ruianid)).id,co = (unearest_osm_address3(ruianid)).co where osmid is NULL and (unearest_osm_address3(ruianid)).co::text || (unearest_osm_address3(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm_delete where osmid is not NULL);
	update ruian_osm_delete set level = 3 where level is NULL and osmid is not NULL;
else
	update ruian_osm set osmid = (nearest_osm_address3(ruianid)).id,co = (nearest_osm_address3(ruianid)).co where osmid is NULL and (nearest_osm_address3(ruianid)).co::text || (nearest_osm_address3(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
end if;
update ruian_osm set level = 3 where level is NULL and osmid is not NULL;

raise notice 'Start level 4';
if update_mode then
	update ruian_osm set osmid = (unearest_osm_address4(ruianid)).id,co = (unearest_osm_address4(ruianid)).co where osmid is NULL and (unearest_osm_address4(ruianid)).co::text || (unearest_osm_address4(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
	update ruian_osm_delete set osmid = (unearest_osm_address4(ruianid)).id,co = (unearest_osm_address4(ruianid)).co where osmid is NULL and (unearest_osm_address4(ruianid)).co::text || (unearest_osm_address4(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
	update ruian_osm_delete set level = 4 where level is NULL and osmid is not NULL;
else
	update ruian_osm set osmid = (nearest_osm_address4(ruianid)).id,co = (nearest_osm_address4(ruianid)).co where osmid is NULL and (nearest_osm_address4(ruianid)).co::text || (nearest_osm_address4(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
end if;
update ruian_osm set level = 4 where level is NULL and osmid is not NULL;

raise notice 'Start level 5';
if update_mode then
--	update ruian_osm set osmid = (unearest_osm_address5(ruianid)).id,co = (unearest_osm_address5(ruianid)).co where osmid is NULL and (unearest_osm_address5(ruianid)).co::text || (unearest_osm_address5(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
	update ruian_osm_delete set osmid = (unearest_osm_address5(ruianid)).id,co = (unearest_osm_address5(ruianid)).co where osmid is NULL and (unearest_osm_address5(ruianid)).co::text || (unearest_osm_address5(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
	update ruian_osm_delete set level = 5 where level is NULL and osmid is not NULL;
else
	update ruian_osm set osmid = (nearest_osm_address5(ruianid)).id,co = (nearest_osm_address5(ruianid)).co where osmid is NULL and (nearest_osm_address5(ruianid)).co::text || (nearest_osm_address5(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
end if;
update ruian_osm set level = 5 where level is NULL and osmid is not NULL;

raise notice 'Start level 6';
if update_mode then
--	update ruian_osm set osmid = (unearest_osm_address6(ruianid)).id,co = (unearest_osm_address6(ruianid)).co where osmid is NULL and (unearest_osm_address6(ruianid)).co::text || (unearest_osm_address6(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
	update ruian_osm_delete set osmid = (unearest_osm_address6(ruianid)).id,co = (unearest_osm_address6(ruianid)).co where osmid is NULL and (unearest_osm_address6(ruianid)).co::text || (unearest_osm_address6(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
	update ruian_osm_delete set level = 6 where level is NULL and osmid is not NULL;
else
	update ruian_osm set osmid = (nearest_osm_address6(ruianid)).id,co = (nearest_osm_address6(ruianid)).co where osmid is NULL and (nearest_osm_address6(ruianid)).co::text || (nearest_osm_address6(ruianid)).id::text not in (select co::text || osmid::text from ruian_osm where osmid is not NULL);
end if;
update ruian_osm set level = 6 where level is NULL and osmid is not NULL;


raise notice 'Start analyze';
analyze ruian_osm;

--update ruian_osm set osmid=NULL,co=NULL where co != 'node'; -- chceme adresy jen na bodech
-- redundantni - uz je v nearest_osm_... update ruian_osm set osmid=NULL,co=NULL where isphysical(co,osmid); -- nechceme adresy na fyzickych entitach, obchodech, ...

raise notice 'Start refresh_parovane_geom';
select into v_record refresh_parovane_geom();
update ruian_osm r set geom = (select geom from osm_adresy osm where osm.co=r.co and osm.id=r.osmid) where r.co is not NULL and r.geom is NULL;
analyze ruian_osm; -- zase, geometrie zmenene

raise notice 'Start opecuj_changeset';
select into v_record opecuj_changeset2(update_mode);

if update_mode then
	raise notice 'Checking records for delete ...';
	select into v_record check_deleted();
	--update ruian_osm set autocreate=false where co::text || osmid::text in
	--(select co::text || osmid::text from ruian_osm_delete where deleteit);

else

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
--update ruian_osm set autocreate=true,level=0;
-- je zahrnuto vyse update ruian_osm_delete set deleteit=true;
end if;

raise notice 'Start morewarnings';
select into v_record morewarnings3(update_mode);

raise notice 'Start allwarnings';
select into v_record make_allwarnings2(update_mode);
raise notice 'Start make_changeset';
select into v_record make_changeset2(update_mode);
END;
$$;


ALTER FUNCTION import.refresh_ruian_osm2(update_mode boolean) OWNER TO import;

--
-- PostgreSQL database dump complete
--

