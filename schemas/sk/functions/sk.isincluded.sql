--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = sk, pg_catalog;

--
-- Name: isincluded(smallint, import.co, bigint); Type: FUNCTION; Schema: sk; Owner: pedro
--

CREATE FUNCTION isincluded(v_zoom smallint, v_type import.co, v_osmid bigint) RETURNS boolean
    LANGUAGE plpgsql COST 2
    AS $$
declare
v_i bigint;
BEGIN
case
when v_type = 'node' then
	select into v_i count(*)
	  from (select skeys(hstore(tags)) k,svals(hstore(tags)) v from sk.sk_nodes where id=v_osmid) tags
	    left join osmtables.jsonobjects inc on
	      inc.flag='I'
	      and v_zoom >= inc.zoom_min
	      and v_zoom <= inc.zoom_max
	      and tags.k=inc.k
	      and (tags.v=inc.v or inc.v is NULL)
	    left join osmtables.jsonobjects exc on
	      exc.flag='E'
	      and v_zoom >= exc.zoom_min
	      and v_zoom <= exc.zoom_max
	      and tags.k=exc.k
	      and (tags.v=exc.v or exc.v is NULL)
	where inc.id is not NULL and exc.id is NULL
	limit 1;
when v_type = 'way' then
	select into v_i count(*)
	  from (select skeys(hstore(tags)) k,svals(hstore(tags)) v from sk.sk_ways where id=v_osmid) tags
	    left join osmtables.jsonobjects inc on
	      inc.flag='I'
	      and v_zoom >= inc.zoom_min
	      and v_zoom <= inc.zoom_max
	      and tags.k=inc.k
	      and (tags.v=inc.v or inc.v is NULL)
	    left join osmtables.jsonobjects exc on
	      exc.flag='E'
	      and v_zoom >= exc.zoom_min
	      and v_zoom <= exc.zoom_max
	      and tags.k=exc.k
	      and (tags.v=exc.v or exc.v is NULL)
	where inc.id is not NULL and exc.id is NULL
	limit 1;
when v_type = 'relation' then
	select into v_i count(*)
	  from (select skeys(hstore(tags)) k,svals(hstore(tags)) v from sk.sk_rels where id=v_osmid) tags
	    left join osmtables.jsonobjects inc on
	      inc.flag='I'
	      and v_zoom >= inc.zoom_min
	      and v_zoom <= inc.zoom_max
	      and tags.k=inc.k
	      and (tags.v=inc.v or inc.v is NULL)
	    left join osmtables.jsonobjects exc on
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


ALTER FUNCTION sk.isincluded(v_zoom smallint, v_type import.co, v_osmid bigint) OWNER TO pedro;

--
-- Name: isincluded(smallint, import.co, bigint); Type: ACL; Schema: sk; Owner: pedro
--

REVOKE ALL ON FUNCTION isincluded(v_zoom smallint, v_type import.co, v_osmid bigint) FROM PUBLIC;
REVOKE ALL ON FUNCTION isincluded(v_zoom smallint, v_type import.co, v_osmid bigint) FROM pedro;
GRANT ALL ON FUNCTION isincluded(v_zoom smallint, v_type import.co, v_osmid bigint) TO pedro;
GRANT ALL ON FUNCTION isincluded(v_zoom smallint, v_type import.co, v_osmid bigint) TO PUBLIC;


--
-- PostgreSQL database dump complete
--

