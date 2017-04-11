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
-- Name: refresh_parovane_geom(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION refresh_parovane_geom() RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$
DECLARE
kurzor cursor for select * from temp_paraziti;
v_rec record;
const_definicni_bod_hranice_distance real;
const_hranice_am_distance real;
const_definicni_bod_am_distance real;
const_osm_am_distance real;
BEGIN
const_definicni_bod_hranice_distance = 10;
const_hranice_am_distance = 2.8;
const_definicni_bod_am_distance = 50;
const_osm_am_distance =5;
drop table if exists temp_paraziti;
create temp table temp_paraziti as
select distinct on (am.kod) par.ruianid,osm.geom as osmgeom,so.hranice as so_hranice,so.definicni_bod as so_definicni_bod,
am.definicni_bod as amgeom,parazit.kod is not NULL as parazit,parazit_am.kod is not NULL as parazit_am,
parazit_so.kod is not NULL and st_intersection(so.hranice,parazit_so.hranice) is not NULL and st_area(st_intersection(so.hranice,parazit_so.hranice)) > 10 as parazit_so,
parcela.definicni_bod as parcela_definicni_bod,parcela.hranice as parcela_hranice
from ruian_osm par
	left join ruian.rn_adresni_misto am on par.ruianid=am.kod and not am.deleted
	left join ruian.rn_stavebni_objekt so on am.stavobj_kod=so.kod and not so.deleted
	left join import.osm_adresy osm on par.osmid=osm.id and par.co=osm.co
	left join ruian.rn_stavebni_objekt parazit on st_contains(parazit.hranice,osm.geom) and parazit.hranice is not NULL and parazit.kod != am.stavobj_kod
	left join ruian.rn_stavebni_objekt parazit_am on st_contains(parazit_am.hranice,am.definicni_bod) and parazit_am.hranice is not NULL and parazit_am.kod != am.stavobj_kod
	left join ruian.rn_stavebni_objekt parazit_so on st_intersects(parazit_so.hranice,so.hranice) and (st_area(st_intersection(parazit_so.hranice,so.hranice)) > 0 or st_equals(parazit_so.hranice,so.hranice)) and parazit_so.hranice is not NULL and parazit_so.kod != am.stavobj_kod
	left join ruian.rn_parcela parcela on parcela.id=so.identifikacni_parcela_id
	where (par.co='node' or par.co is NULL);
-- parazit - adresa v OSM lezi na jinem SO nez ke kteremu patri
-- parazit_am - adresni misto v RUIAN lezi na jinem SO nez ke kteremu patri
-- parazit_so - baraky placnute pres sebe

open kurzor;
loop
fetch kurzor into v_rec;
if not found then
	exit;
end if;
case
-- 1.) adresa v OSM je v rozumne vzdalenosti od hranic SO, SO je validni, pozici bereme z OSM
when v_rec.osmgeom is not NULL and v_rec.so_hranice is not NULL and 
	distance_meters(v_rec.osmgeom,v_rec.so_hranice) < const_hranice_am_distance and
	((distance_meters(v_rec.so_hranice,v_rec.so_definicni_bod) < const_definicni_bod_hranice_distance) or v_rec.so_definicni_bod is NULL) and
	(not v_rec.parazit or v_rec.parazit_so) then
		update ruian_osm set kdesevzal=1,geom=v_rec.osmgeom where ruianid=v_rec.ruianid;
-- 2.) SO nema hranice ci neni validni, adresa v OSM je v rozumne vzdalenosti od def. bodu SO, pozici bereme z OSM
when v_rec.osmgeom is not NULL and v_rec.so_hranice is NULL and v_rec.so_definicni_bod is not NULL and
	distance_meters(v_rec.so_definicni_bod,v_rec.osmgeom) < const_definicni_bod_am_distance and
	(not v_rec.parazit or v_rec.parazit_so) then
		update ruian_osm set kdesevzal=2,geom=v_rec.osmgeom where ruianid=v_rec.ruianid;
