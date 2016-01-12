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
-- Name: isphysical(co, bigint); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION isphysical(co co, id bigint) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
declare v_ret boolean;
BEGIN
case
when co='node' then
select into v_ret max((k in (select k from osmtables.itags_physical))::text)::boolean
from osm.current_node_tags where node_id=id;
when co='way' then
select into v_ret max((k in (select k from osmtables.itags_physical))::text)::boolean
from osm.current_way_tags where way_id=id;
when co='relation' then
select into v_ret max((k in (select k from osmtables.itags_physical))::text)::boolean
from osm.current_relation_tags where relation_id=id;
else
v_ret=NULL;
end case;
return v_ret;
end;
$$;


ALTER FUNCTION import.isphysical(co co, id bigint) OWNER TO import;

--
-- PostgreSQL database dump complete
--

