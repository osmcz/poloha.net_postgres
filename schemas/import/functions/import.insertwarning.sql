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

SET search_path = import, pg_catalog;

--
-- Name: insertwarning(bigint, real, text); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION insertwarning(local_kod bigint, local_distance real, local_popis text) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
i bigint;
BEGIN
select into i kod from allwarnings where kod=local_kod;
if not found then
	insert into allwarnings(kod,distance,popis) values(local_kod,local_distance,local_popis);
else
	if local_distance is not NULL then
		update allwarnings set distance=min(distance,local_distance),popis=popis || ', ' || local_popis
		where kod=local_kod;
	else
		update allwarnings set popis=popis || ', ' || local_popis
		where kod=local_kod;
	end if;
end if;
END;
$$;


ALTER FUNCTION import.insertwarning(local_kod bigint, local_distance real, local_popis text) OWNER TO import;

--
-- PostgreSQL database dump complete
--

