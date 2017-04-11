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
-- Name: crossbuildings_my; Type: VIEW; Schema: import; Owner: pedro
--

CREATE VIEW crossbuildings_my AS
 SELECT
        CASE
            WHEN (a.osm_id < 0) THEN 'relation'::co
            ELSE 'way'::co
        END AS co,
    abs(a.osm_id) AS osmid,
    u.display_name AS "user",
    ch.id AS changeset,
    ch.created_at
   FROM ((((crossbuildings a
     LEFT JOIN osm.current_ways way ON (((a.osm_id = way.id) AND (a.osm_id > 0))))
     LEFT JOIN osm.current_relations rel ON ((((- a.osm_id) = rel.id) AND (a.osm_id < 0))))
     LEFT JOIN osm.changesets ch ON (((way.changeset_id = ch.id) OR (rel.changeset_id = ch.id))))
     LEFT JOIN osm.users u ON ((ch.user_id = u.id)))
  WHERE ((u.id = 1942179) OR (u.id = 411213))
  ORDER BY ch.created_at DESC;


ALTER TABLE crossbuildings_my OWNER TO pedro;

--
-- Name: crossbuildings_my; Type: ACL; Schema: import; Owner: pedro
--

GRANT SELECT ON TABLE crossbuildings_my TO PUBLIC;


--
-- PostgreSQL database dump complete
--

