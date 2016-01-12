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
-- Name: clean_deleted(); Type: FUNCTION; Schema: gis; Owner: pedro
--

CREATE FUNCTION clean_deleted() RETURNS void
    LANGUAGE plpgsql COST 1000
    AS $$
BEGIN
delete from gis.cz_nodes where id in
(
select gis.id from gis.cz_nodes gis
left join osm.current_nodes osm on gis.id=osm.id
  where gis.id > 0
  and osm.id is NULL
);

delete from gis.cz_ways where id in
(
select gis.id from gis.cz_ways gis
left join osm.current_ways osm on gis.id=osm.id
 where gis.id > 0
  and osm.id is NULL );

delete from gis.cz_rels where id in
(
select gis.id from gis.cz_rels gis
left join osm.current_relations osm on gis.id=osm.id
  where gis.id > 0
  and osm.id is NULL
);

delete from gis.cz_point where osm_id in
(
select gis.osm_id from gis.cz_point gis
left join osm.current_nodes osm on gis.osm_id=osm.id
  where gis.osm_id > 0
  and osm.id is NULL
);

delete from gis.cz_line where osm_id in
(
select gis.osm_id from gis.cz_line gis
left join osm.current_ways osm on gis.osm_id=osm.id
  where gis.osm_id > 0
  and osm.id is NULL
);

delete from gis.cz_line where osm_id in
(
select gis.osm_id from gis.cz_line gis
left join osm.current_relations osm on -gis.osm_id=osm.id
  where gis.osm_id < 0
  and osm.id is NULL
);

delete from gis.cz_polygon where osm_id in
(
select gis.osm_id from gis.cz_polygon gis
left join osm.current_ways osm on gis.osm_id=osm.id
  where gis.osm_id > 0
  and osm.id is NULL
);

delete from gis.cz_polygon where osm_id in
(
select gis.osm_id from gis.cz_polygon gis
left join osm.current_relations osm on -gis.osm_id=osm.id
  where gis.osm_id < 0
  and osm.id is NULL
);

delete from gis.cz_roads where osm_id in
(
select gis.osm_id from gis.cz_roads gis
left join osm.current_ways osm on gis.osm_id=osm.id
  where gis.osm_id > 0
  and osm.id is NULL
);

delete from gis.cz_roads where osm_id in
(
select gis.osm_id from gis.cz_roads gis
left join osm.current_relations osm on -gis.osm_id=osm.id
  where gis.osm_id < 0
  and osm.id is NULL
);

  END;
$$;


ALTER FUNCTION gis.clean_deleted() OWNER TO pedro;

--
-- Name: clean_deleted(); Type: ACL; Schema: gis; Owner: pedro
--

REVOKE ALL ON FUNCTION clean_deleted() FROM PUBLIC;
REVOKE ALL ON FUNCTION clean_deleted() FROM pedro;
GRANT ALL ON FUNCTION clean_deleted() TO pedro;
GRANT ALL ON FUNCTION clean_deleted() TO mapnik;


--
-- PostgreSQL database dump complete
--

