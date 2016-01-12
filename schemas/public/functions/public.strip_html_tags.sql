--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: strip_html_tags(text); Type: FUNCTION; Schema: public; Owner: pedro
--

CREATE FUNCTION strip_html_tags(text) RETURNS text
    LANGUAGE sql
    AS $_$
SELECT regexp_replace(regexp_replace($1, E'(?x)<[^>]*?(\s alt \s* = \s* ([\'"]) ([^>]*?) \2) [^>]*? >', E'\3'), E'(?x)(< [^>]*? >)', '', 'g')
$_$;


ALTER FUNCTION public.strip_html_tags(text) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

