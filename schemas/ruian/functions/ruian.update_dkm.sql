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
-- Name: update_dkm(); Type: FUNCTION; Schema: ruian; Owner: pedro
--

CREATE FUNCTION update_dkm() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
v_geom geometry;
BEGIN
drop table if exists temp_zxy;
create temp table temp_zxy as
select ku.kod,ku.plati_od,ku.ma_dkm and p.hranice::real/p.pocet::real > 0.3 as ma_dkm from ruian.rn_katastralni_uzemi ku
left join (select katuz_kod,count(*) as pocet,count(hranice) as hranice from ruian.rn_parcela where not deleted group by katuz_kod) p on ku.kod=p.katuz_kod
where not ku.deleted
;

--update ruian.dkm set new=false;
insert into ruian.dkm (kod,ma_dkm) select kod,ma_dkm from temp_zxy tmp where tmp.kod not in (select kod from ruian.dkm);
update ruian.dkm dkm set ma_dkm=true,new=true,datum=plati_od from (select kod,ma_dkm,plati_od from temp_zxy ku) ku where dkm.kod=ku.kod and dkm.ma_dkm=false and ku.ma_dkm=true;
drop table if exists temp_zxy;
return;
END;
$$;


ALTER FUNCTION ruian.update_dkm() OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

