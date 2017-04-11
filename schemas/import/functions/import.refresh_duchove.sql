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
-- Name: refresh_duchove(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION refresh_duchove() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
v_rec record;
kurzor cursor for select h.cobce_kod as cobce_kod_hranice,d.cobce_kod as cobce_kod_duch
	from temp_a a
	left join ruian.rn_stavebni_objekt h on a.kod_hranice=h.kod
	left join ruian.rn_stavebni_objekt d on a.kod_duch=d.kod
where h.cisla_domovni is not NULL and d.cisla_domovni is not NULL;
BEGIN
drop table if exists temp_a;
create temp table temp_a as select so.kod as kod_hranice,s.kod as kod_duch from ruian.rn_stavebni_objekt so
left join ruian.rn_stavebni_objekt s
on s.hranice is NULL and so.hranice is not NULL and st_contains(so.hranice,s.definicni_bod) and s.cisla_domovni is not NULL
where s.kod is not NULL
and so.cisla_domovni is not NULL
and not so.deleted
and not s.deleted;
drop table if exists temp_x;
create temp table temp_x (cobce_kod integer);
open kurzor;
loop
fetch kurzor into v_rec;
if not found then
	exit;
end if;
case
when v_rec.cobce_kod_hranice is not NULL and v_rec.cobce_kod_duch is not NULL and v_rec.cobce_kod_hranice <> v_rec.cobce_kod_duch then
	insert into temp_x(cobce_kod) values (v_rec.cobce_kod_hranice);
	insert into temp_x(cobce_kod) values (v_rec.cobce_kod_duch);
when v_rec.cobce_kod_hranice is not NULL then
	insert into temp_x(cobce_kod) values (v_rec.cobce_kod_hranice);
when v_rec.cobce_kod_duch is not NULL then
	insert into temp_x(cobce_kod) values (v_rec.cobce_kod_duch);
else
end case;
end loop;
close kurzor;
truncate import.stat_duchove;
insert into import.stat_duchove (cobce_kod,pocet_celkem,pocet_duchove)
	select so.cobce_kod as cobce,so.pocet as pocet_celkem,duchove.pocet as pocet_duchove from
		((select count(*) as pocet,cobce_kod
			from ruian.rn_stavebni_objekt so
			where not so.deleted
			group by so.cobce_kod) as so
			left join (select count(*) as pocet,cobce_kod from temp_x group by cobce_kod) as duchove
				on so.cobce_kod = duchove.cobce_kod);

drop table if exists temp_x;
drop table if exists temp_a;
return;
END;
$$;


ALTER FUNCTION import.refresh_duchove() OWNER TO import;

--
-- PostgreSQL database dump complete
--

