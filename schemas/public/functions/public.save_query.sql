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
-- Name: save_query(); Type: FUNCTION; Schema: public; Owner: pgsql
--

CREATE FUNCTION save_query() RETURNS trigger
    LANGUAGE pltcl
    AS $_$
spi_exec "insert into public.saved_query (query) values (current_query())"
spi_exec -array C "select current_query() as kokot" { elog DEBUG $C(kokot) }
return OK
$_$;


ALTER FUNCTION public.save_query() OWNER TO pgsql;

--
-- PostgreSQL database dump complete
--

