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
-- Name: opecuj_changeset(boolean); Type: FUNCTION; Schema: import; Owner: pedro
--

CREATE FUNCTION opecuj_changeset(update_mode boolean) RETURNS void
    LANGUAGE plpgsql COST 1000
    AS $$DECLARE
i_a integer;
i_b integer;
v_rec record;
kurzor cursor for select warnings.kod_a,warnings.kod_b,a.id as id_a,b.id as id_b,a.co as co_a,b.co as co_b,a.level as level_a,b.level as level_b,
a.cislo_popisne as cislo_popisne_a,b.cislo_popisne as cislo_popisne_b,
a.cislo_evidencni as cislo_evidencni_a,b.cislo_evidencni as cislo_evidencni_b,
a.cislo_orientacni as cislo_orientacni_a,b.cislo_orientacni as cislo_orientacni_b,
a.ulice as ulice_a,b.ulice as ulice_b,
warnings.distance 
    from warnings  
    left join parovane_geom a on kod_a = a.kod 
    left join parovane_geom b on kod_b=b.kod 
    where (a.cislo_popisne=b.cislo_popisne or a.cislo_evidencni=b.cislo_evidencni or a.cislo_popisne=b.cislo_evidencni or a.cislo_evidencni=b.cislo_popisne) 
    and 
    ((a.cislo_orientacni = b.cislo_orientacni or a.cislo_orientacni is NULL or b.cislo_orientacni is NULL) and (difference(a.ulice,b.ulice) > 3 or a.ulice is NULL or b.ulice is NULL))
    and
    warnings.distance < 5;
kurzor2 cursor for select * from temp_x;
BEGIN
--select into cnt count(*) from ruian_osm;
drop table if exists temp_x;
raise notice 'opecuj_changeset: start creating table temp_x';
create temp table temp_x as select kod,id,co,case when osmgeom is not NULL then osmgeom else ruiangeom end as geom
from parovane_geom where autocreate;
create index temp_x_idx on temp_x using gist (geom) ;
raise notice 'opecuj_changeset: table temp_x created';
truncate warnings;

open kurzor2;
loop
fetch kurzor2 into v_rec;
if not found then
    exit;
end if;
insert into warnings select v_rec.kod,kod,distance_meters(v_rec.geom,foo.geom) from (
select * from temp_x where kod != v_rec.kod order by v_rec.geom <-> geom limit 20
) as foo order by st_distance(v_rec.geom,foo.geom) limit 1;
end loop;
close kurzor2;
drop table if exists temp_x;
delete from warnings where distance > 5;
delete from warnings where ctid not in (select max(ctid) from warnings group by md5(max(kod_a,kod_b)::text));
if not update_mode then
open kurzor;
loop
fetch kurzor into v_rec;
if not found then
    exit;
end if;
i_a=0;
i_b=0;
if v_rec.cislo_popisne_a is not NULL then
	i_a=i_a+1;
end if;
if v_rec.cislo_orientacni_a is not NULL then
	i_a=i_a+1;
end if;
if v_rec.cislo_evidencni_a is not NULL then
	i_a=i_a+1;
end if;
if v_rec.ulice_a is not NULL then
	i_a=i_a+1;
end if;
if v_rec.cislo_popisne_b is not NULL then
	i_b=i_b+1;
end if;
if v_rec.cislo_orientacni_b is not NULL then
	i_b=i_b+1;
end if;
if v_rec.cislo_evidencni_b is not NULL then
	i_b=i_b+1;
end if;
if v_rec.ulice_b is not NULL then
	i_b=i_b+1;
end if;
case
when v_rec.id_a is not NULL and v_rec.id_b is NULL then
    update ruian_osm set autocreate=false where ruianid=v_rec.kod_b;
when v_rec.id_a is NULL and v_rec.id_b is not NULL then
    update ruian_osm set autocreate=false where ruianid=v_rec.kod_a;
when v_rec.id_a is not NULL and v_rec.id_b is not NULL and v_rec.level_a < v_rec.level_b then
    update ruian_osm set autocreate=false where ruianid=v_rec.kod_b;
when v_rec.id_a is not NULL and v_rec.id_b is not NULL and v_rec.level_a > v_rec.level_b then
    update ruian_osm set autocreate=false where ruianid=v_rec.kod_a;
when i_a > i_b then
    update ruian_osm set autocreate=false where ruianid=v_rec.kod_b;
else
    update ruian_osm set autocreate=false where ruianid=v_rec.kod_a;
end case;
--delete from warnings where current of kurzor;
end loop;
close kurzor;
end if; --update_mode
return;
END;
$$;


ALTER FUNCTION import.opecuj_changeset(update_mode boolean) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

