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

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: t_5514; Type: TABLE; Schema: public; Owner: pedro
--

CREATE TABLE t_5514 (
    srid integer,
    auth_name character varying(256),
    auth_srid integer,
    srtext character varying(2048),
    proj4text character varying(2048)
);


ALTER TABLE t_5514 OWNER TO pedro;

--
-- Name: t_5514; Type: ACL; Schema: public; Owner: pedro
--

GRANT SELECT ON TABLE t_5514 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

