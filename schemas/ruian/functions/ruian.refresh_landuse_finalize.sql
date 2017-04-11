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
-- Name: refresh_landuse_finalize(boolean); Type: FUNCTION; Schema: ruian; Owner: pedro
--

CREATE FUNCTION refresh_landuse_finalize(v_truncate boolean) RETURNS void
    LANGUAGE plpgsql COST 10000
    AS $$DECLARE
BEGIN
if v_truncate then
	truncate ruian.landuse;
else
	delete from ruian.landuse where okres_kod in (select okres_kod from ruian.tmplanduse group by okres_kod);
end if;
insert into ruian.landuse select * from ruian.tmplanduse;
truncate ruian.tmplanduse;
update import.datatimestamp set landuse=now();
END;
$$;


ALTER FUNCTION ruian.refresh_landuse_finalize(v_truncate boolean) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

