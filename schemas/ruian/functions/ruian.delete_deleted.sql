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
-- Name: delete_deleted(); Type: FUNCTION; Schema: ruian; Owner: pedro
--

CREATE FUNCTION delete_deleted() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
delete from ruian.hlavicka where deleted;
--delete from ruian.rn_adresni_misto where deleted;
delete from ruian.rn_bonit_dily_parcel where deleted;
delete from ruian.rn_cast_obce where deleted;
delete from ruian.rn_detailni_tea where deleted;
delete from ruian.rn_katastralni_uzemi where deleted;
delete from ruian.rn_kraj_1960 where deleted;
delete from ruian.rn_momc where deleted;
delete from ruian.rn_mop where deleted;
delete from ruian.rn_obec where deleted;
delete from ruian.rn_okres where deleted;
delete from ruian.rn_orp where deleted;
delete from ruian.rn_parcela where deleted;
delete from ruian.rn_pou where deleted;
delete from ruian.rn_region_soudrznosti where deleted;
delete from ruian.rn_spravni_obvod where deleted;
delete from ruian.rn_stat where deleted;
--delete from ruian.rn_stavebni_objekt where deleted;
delete from ruian.rn_stavebni_objekt where deleted and kod not in
  (select stavobj_kod from ruian.rn_adresni_misto where deleted);
delete from ruian.rn_ulice where deleted;
delete from ruian.rn_vusc where deleted;
delete from ruian.rn_zpusob_ochrany_objektu where deleted;
delete from ruian.rn_zpusob_ochrany_pozemku where deleted;
delete from ruian.rn_zsj where deleted;
return;
END;
$$;


ALTER FUNCTION ruian.delete_deleted() OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

