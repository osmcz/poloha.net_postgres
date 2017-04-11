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

SET search_path = ruian, pg_catalog;

--
-- Name: render_budovy(text); Type: FUNCTION; Schema: ruian; Owner: pedro
--

CREATE FUNCTION render_budovy(text) RETURNS void
    LANGUAGE plsh
    AS $_$
#!/bin/sh
/usr/local/bin/tirex-batch -p 5 -f exists map=budovy,budovy-todo bbox=$1 z=12-20 >/dev/null 2>&1
exit 0
$_$;


ALTER FUNCTION ruian.render_budovy(text) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

