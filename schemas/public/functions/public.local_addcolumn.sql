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
-- Name: local_addcolumn(text, text, text, text); Type: FUNCTION; Schema: public; Owner: pedro
--

CREATE FUNCTION local_addcolumn(xschema text, xtable text, xcolumn text, xtype text) RETURNS void
    LANGUAGE plpgsql
    AS $_$
DECLARE
    xschema ALIAS FOR $1;
    xtable ALIAS FOR $2;
    xcolumn ALIAS FOR $3;
    xtype ALIAS FOR $4;
    x text;
    xquery text;
BEGIN
	if xtable !~ '^[a-zA-Z][a-zA-Z0-9_]*$' or xcolumn !~ '^[a-zA-Z][a-zA-Z0-9_]*$' or xtype !~ '^[a-zA-Z][a-zA-Z0-9_]*$' then
		raise exception 'SQL INJECTION ATTEMPT';
	end if;
	select into x column_name FROM information_schema.columns where table_schema = 'public' and table_name = xtable and column_name = xcolumn;
	if found then
		raise notice 'COLUMN ALREADY EXISTS';
	else
		xquery := 'alter table ' || xtable || ' add column ' || xcolumn || ' ' || xtype;
		execute xquery;
		raise notice 'COLUMN SUCCESSFULLY ADDED';
	end if;
END;

$_$;


ALTER FUNCTION public.local_addcolumn(xschema text, xtable text, xcolumn text, xtype text) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

