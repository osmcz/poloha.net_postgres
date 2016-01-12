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
-- Name: refresh_ruian_osm(boolean); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION refresh_ruian_osm(update_mode boolean) RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$DECLARE
v_oldrecord record;
v_record record;
BEGIN
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

raise notice 'Start opecuj_changeset';
select into v_record opecuj_changeset(update_mode);

if update_mode then
	raise notice 'Checking records for delete ...';
	select into v_record check_deleted();
	--update ruian_osm set autocreate=false where co::text || osmid::text in
	--(select co::text || osmid::text from ruian_osm_delete where deleteit);
end if;

raise notice 'Start morewarnings';
select into v_record morewarnings(update_mode);

raise notice 'Start allwarnings';
select into v_record make_allwarnings(update_mode);
raise notice 'Start make_changeset';
select into v_record make_changeset(update_mode);
END;
$$;


ALTER FUNCTION import.refresh_ruian_osm(update_mode boolean) OWNER TO import;

--
-- PostgreSQL database dump complete
--

