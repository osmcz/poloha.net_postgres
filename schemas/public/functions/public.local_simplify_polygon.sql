--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: local_simplify_polygon(geometry); Type: FUNCTION; Schema: public; Owner: pedro
--

CREATE FUNCTION local_simplify_polygon(v_geom geometry) RETURNS geometry
    LANGUAGE plpgsql COST 1
    AS $$
DECLARE
pole geometry[];
azimut_ab real;
azimut_ac real;
max_angle real;
max_distance real;
i smallint; -- index bodu a
j smallint; -- index bodu b
k smallint; -- index bodu c
l smallint; -- pocet bodu polygonu na zacatku zpracovani
ab real; -- vzdalenost prvniho a prostredniho bodu
bc real; -- vzdalenost prostredniho a posledniho bodu
bx real; -- vzdalenost spustene kolmice z bodu b k primce ac

BEGIN
-- return v_geom; -- funkce nedela nic
max_angle= 3 * (pi()/180); -- 3 stupne
max_distance= 0.15; -- 15 cm
i=1;
j=2;
k=3;

select into pole (select array (

select 
((st_dumppoints(st_exteriorring(v_geom))).geom) as geom

));
l=array_length(pole,1);
--	raise notice 'Vstupni polygon: %',l;
loop
if k > array_length(pole,1) -- dosahli jsme konce polygonu
then
    k = 2;
    j = 1;
    i = array_length(pole,1)-1;
end if;
azimut_ab = st_azimuth(pole[i],pole[j]);
azimut_ac = st_azimuth(pole[i],pole[k]);
ab=st_distance(st_transform(pole[i],4326)::geography,st_transform(pole[j],4326)::geography);
bc=st_distance(st_transform(pole[j],4326)::geography,st_transform(pole[k],4326)::geography);
bx=abs(st_distance(st_transform(pole[i],4326)::geography,st_transform(pole[j],4326)::geography)*sin(abs(azimut_ab-azimut_ac)));
-- raise notice '        ';
-- raise notice '    I: %',i;
-- raise notice '    J: %',j;
-- raise notice '    K: %',k;
-- raise notice ' Poly: %',array_length(pole,1);
-- raise notice 'az_ab: %',azimut_ab;
-- raise notice 'az_ac: %',azimut_ac;
-- raise notice '   ab: %',ab;
-- raise notice '   bc: %',bc;
-- raise notice '   bx: %',bx;
if abs(azimut_ab-azimut_ac) <= max_angle and  bx <= max_distance -- skoro rovna cara
then
    if i>k -- mazeme prvni a posledni bod polygonu
    then
-- 	raise notice 'DELETE BEGIN/END';
	pole[1]=NULL; -- smazeme prvni a posledni bod polygonu
	pole[array_length(pole,1)]=NULL;
	pole=array_remove(pole,NULL); 
	-- i=i-1;
--	pole=array_append(pole,pole[1]); -- a musime tedy dotvorit validni polygon
    else
-- 	raise notice 'DELETE SIMPLE';
	pole[j]=NULL; -- nebo mazeme jen obycejny bod
	pole=array_remove(pole,NULL);
    end if;
else
    i=i+1;
    j=j+1;
    k=k+1;
end if;
l=l-1;
exit when l=1;
end loop;
-- raise notice '';
-- raise notice 'Vystupni polygon: %',array_length(pole,1);
if not (pole[1] ~= pole[array_length(pole,1)]) -- na zaver jeste jednou test uzavrenosti
then
    	pole=array_append(pole,pole[1]);
end if;
return st_makepolygon(st_makeline(pole));
END;
$$;


ALTER FUNCTION public.local_simplify_polygon(v_geom geometry) OWNER TO pedro;

--
-- Name: local_simplify_polygon(geometry); Type: ACL; Schema: public; Owner: pedro
--

REVOKE ALL ON FUNCTION local_simplify_polygon(v_geom geometry) FROM PUBLIC;
REVOKE ALL ON FUNCTION local_simplify_polygon(v_geom geometry) FROM pedro;
GRANT ALL ON FUNCTION local_simplify_polygon(v_geom geometry) TO pedro;
GRANT ALL ON FUNCTION local_simplify_polygon(v_geom geometry) TO PUBLIC;


--
-- PostgreSQL database dump complete
--

