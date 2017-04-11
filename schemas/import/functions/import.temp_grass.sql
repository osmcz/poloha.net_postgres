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
-- Name: temp_grass(); Type: FUNCTION; Schema: import; Owner: pedro
--

CREATE FUNCTION temp_grass() RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$
DECLARE
v_rec record;
grass cursor for select * from public.temp_grass;
BEGIN
truncate text_changeset;
truncate inchangeset;
insert into text_changeset(xml) values('<osm version="0.6" generator="CzechAddress">');

open grass;
loop
fetch grass into v_rec;
if not found then
    exit;
end if;
perform dotahni_entitu('way'::import.co,v_rec.id,NULL::text);
end loop;
close grass;

insert into text_changeset(xml) values('</osm>');
update text_changeset set xml=replace(xml,'<tag/>','');
return;
END;
$$;


ALTER FUNCTION import.temp_grass() OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

