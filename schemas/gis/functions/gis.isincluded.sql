--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = gis, pg_catalog;

--
-- Name: isincluded(smallint, import.co, bigint); Type: FUNCTION; Schema: gis; Owner: pedro
--

CREATE FUNCTION isincluded(v_zoom smallint, v_type import.co, v_osmid bigint) RETURNS boolean
    LANGUAGE plpgsql COST 2
    AS $$
declare
v_i bigint;
BEGIN
case
when v_type = 'node' then
	select into v_i tags.node_id
	  from osm.current_node_tags tags
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
	where tags.node_id=v_osmid and inc.id is not NULL and exc.id is NULL
	limit 1;
when v_type = 'way' then
	select into v_i tags.way_id
	  from osm.current_way_tags tags
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
	where tags.way_id=v_osmid and inc.id is not NULL and exc.id is NULL
	limit 1;
when v_type = 'relation' then
	select into v_i tags.relation_id
	  from osm.current_relation_tags tags
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
	where tags.relation_id=v_osmid and inc.id is not NULL and exc.id is NULL
	limit 1;
else
	return NULL::boolean;
end case;
return v_i is not NULL;
  END;
$$;


ALTER FUNCTION gis.isincluded(v_zoom smallint, v_type import.co, v_osmid bigint) OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

