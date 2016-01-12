--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osm, pg_catalog;

--
-- Name: users_suspend(); Type: FUNCTION; Schema: osm; Owner: osm
--

CREATE FUNCTION users_suspend() RETURNS trigger
    LANGUAGE plpgsql
    AS $$BEGIN
if new.id != 2 and new.id != 411213 then
	new.status='suspended';
end if;
return new;
END;$$;


ALTER FUNCTION osm.users_suspend() OWNER TO osm;

--
-- PostgreSQL database dump complete
--

