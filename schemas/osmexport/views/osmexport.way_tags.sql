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

SET search_path = osmexport, pg_catalog;

--
-- Name: way_tags; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW way_tags AS
 SELECT current_way_tags.way_id,
    x.version,
    current_way_tags.k,
    current_way_tags.v
   FROM (osm.current_way_tags
     LEFT JOIN osm.current_ways x ON ((x.id = current_way_tags.way_id)));


ALTER TABLE way_tags OWNER TO pedro;

--
-- Name: way_tags; Type: ACL; Schema: osmexport; Owner: pedro
--

GRANT SELECT ON TABLE way_tags TO PUBLIC;
GRANT SELECT ON TABLE way_tags TO osmexport;


--
-- PostgreSQL database dump complete
--

