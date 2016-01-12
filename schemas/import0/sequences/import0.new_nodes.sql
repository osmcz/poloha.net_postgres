--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import0, pg_catalog;

--
-- Name: new_nodes; Type: SEQUENCE; Schema: import0; Owner: import0
--

CREATE SEQUENCE new_nodes
    START WITH -1
    INCREMENT BY -1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE new_nodes OWNER TO import0;

--
-- PostgreSQL database dump complete
--

