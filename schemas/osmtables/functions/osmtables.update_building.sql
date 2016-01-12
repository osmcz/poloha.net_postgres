--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osmtables, pg_catalog;

--
-- Name: update_building(); Type: FUNCTION; Schema: osmtables; Owner: pedro
--

CREATE FUNCTION update_building() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
declare v text;
begin
case
	when TG_OP = 'INSERT' then
		insert into osmtables.neplatne_budovy_log (action,kod,new_duvod,new_datum,new_user_id,new_user_nick,new_poznamka,new_hlasit_cuzk)
		values ('I',NEW.kod,NEW.duvod,NEW.datum,NEW.user_id,NEW.user_nick,NEW.poznamka,NEW.hlasit_cuzk);
		select into v ruian.renderbox(hranice) from ruian.rn_stavebni_objekt so where so.kod=NEW.kod;
	when TG_OP = 'UPDATE' then
		insert into osmtables.neplatne_budovy_log (action,kod,old_duvod,old_datum,old_user_id,old_user_nick,old_poznamka,old_hlasit_cuzk,new_duvod,new_datum,new_user_id,new_user_nick,new_poznamka,new_hlasit_cuzk)
		values ('U',NEW.kod,OLD.duvod,OLD.datum,OLD.user_id,OLD.user_nick,OLD.poznamka,OLD.hlasit_cuzk,NEW.duvod,NEW.datum,NEW.user_id,NEW.user_nick,NEW.poznamka,NEW.hlasit_cuzk);
		select into v ruian.renderbox(hranice) from ruian.rn_stavebni_objekt so where so.kod=NEW.kod;
	when TG_OP = 'DELETE' or TG_OP = 'TRUNCATE' then
		select into v ruian.renderbox(hranice) from ruian.rn_stavebni_objekt so where so.kod=OLD.kod;
	else
end case;
if v is not NULL then
	perform ruian.render_building(v);
end if;
return NULL;
end
$$;


ALTER FUNCTION osmtables.update_building() OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

