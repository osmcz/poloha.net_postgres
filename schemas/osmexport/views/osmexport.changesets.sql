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
-- Name: changesets; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW changesets AS
 SELECT changesets.id,
    changesets.user_id,
    changesets.created_at,
    changesets.min_lat,
    changesets.max_lat,
    changesets.min_lon,
    changesets.max_lon,
    changesets.closed_at,
    changesets.num_changes
   FROM osm.changesets;


ALTER TABLE changesets OWNER TO pedro;

--
-- Name: changesets; Type: ACL; Schema: osmexport; Owner: pedro
--

GRANT SELECT ON TABLE changesets TO PUBLIC;
GRANT SELECT ON TABLE changesets TO osmexport;


--
-- PostgreSQL database dump complete
--

