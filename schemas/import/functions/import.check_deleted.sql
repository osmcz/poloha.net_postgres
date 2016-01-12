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
-- Name: check_deleted(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION check_deleted() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
kurzor cursor for select * from temp_xxx;
v_rec record;
v_osmcnt integer;
v_ruiancnt integer;
v_pomplus integer;
v_pomminus integer;
v_total integer;
BEGIN
analyze ruian_osm_delete;
drop table if exists temp_xxx;
create temp table temp_xxx as select * from import.parovane_delete where
((ulice is NULL and street is NULL) or ulice = street)
and
((cislo_evidencni::text is NULL and provisionalnumber is NULL) or cislo_evidencni::text = provisionalnumber)
and
((cislo_popisne is NULL and conscriptionnumber is NULL) or cislo_popisne::text = conscriptionnumber)
and id is not NULL;
create index temp_xxx_idx on temp_xxx using gist (ruiangeom);
analyze temp_xxx;
  open kurzor;
  loop
  fetch kurzor into v_rec;
  if not found then
    exit;
end if;
select into v_osmcnt count(*) from
(select * from import.osm_adresy order by geom <-> v_rec.ruiangeom limit 100) as foo where distance_meters(v_rec.ruiangeom,geom) < 100
and (conscriptionnumber = v_rec.conscriptionnumber or v_rec.provisionalnumber = provisionalnumber);
select into v_ruiancnt count(*) from
(select * from import.ruian_adresy_mview order by geom <-> v_rec.ruiangeom limit 100) as foo where distance_meters(v_rec.ruiangeom,geom) < 100
and (cislo_popisne = v_rec.cislo_popisne or v_rec.cislo_evidencni = cislo_evidencni);
select into v_pomplus count(*) from
(select * from import0.parovane_geom order by ruiangeom <-> v_rec.ruiangeom limit 100) as foo where distance_meters(v_rec.ruiangeom,ruiangeom) < 100
and (cislo_popisne = v_rec.cislo_popisne or v_rec.cislo_evidencni = cislo_evidencni)
and id is NULL and autocreate;
select into v_pomminus count(*) from
(select * from temp_xxx order by ruiangeom <-> v_rec.ruiangeom limit 100) as foo where distance_meters(v_rec.ruiangeom,ruiangeom) < 100
and (cislo_popisne = v_rec.cislo_popisne or v_rec.cislo_evidencni = cislo_evidencni)
and (deleteit is NULL or not deleteit);
select into v_total v_osmcnt-v_ruiancnt+v_pomplus-v_pomminus;
--raise notice ' ruianid: %',v_rec.kod;
--raise notice '   osmid: %',v_rec.id;
--raise notice '  osmcnt: %',v_osmcnt;
--raise notice 'ruiancnt: %',v_ruiancnt;
--raise notice ' pomplus: %',v_pomplus;
--raise notice 'pomminus: %',v_pomminus;
--raise notice '   total: %',v_total;
--raise notice '------------------------';
if v_total >=0 then
	update temp_xxx set deleteit = true where kod = v_rec.kod;
	update ruian_osm_delete set deleteit = true where ruianid = v_rec.kod;
end if;
end loop;
close kurzor;
drop table if exists temp_xxx;

END;
$$;


ALTER FUNCTION import.check_deleted() OWNER TO import;

--
-- PostgreSQL database dump complete
--

