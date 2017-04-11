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

SET search_path = osmtables, pg_catalog;

--
-- Name: delete_building(bigint, bigint, text); Type: FUNCTION; Schema: osmtables; Owner: pedro
--

CREATE FUNCTION delete_building(v_kod bigint, v_user_id bigint, v_user_nick text) RETURNS integer
    LANGUAGE plpgsql
    AS $$
DECLARE affected_rows integer;
BEGIN
insert into osmtables.neplatne_budovy_log (action,kod,old_duvod,old_datum,old_user_id,old_user_nick,old_poznamka,old_hlasit_cuzk,new_user_id,new_user_nick,new_datum)
 (select 'D',kod,duvod,datum,user_id,user_nick,poznamka,hlasit_cuzk,v_user_id,v_user_nick,now()
from osmtables.neplatne_budovy nb where nb.kod=v_kod
);
delete from osmtables.neplatne_budovy nb where nb.kod=v_kod;
GET DIAGNOSTICS affected_rows = ROW_COUNT;
return affected_rows;
END;
$$;


ALTER FUNCTION osmtables.delete_building(v_kod bigint, v_user_id bigint, v_user_nick text) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

