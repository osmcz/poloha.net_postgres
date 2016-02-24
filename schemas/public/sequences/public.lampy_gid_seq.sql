--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: lampy_gid_seq; Type: SEQUENCE; Schema: public; Owner: pedro
--

CREATE SEQUENCE lampy_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lampy_gid_seq OWNER TO pedro;

--
-- Name: lampy_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pedro
--

ALTER SEQUENCE lampy_gid_seq OWNED BY lampy.gid;


--
-- PostgreSQL database dump complete
--

