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
-- Name: render_adresy(text); Type: FUNCTION; Schema: ruian; Owner: pedro
--

CREATE FUNCTION render_adresy(text) RETURNS void
    LANGUAGE plsh
    AS $_$
#!/bin/sh
/usr/local/bin/tirex-batch -p 5 -f exists map=adresy bbox=$1 z=12-20 >/dev/null 2>&1
exit 0
$_$;


ALTER FUNCTION ruian.render_adresy(text) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

