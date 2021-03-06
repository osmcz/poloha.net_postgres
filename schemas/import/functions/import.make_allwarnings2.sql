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
-- Name: make_allwarnings2(boolean); Type: FUNCTION; Schema: import; Owner: pedro
--

CREATE FUNCTION make_allwarnings2(update_mode boolean) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
warnings_view cursor for select * from warnings_view;
warnings_view_full cursor for select a.*,so.zpusob_vyuziti_kod from warnings_view_full a
	left outer join ruian.rn_adresni_misto am on a.kod_a = am.kod
	left outer join ruian.rn_stavebni_objekt so on am.stavobj_kod = so.kod;
morewarnings_view cursor for select * from morewarnings_view;
warn_ulice_distance cursor for select * from warn_ulice_distance;
warn_am_so cursor for select kod,am_nogeom,am_so_distance from parovane_geom where (am_nogeom or am_so_distance > 50) and autocreate and id is NULL;
ruiandistance cursor for
select distinct on (distance,max(kod_a::bigint,kod_b::bigint)) so.zpusob_vyuziti_kod,foo.* from
	(
		select  distance_meters(a.pargeom,b.pargeom) as distance,
		a.kod as kod_a,
		b.kod as kod_b,b.cislo_popisne,b.cislo_evidencni,b.cislo_orientacni,b.ulice
		from parovane_geom a,parovane_geom b
		where a.kod <> b.kod and a.id is NULL and b.id is NULL and a.autocreate and b.autocreate
	) as foo
	left join ruian.rn_adresni_misto xam on foo.kod_a=xam.kod
	left join ruian.rn_stavebni_objekt so on xam.stavobj_kod = so.kod
	where distance < 5 and (so.zpusob_vyuziti_kod is NULL or so.zpusob_vyuziti_kod != 18 or foo.distance < 1.8);
rudyduch cursor for select p.ruianid,distance_meters(so.definicni_bod,so.hranice) as distance
	from ruian_osm p
	left join ruian.rn_adresni_misto am on p.ruianid=am.kod
	left join ruian.rn_stavebni_objekt so on am.stavobj_kod=so.kod
	where distance_meters(so.definicni_bod,so.hranice) > 10;
warn_naceste cursor for select * from ruian_osm where naceste;
v_rec record;
v_go boolean;
BEGIN
truncate allwarnings;

open warn_naceste;
loop
fetch warn_naceste into v_rec;
if not found then
    exit;
end if;
	execute insertwarning(v_rec.ruianid,NULL::real,'Adresn� bod je p�ipojen k n�jak� cest�'::text);
end loop;
close warn_naceste;


open warnings_view;
loop
fetch warnings_view into v_rec;
if not found then
    exit;
end if;
v_go = true;
if update_mode then
	v_go = v_rec.co_a::text || v_rec.id_a::text not in (select co::text || osmid::text from ruian_osm_delete where deleteit and osmid=v_rec.id_a) and v_rec.co_b::text || v_rec.id_b::text not in (select co::text || osmid::text from ruian_osm_delete where deleteit and osmid=v_rec.id_b);
end if;
if v_go then
	execute insertwarning(v_rec.kod_a,v_rec.distance::real,'V RUIAN 2 AM se stejn�mi ���sly'::text);
end if;
end loop;
close warnings_view;



open warnings_view_full;
loop
fetch warnings_view_full into v_rec;
if not found then
    exit;
end if;
v_go = true;
if update_mode then
	v_go = v_rec.co_a::text || v_rec.id_a::text not in (select co::text || osmid::text from ruian_osm_delete where deleteit and osmid=v_rec.id_a) and v_rec.co_b::text || v_rec.id_b::text not in (select co::text || osmid::text from ruian_osm_delete where deleteit and osmid=v_rec.id_b);
end if;
if (v_rec.zpusob_vyuziti_kod is NULL or v_rec.zpusob_vyuziti_kod != 18 or v_rec.distance < 1.8) and v_go then
	execute insertwarning(v_rec.kod_a,v_rec.distance::real,'AM p��li� bl��zko u sebe'::text);
end if;
end loop;
close warnings_view_full;




open morewarnings_view;
loop
fetch morewarnings_view into v_rec;
if not found then
    exit;
end if;
case
when v_rec.co = 'node' then
	execute insertwarning(v_rec.kod,v_rec.distance::real,'V OSM je n�jak� bod s adresou podez�ele bl��zko'::text);
when v_rec.co = 'way' then
	execute insertwarning(v_rec.kod,v_rec.distance::real,'V OSM je n�jak� cesta (budova?) s adresou podez�ele bl��zko'::text);
when v_rec.co = 'relation' then
	execute insertwarning(v_rec.kod,v_rec.distance::real,'V OSM je n�jak� relace s adresou podez�ele bl�zko'::text);
end case;
end loop;
close morewarnings_view;



open warn_ulice_distance;
loop
fetch warn_ulice_distance into v_rec;
if not found then
    exit;
end if;
if v_rec.distance is not NULL then
	execute insertwarning(v_rec.kod,v_rec.distance::real,'Ulice '::text || v_rec.ulice || ' je p���li� daleko od AM'::text);
else
	execute insertwarning(v_rec.kod,v_rec.distance::real,'Ulice '::text || v_rec.ulice || ' nebyla nalezena'::text);
end if;
end loop;
close warn_ulice_distance;
raise notice 'Ulice distance done';


open warn_am_so;
loop
fetch warn_am_so into v_rec;
if not found then
    exit;
end if;
--if v_rec.am_nogeom then
--	execute insertwarning(v_rec.kod,NULL::real,'AM nem� geometrii, je br�na ze SO'::text);
--end if;
if v_rec.am_so_distance > 50 then
	execute insertwarning(v_rec.kod,NULL::real,'AM bylo p�vodn� v RUIAN vzd�leno od SO '::text || v_rec.am_so_distance::text || ' metr�. Adresn� bod byl posunut k SO'::text);
end if;
end loop;
close warn_am_so;
raise notice 'AM_SO done';


open ruiandistance;
loop
fetch ruiandistance into v_rec;
if not found then
    exit;
end if;
execute insertwarning(
	v_rec.kod_a,
	v_rec.distance::real,
	'Dal�� RUIAN bod je dost bl�zko (RUIANID '::text || v_rec.kod_b::text || ', '::text || 
	case when v_rec.ulice is not NULL then v_rec.ulice::text else '' end || 
	' ��slo '::text || 
	case when v_rec.cislo_popisne is not NULL then v_rec.cislo_popisne::text else '' end || 
	case when v_rec.cislo_evidencni is not NULL then v_rec.cislo_evidencni::text else '' end || 
	case when v_rec.cislo_orientacni is not NULL then '/' || v_rec.cislo_orientacni::text else '' end ||
	 ')');
end loop;
close ruiandistance;
raise notice 'ruiandistance done';

open rudyduch;
loop
fetch rudyduch into v_rec;
if not found then
	exit;
end if;
execute insertwarning(v_rec.ruianid,v_rec.distance::real,'Rud� duch - defini�n� bod budovy je moc daleko od vlastn� budovy');
end loop;
close rudyduch;
END;
$$;


ALTER FUNCTION import.make_allwarnings2(update_mode boolean) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

