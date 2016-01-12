--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import, pg_catalog;

--
-- Name: make_delete(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION make_delete() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE kurzor cursor for select co,osmid from ruian_osm_delete where deleteit;
v_rec record;
BEGIN
open kurzor;
loop
fetch kurzor into v_rec;
if not found then
	exit;
end if;
select into v_rec dotahni_entitu(v_rec.co,v_rec.osmid,'delete');
end loop;
END;
$$;


ALTER FUNCTION import.make_delete() OWNER TO import;

--
-- PostgreSQL database dump complete
--