-- 3.) nemame SO, adresa v OSM je v rozumne vzdalenosti od geometrie AM v RUIAN, pozici bereme z OSM
when v_rec.osmgeom is not NULL and v_rec.so_hranice is NULL and v_rec.so_definicni_bod is NULL and v_rec.amgeom is not NULL and
	distance_meters(v_rec.amgeom,v_rec.osmgeom) < const_osm_am_distance and
	(not v_rec.parazit or v_rec.parazit_so) then
		update ruian_osm set kdesevzal=3,geom=v_rec.osmgeom where ruianid=v_rec.ruianid;
-- 4.) AM v RUIAN je v rozumne vzdalenosti od hranic SO, SO je validni, AM nelezi na cizim SO, pozici bereme z AM v RUIAN
when v_rec.so_hranice is not NULL and v_rec.amgeom is not NULL and distance_meters(v_rec.amgeom,v_rec.so_hranice) < const_hranice_am_distance and
	((distance_meters(v_rec.so_hranice,v_rec.so_definicni_bod) < const_definicni_bod_hranice_distance) or v_rec.so_definicni_bod is NULL) and
	(not v_rec.parazit_am or v_rec.parazit_so) then
		update ruian_osm set kdesevzal=4,geom=v_rec.amgeom where ruianid=v_rec.ruianid;
-- 5.) SO nema hranice, AM v RUIAN je v rozumne vzdalenosti od def. bodu SO, AM nelezi na jinem SO, pozici bereme z AM v RUIAN
when v_rec.so_hranice is NULL and v_rec.amgeom is not NULL and v_rec.so_definicni_bod is not NULL and
	distance_meters(v_rec.amgeom,v_rec.so_definicni_bod) < const_definicni_bod_am_distance and
	(not v_rec.parazit_am or v_rec.parazit_so) then
		update ruian_osm set kdesevzal=5,geom=v_rec.amgeom where ruianid=v_rec.ruianid;
-- 6.) SO je validni, pozici bereme ze st_centroid SO
--when v_rec.so_hranice is not NULL and v_rec.so_definicni_bod is not NULL and
--	distance_meters(v_rec.so_hranice,v_rec.so_definicni_bod) < const_definicni_bod_hranice_distance then
when v_rec.so_hranice is not NULL then
		update ruian_osm set kdesevzal=6,geom=st_centroid(v_rec.so_hranice) where ruianid=v_rec.ruianid;
-- 7.) SO nema hranice ci neni validni, pozici bereme z definicniho bodu SO
when v_rec.so_definicni_bod is not NULL then
		update ruian_osm set kdesevzal=7,geom=v_rec.so_definicni_bod where ruianid=v_rec.ruianid;
-- 8.) SO nema hranice ci neni validni, pozici bereme z AM v RUIAN
when v_rec.amgeom is not NULL and
	(not v_rec.parazit_am or v_rec.parazit_so) then
		update ruian_osm set kdesevzal=8,geom=v_rec.amgeom where ruianid=v_rec.ruianid;
else
-- 9.) vsechno selhalo - polohu bereme z OSM (pokud nejakou mame)
	case
	when v_rec.osmgeom is not NULL then
		update ruian_osm set kdesevzal=9,geom=v_rec.osmgeom where ruianid=v_rec.ruianid;
	when v_rec.amgeom is not NULL then
		update ruian_osm set kdesevzal=10,geom=v_rec.amgeom where ruianid=v_rec.ruianid;
	when v_rec.so_hranice is not NULL then
		update ruian_osm set kdesevzal=10,geom=st_centroid(v_rec.so_hranice) where ruianid=v_rec.ruianid;
	when v_rec.so_definicni_bod is not NULL then
		update ruian_osm set kdesevzal=10,geom=v_rec.so_definicni_bod where ruianid=v_rec.ruianid;
	--when v_rec.parcela_hranice is not NULL then
	--	update ruian_osm set kdesevzal=10,geom=st_centroid(v_rec.parcela_hranice) where ruianid=v_rec.ruianid;
	--when v_rec.parcela_definicni_bod is not NULL then
	--	update ruian_osm set kdesevzal=10,geom=v_rec.parcela_definicni_bod where ruianid=v_rec.ruianid;
	else
		delete from ruian_osm where ruianid=v_rec.ruianid;
	end case;
end case;
end loop;
close kurzor;
drop table if exists temp_paraziti;
END;
$$;


ALTER FUNCTION import.refresh_parovane_geom() OWNER TO import;

--
-- PostgreSQL database dump complete
--

