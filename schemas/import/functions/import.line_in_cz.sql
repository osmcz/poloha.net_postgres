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
-- Name: line_in_cz(bigint); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION line_in_cz(v_id bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$DECLARE v_ret boolean;
BEGIN
select into v_ret st_within(
	(select st_transform(st_makeline(
	array(
		(select (st_setsrid(st_makepoint(nodes.longitude/10000000::real,nodes.latitude/10000000::real),4326))
		from osm.current_way_nodes cwn
		left join osm.current_nodes nodes on cwn.node_id = nodes.id
		where cwn.way_id=v_id
		order by sequence_id)
	)
	),900913))
,
	(select hranice from ruian.rn_stat where not deleted)
);
return v_ret;
END;
$$;


ALTER FUNCTION import.line_in_cz(v_id bigint) OWNER TO import;

--
-- PostgreSQL database dump complete
--

