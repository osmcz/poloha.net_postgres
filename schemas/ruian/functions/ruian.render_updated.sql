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
-- Name: render_updated(); Type: FUNCTION; Schema: ruian; Owner: pedro
--

CREATE FUNCTION render_updated() RETURNS void
    LANGUAGE plpgsql COST 1
    AS $$
DECLARE
BEGIN
create temp table temp_adresy as
select ruian.renderbox(am.definicni_bod) a
from ruian.rn_adresni_misto am
left join ruian.rn_stavebni_objekt so on am.stavobj_kod=so.kod
left join ruian.rn_parcela parcela on parcela.id=so.identifikacni_parcela_id
where am.item_timestamp > now() - interval '3 hours' and parcela.katuz_kod not in
    (select kod from ruian.dkm where new);

create temp table temp_ulice as
select ruian.renderbox(definicni_cara) a
from ruian.rn_ulice ulice where item_timestamp > now() - interval '3 hours';

create temp table temp_budovy as
select ruian.renderbox(so.hranice) a
from ruian.rn_stavebni_objekt so
left join ruian.rn_parcela parcela on parcela.id=so.identifikacni_parcela_id
where so.item_timestamp > now() - interval '3 hours' and parcela.katuz_kod not in
    (select kod from ruian.dkm where new);

create temp table temp_parcely as
select ruian.renderbox(parcela.hranice) a
from ruian.rn_parcela parcela
where parcela.item_timestamp > now() - interval '3 hours' and parcela.katuz_kod not in
    (select kod from ruian.dkm where new);

perform ruian.render_adresy(a) from temp_adresy;
perform ruian.render_ulice(a) from temp_ulice;
perform ruian.render_budovy(a) from temp_budovy;
perform ruian.render_parcely(a) from temp_parcely;
return;
END;
$$;


ALTER FUNCTION ruian.render_updated() OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

