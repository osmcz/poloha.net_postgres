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
-- Name: orphaned_ways; Type: VIEW; Schema: import; Owner: import
--

CREATE VIEW orphaned_ways AS
 SELECT foo.way_id,
    foo.version,
    foo.changeset_id,
    foo.nick,
    foo.created_at,
    foo.cas
   FROM ( SELECT DISTINCT ON (ways.id) ways.id AS way_id,
            ways.version,
            changesets.id AS changeset_id,
            users.display_name AS nick,
            changesets.created_at,
            ways."timestamp" AS cas
           FROM ((((osm.current_ways ways
             LEFT JOIN osm.current_way_tags tags ON (((ways.id = tags.way_id) AND (NOT ((tags.k)::text IN ( SELECT supplemental_tags.k
                   FROM osmtables.supplemental_tags))) AND ((tags.k)::text !~~* 'source:%'::text) AND ((tags.k)::text !~~* 'ref:%'::text))))
             LEFT JOIN osm.current_relation_members members ON ((ways.id = members.member_id)))
             LEFT JOIN osm.changesets changesets ON ((ways.changeset_id = changesets.id)))
             LEFT JOIN osm.users ON ((users.id = changesets.user_id)))
          WHERE ((tags.way_id IS NULL) AND (members.member_id IS NULL) AND (ways.visible = true))) foo
  WHERE (line_in_cz(foo.way_id) AND ((foo.nick)::text <> 'Pfadfinder2013'::text))
  ORDER BY foo.created_at;


ALTER TABLE orphaned_ways OWNER TO import;

--
-- Name: orphaned_ways; Type: ACL; Schema: import; Owner: import
--

GRANT SELECT ON TABLE orphaned_ways TO PUBLIC;


--
-- PostgreSQL database dump complete
--

