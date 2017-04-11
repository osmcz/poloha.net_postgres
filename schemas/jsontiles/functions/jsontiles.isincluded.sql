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

SET search_path = jsontiles, pg_catalog;

--
-- Name: isincluded(smallint, co, bigint); Type: FUNCTION; Schema: jsontiles; Owner: pedro
--

CREATE FUNCTION isincluded(v_zoom smallint, v_type co, v_osmid bigint) RETURNS boolean
    LANGUAGE plpgsql COST 2
    AS $$
declare
v_i bigint;
BEGIN
case
when v_type = 'node' then
	select into v_i count(*)
	  from (select skeys(hstore(tags)) k,svals(hstore(tags)) v from jsontiles.nodes where id=v_osmid) tags
	    left join jsontiles.jsonobjects inc on
	      inc.flag='I'
	      and v_zoom >= inc.zoom_min
	      and v_zoom <= inc.zoom_max
	      and tags.k=inc.k
	      and (tags.v=inc.v or inc.v is NULL)
	    left join jsontiles.jsonobjects exc on
	      exc.flag='E'
	      and v_zoom >= exc.zoom_min
	      and v_zoom <= exc.zoom_max
	      and tags.k=exc.k
	      and (tags.v=exc.v or exc.v is NULL)
	where inc.id is not NULL and exc.id is NULL
	limit 1;
when v_type = 'way' then
	select into v_i count(*)
	  from (select skeys(hstore(tags)) k,svals(hstore(tags)) v from jsontiles.ways where id=v_osmid) tags
	    left join jsontiles.jsonobjects inc on
	      inc.flag='I'
	      and v_zoom >= inc.zoom_min
	      and v_zoom <= inc.zoom_max
	      and tags.k=inc.k
	      and (tags.v=inc.v or inc.v is NULL)
	    left join jsontiles.jsonobjects exc on
	      exc.flag='E'
	      and v_zoom >= exc.zoom_min
	      and v_zoom <= exc.zoom_max
	      and tags.k=exc.k
	      and (tags.v=exc.v or exc.v is NULL)
	where inc.id is not NULL and exc.id is NULL
	limit 1;
when v_type = 'relation' then
	select into v_i count(*)
	  from (select skeys(hstore(tags)) k,svals(hstore(tags)) v from jsontiles.rels where id=v_osmid) tags
	    left join jsontiles.jsonobjects inc on
	      inc.flag='I'
	      and v_zoom >= inc.zoom_min
	      and v_zoom <= inc.zoom_max
	      and tags.k=inc.k
	      and (tags.v=inc.v or inc.v is NULL)
	    left join jsontiles.jsonobjects exc on
	      exc.flag='E'
	      and v_zoom >= exc.zoom_min
	      and v_zoom <= exc.zoom_max
	      and tags.k=exc.k
	      and (tags.v=exc.v or exc.v is NULL)
	where inc.id is not NULL and exc.id is NULL
	limit 1;
else
	return NULL::boolean;
end case;
return v_i > 0;
  END;
$$;


ALTER FUNCTION jsontiles.isincluded(v_zoom smallint, v_type co, v_osmid bigint) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

