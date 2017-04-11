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

SET search_path = osm, pg_catalog;

--
-- Name: user_roles_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE user_roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_roles_id_seq OWNER TO osm;

--
-- Name: user_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE user_roles_id_seq OWNED BY user_roles.id;


--
-- PostgreSQL database dump complete
--

