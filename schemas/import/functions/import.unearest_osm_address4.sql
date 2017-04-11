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
-- Name: unearest_osm_address4(bigint); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION unearest_osm_address4(v_id bigint) RETURNS osmid
    LANGUAGE plpgsql COST 1
    AS $$
DECLARE
v_ruiangeom geometry;
v_cislo_popisne integer;
v_cislo_evidencni integer;
v_cislo_orientacni text;
v_ulice text;
v_osmid bigint;
v_co import.co;
v_maxdistance real;
BEGIN
v_maxdistance=100;
select into v_ruiangeom,v_cislo_popisne,v_cislo_evidencni,v_cislo_orientacni,v_ulice
geom,cislo_popisne,cislo_evidencni,cislo_orientacni,ulice
from import.ruian_adresy_dview
    where id = v_id;
if v_ruiangeom is NULL then
    return NULL;
end if;
-- 4.) shoda ulice (nebo alespon jedna ulice je NULL 0 pridano pozdeji) a cislo popisne, ale orientacni je NULL
select into v_co,v_osmid co,id from
    (select * from osm_adresy order by geom <-> v_ruiangeom limit 20) as foo
    where ((
    (conscriptionnumber = v_cislo_popisne::text) or 
    (substring(provisionalnumber from '[0-9]+') = v_cislo_evidencni::text)
) and 
    (streetnumber is NULL and  v_cislo_orientacni is NULL) and 
    ((difference(street,v_ulice) > 2) or street is NULL or v_ulice is NULL) 
    )
    and distance_meters(geom,v_ruiangeom) < v_maxdistance  and not isphysical(co,id)
order by st_distance(geom,v_ruiangeom) limit 1;
if v_osmid is not NULL then
    return (v_co,v_osmid)::osmid;
end if;


return NULL;
END;
$$;


ALTER FUNCTION import.unearest_osm_address4(v_id bigint) OWNER TO import;

--
-- PostgreSQL database dump complete
--

