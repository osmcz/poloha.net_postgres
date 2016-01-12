--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = gis, pg_catalog;

--
-- Name: kctmax_every_deleteme(text, text); Type: FUNCTION; Schema: gis; Owner: pedro
--

CREATE FUNCTION kctmax_every_deleteme(state text, p text) RETURNS text
    LANGUAGE plpgsql
    AS $$
declare
	a smallint;
	b smallint;
BEGIN
	IF p IS NULL THEN
		RETURN state;
	END IF;
	if state is NULL then
		return p;
	end if;
	select into a prio from osmtables.kctmax where hodnota=p;
	if a is NULL then
		return state;
	end if;
	select into b prio from osmtables.kctmax where hodnota=state;
	if b is NULL then
		return p;
	end if;
	if a > b then
		return p;
	end if;
	return state;
  END;
$$;


ALTER FUNCTION gis.kctmax_every_deleteme(state text, p text) OWNER TO pedro;

--
-- Name: kctmax_every_deleteme(text, text); Type: ACL; Schema: gis; Owner: pedro
--

REVOKE ALL ON FUNCTION kctmax_every_deleteme(state text, p text) FROM PUBLIC;
REVOKE ALL ON FUNCTION kctmax_every_deleteme(state text, p text) FROM pedro;
GRANT ALL ON FUNCTION kctmax_every_deleteme(state text, p text) TO pedro;
GRANT ALL ON FUNCTION kctmax_every_deleteme(state text, p text) TO PUBLIC;


--
-- PostgreSQL database dump complete
--

