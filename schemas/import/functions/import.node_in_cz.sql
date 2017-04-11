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
-- Name: node_in_cz(bigint); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION node_in_cz(v_id bigint) RETURNS boolean
    LANGUAGE plpgsql COST 10
    AS $$DECLARE v_ret boolean;
BEGIN
select into v_ret st_within(
	(select st_transform(
		(select (st_setsrid(st_makepoint(nodes.longitude/10000000::real,nodes.latitude/10000000::real),4326))
		from osm.current_nodes nodes
		where nodes.id=v_id
	),900913))
,
	(select hranice from ruian.rn_stat where not deleted)
);
return v_ret;
END;
$$;


ALTER FUNCTION import.node_in_cz(v_id bigint) OWNER TO import;

--
-- PostgreSQL database dump complete
--

