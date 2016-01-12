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
-- Name: update_stats2(); Type: FUNCTION; Schema: import; Owner: pedro
--

CREATE FUNCTION update_stats2() RETURNS void
    LANGUAGE plpgsql
    AS $$BEGIN
refresh materialized view import.stats_all;
truncate import.stat_all;
insert into import.stat_all select * from import.stats_all;
analyze import.stat_all;
return;
END;
$$;


ALTER FUNCTION import.update_stats2() OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

