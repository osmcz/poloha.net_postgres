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

SET search_path = ruian, pg_catalog;

--
-- Name: refresh_landuse(integer); Type: FUNCTION; Schema: ruian; Owner: pedro
--

CREATE FUNCTION refresh_landuse(iokres integer) RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$DECLARE
v_rec record;
xokres boolean;
BEGIN
select into xokres done from ruian.tmplands_okresy where kod=iokres;
if not found or xokres = true then
	raise notice 'Uz je zpracovano';
	return;
end if;
drop table if exists temp_p;
create temp table temp_p (kod integer,hranice geometry); -- po okresech
set client_min_messages='warning';
insert into temp_p
select 	zpusoby.kod as kod,
case
	when st_isvalid(p.hranice) then p.hranice
	when st_isvalid(st_makevalid(p.hranice)) then st_makevalid(p.hranice)
	else NULL
end as hranice
from 
ruian.rn_parcela p
left join ruian.rn_katastralni_uzemi ku on p.katuz_kod=ku.kod and not ku.deleted
left join ruian.rn_obec obec on ku.obec_kod=obec.kod and not obec.deleted
left join ruian.rn_okres okres on obec.okres_kod=okres.kod and not okres.deleted
left join osmtables.zpusoby_vyuziti_parcel zpusoby on zpusoby.druh_pozemku_kod = p.druh_pozemku_kod and (zpusoby.zpusob_vyu_poz_kod = p.zpusob_vyu_poz_kod or (zpusoby.zpusob_vyu_poz_kod is NULL and p.zpusob_vyu_poz_kod is NULL))
where p.hranice is not NULL and not p.deleted and zpusoby.usable and okres.kod=iokres and p.id not in
 (select id from osmtables.parcely_landuse_exception);
analyze temp_p;
insert into ruian.tmplanduse
 select kod,(st_dump((st_union(hranice)))).geom as hranice,iokres
 from temp_p where hranice is not NULL group by kod;
set client_min_messages='notice';
drop table if exists temp_p;
update ruian.tmplands_okresy set done=true where kod=iokres;
END;
$$;


ALTER FUNCTION ruian.refresh_landuse(iokres integer) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

