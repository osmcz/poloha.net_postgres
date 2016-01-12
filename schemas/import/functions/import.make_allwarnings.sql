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
-- Name: make_allwarnings(boolean); Type: FUNCTION; Schema: import; Owner: pedro
--

CREATE FUNCTION make_allwarnings(update_mode boolean) RETURNS void
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
select distinct on (distance,max(kod_a::bigint,kod_b::bigint)) * from
	(
		select  distance_meters(a.ruiangeom,b.ruiangeom) as distance,
		a.kod as kod_a,
		b.kod as kod_b,b.cislo_popisne,b.cislo_evidencni,b.cislo_orientacni,b.ulice
		from parovane_geom a,parovane_geom b
		where a.kod <> b.kod and a.id is NULL and b.id is NULL
	) as foo
	left join ruian.rn_stavebni_objekt so on foo.kod_a = so.kod
	where distance < 5 and (so.zpusob_vyuziti_kod is NULL or so.zpusob_vyuziti_kod != 18 or foo.distance < 1.8);
v_rec record;
v_garaz boolean;
v_go boolean;
BEGIN
truncate allwarnings;


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
	execute insertwarning(v_rec.kod_a,v_rec.distance::real,'V RUIAN 2 AM se stejnými èí­sly'::text);
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
	execute insertwarning(v_rec.kod_a,v_rec.distance::real,'AM pøíli¹ blí­zko u sebe'::text);
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
	execute insertwarning(v_rec.kod,v_rec.distance::real,'V OSM je nìjaký bod s adresou podezøele blí­zko'::text);
when v_rec.co = 'way' then
	execute insertwarning(v_rec.kod,v_rec.distance::real,'V OSM je nìjaká cesta (budova?) s adresou podezøele blí­zko'::text);
when v_rec.co = 'relation' then
	execute insertwarning(v_rec.kod,v_rec.distance::real,'V OSM je nìjaká relace s adresou podezøele blízko'::text);
end case;
end loop;
close morewarnings_view;



open warn_ulice_distance;
loop
fetch warn_ulice_distance into v_rec;
if not found then
    exit;
end if;
execute insertwarning(v_rec.kod,v_rec.distance::real,'Ulice '::text || v_rec.ulice || ' je pøí­li¹ daleko od AM'::text);
end loop;
close warn_ulice_distance;
raise notice 'Ulice distance done';


open warn_am_so;
loop
fetch warn_am_so into v_rec;
if not found then
    exit;
end if;
if v_rec.am_nogeom then
	execute insertwarning(v_rec.kod,NULL::real,'AM nemá geometrii, je brána ze SO'::text);
end if;
if v_rec.am_so_distance > 50 then
	execute insertwarning(v_rec.kod,NULL::real,'AM vzdáleno od SO '::text || v_rec.am_so_distance::text || ' metrù'::text);
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
	'Dal¹í RUIAN bod je dost blízko (RUIANID '::text || v_rec.kod_b::text || ', '::text || 
	case when v_rec.ulice is not NULL then v_rec.ulice::text else '' end || 
	' èíslo '::text || 
	case when v_rec.cislo_popisne is not NULL then v_rec.cislo_popisne::text else '' end || 
	case when v_rec.cislo_evidencni is not NULL then v_rec.cislo_evidencni::text else '' end || 
	case when v_rec.cislo_orientacni is not NULL then '/' || v_rec.cislo_orientacni::text else '' end ||
	 ')');
end loop;
close ruiandistance;
raise notice 'ruiandistance done';


END;
$$;


ALTER FUNCTION import.make_allwarnings(update_mode boolean) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

