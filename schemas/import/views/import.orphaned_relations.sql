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
-- Name: orphaned_relations; Type: VIEW; Schema: import; Owner: import
--

CREATE VIEW orphaned_relations AS
 SELECT foo.relation_id,
    foo.version,
    foo.changeset_id,
    foo.nick,
    foo.created_at,
    foo.cas
   FROM ( SELECT DISTINCT ON (relations.id) relations.id AS relation_id,
            relations.version,
            relations.changeset_id,
            users.display_name AS nick,
            changesets.created_at,
            relations."timestamp" AS cas
           FROM (((((osm.current_relations relations
             LEFT JOIN osm.current_relation_tags tags ON (((((relations.id = tags.relation_id) AND (NOT ((tags.k)::text IN ( SELECT supplemental_tags.k
                   FROM osmtables.supplemental_tags)))) AND ((tags.k)::text !~~* 'source:%'::text)) AND ((tags.k)::text !~~* 'ref:%'::text))))
             LEFT JOIN osm.current_relation_members members ON (((relations.id = members.member_id) AND (members.member_type = 'Relation'::osm.nwr_enum))))
             LEFT JOIN osm.current_relation_members babies ON ((relations.id = babies.relation_id)))
             LEFT JOIN osm.changesets changesets ON ((relations.changeset_id = changesets.id)))
             LEFT JOIN osm.users ON ((users.id = changesets.user_id)))
          WHERE ((((tags.relation_id IS NULL) AND (members.member_id IS NULL)) AND (babies.relation_id IS NULL)) AND (relations.visible = true))) foo
  ORDER BY foo.created_at;


ALTER TABLE orphaned_relations OWNER TO import;

--
-- Name: orphaned_relations; Type: ACL; Schema: import; Owner: import
--

REVOKE ALL ON TABLE orphaned_relations FROM PUBLIC;
REVOKE ALL ON TABLE orphaned_relations FROM import;
GRANT ALL ON TABLE orphaned_relations TO import;
GRANT SELECT ON TABLE orphaned_relations TO PUBLIC;


--
-- PostgreSQL database dump complete
--

