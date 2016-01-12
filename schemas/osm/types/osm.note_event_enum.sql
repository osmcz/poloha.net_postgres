--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osm, pg_catalog;

--
-- Name: note_event_enum; Type: TYPE; Schema: osm; Owner: osm
--

CREATE TYPE note_event_enum AS ENUM (
    'opened',
    'closed',
    'reopened',
    'commented',
    'hidden'
);


ALTER TYPE note_event_enum OWNER TO osm;

--
-- PostgreSQL database dump complete
--

