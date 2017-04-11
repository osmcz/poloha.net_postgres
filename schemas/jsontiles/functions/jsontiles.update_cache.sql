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

SET search_path = jsontiles, pg_catalog;

--
-- Name: update_cache(); Type: FUNCTION; Schema: jsontiles; Owner: pedro
--

CREATE FUNCTION update_cache() RETURNS void
    LANGUAGE plpgsql SECURITY DEFINER COST 10
    AS $$
declare
BEGIN
update jsontiles.tilecache set tile=jsontiles.jsontile(z,x,y) where z <= 12;
delete from jsontiles.tilecache where z > 12;
return;
END;
$$;


ALTER FUNCTION jsontiles.update_cache() OWNER TO pedro;

--
-- Name: update_cache(); Type: ACL; Schema: jsontiles; Owner: pedro
--

REVOKE ALL ON FUNCTION update_cache() FROM PUBLIC;
GRANT ALL ON FUNCTION update_cache() TO mapnik;


--
-- PostgreSQL database dump complete
--

