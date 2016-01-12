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
-- Name: local_textgeom(geometry); Type: FUNCTION; Schema: public; Owner: pedro
--

CREATE FUNCTION local_textgeom(geom geometry) RETURNS text
    LANGUAGE plpgsql COST 1
    AS $$
DECLARE
v_geom geometry;
r text;

BEGIN
select into v_geom st_centroid(geom);
if geom is NULL then
	return NULL::text;
end if;
select into r (st_y(st_transform(v_geom,4326)))::text  || ' ' || (st_x(st_transform(v_geom,4326)))::text;
return r;
END;
$$;


ALTER FUNCTION public.local_textgeom(geom geometry) OWNER TO pedro;

--
-- Name: local_textgeom(geometry); Type: ACL; Schema: public; Owner: pedro
--

REVOKE ALL ON FUNCTION local_textgeom(geom geometry) FROM PUBLIC;
REVOKE ALL ON FUNCTION local_textgeom(geom geometry) FROM pedro;
GRANT ALL ON FUNCTION local_textgeom(geom geometry) TO pedro;
GRANT ALL ON FUNCTION local_textgeom(geom geometry) TO PUBLIC;


--
-- PostgreSQL database dump complete
--

