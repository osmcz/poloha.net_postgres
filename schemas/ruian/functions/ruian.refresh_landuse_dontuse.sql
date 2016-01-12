--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ruian, pg_catalog;

--
-- Name: refresh_landuse_dontuse(); Type: FUNCTION; Schema: ruian; Owner: ruian
--

CREATE FUNCTION refresh_landuse_dontuse() RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$DECLARE
v_rec record;
v_i smallint;
kurzor cursor for select kod,nazev from ruian.rn_okres where not deleted;
BEGIN
drop table if exists temp_p;
drop table if exists temp_a;
create temp table temp_a (kod integer,hranice geometry); -- akumulacni
create temp table temp_p (kod integer,hranice geometry); -- po okresech
v_i=0;
open kurzor;
loop
	fetch kurzor into v_rec;
	if not found then
		exit;
	end if;
	v_i=v_i+1;
	set client_min_messages='notice';
	raise notice '%. okres: %',v_i,v_rec.nazev;
	set client_min_messages='warning';
	truncate temp_p;
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
	where p.hranice is not NULL and not p.deleted and zpusoby.usable and okres.kod=v_rec.kod and p.id not in
	(select id from osmtables.parcely_landuse_exception);
	analyze temp_p;
	insert into temp_a
	select 	kod,
		(st_dump((st_union(hranice)))).geom as hranice
	from temp_p where hranice is not NULL group by kod;
end loop;
close kurzor;
set client_min_messages='notice';
raise notice 'Finalizing...';
truncate temp_p;
truncate ruian.landuse;
insert into ruian.landuse select * from temp_a;
drop table if exists temp_a;
drop table if exists temp_p;
analyze ruian.landuse;
update import.datatimestamp set landuse=now();
END;
$$;


ALTER FUNCTION ruian.refresh_landuse_dontuse() OWNER TO ruian;

--
-- PostgreSQL database dump complete
--

