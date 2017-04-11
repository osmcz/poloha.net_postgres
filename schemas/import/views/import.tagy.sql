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

SET default_tablespace = '';

--
-- Name: tagy; Type: MATERIALIZED VIEW; Schema: import; Owner: pedro
--

CREATE MATERIALIZED VIEW tagy AS
 SELECT count(*) AS pocet,
    foo.co,
    foo.k,
    foo.v
   FROM ( SELECT 'way'::text AS co,
            current_way_tags.k,
            current_way_tags.v
           FROM osm.current_way_tags
        UNION ALL
         SELECT 'node'::text AS co,
            current_node_tags.k,
            current_node_tags.v
           FROM osm.current_node_tags
        UNION ALL
         SELECT 'relation'::text AS co,
            current_relation_tags.k,
            current_relation_tags.v
           FROM osm.current_relation_tags) foo
  GROUP BY foo.co, foo.k, foo.v
  WITH NO DATA;


ALTER TABLE tagy OWNER TO pedro;

--
-- Name: tagy; Type: ACL; Schema: import; Owner: pedro
--

GRANT SELECT ON TABLE tagy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

