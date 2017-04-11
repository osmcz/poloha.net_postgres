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
-- Name: zbytek_okresu(text); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION zbytek_okresu(nazev_okresu text) RETURNS public.geometry
    LANGUAGE plpgsql
    AS $$declare
v_ret geometry;
BEGIN
select into v_ret st_difference(st_union(okres.hranice),st_union(foo.hranice))
from
(
select okres,obec,sum(celkem) as celkem,sum(importovano) as importovano,st_union(o.hranice) as hranice
from import.stat_all s
left join ruian.rn_obec o on o.kod=s.obec_kod
where s.okres=nazev_okresu
group by okres,obec
) foo
left join ruian.rn_okres okres on foo.okres=okres.nazev
where foo.importovano::real / foo.celkem::real > 0.9;
return v_ret;
end;
$$;


ALTER FUNCTION import.zbytek_okresu(nazev_okresu text) OWNER TO import;

--
-- PostgreSQL database dump complete
--

