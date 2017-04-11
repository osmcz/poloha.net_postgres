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

SET search_path = ruian, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: tmplands_okresy; Type: TABLE; Schema: ruian; Owner: pedro
--

CREATE TABLE tmplands_okresy (
    kod integer NOT NULL,
    nazev text,
    inprogress boolean DEFAULT false NOT NULL,
    done boolean DEFAULT false NOT NULL,
    thread smallint NOT NULL
);


ALTER TABLE tmplands_okresy OWNER TO pedro;

--
-- Name: tmplands_okresy_thread_seq; Type: SEQUENCE; Schema: ruian; Owner: pedro
--

CREATE SEQUENCE tmplands_okresy_thread_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 2
    CACHE 1
    CYCLE;


ALTER TABLE tmplands_okresy_thread_seq OWNER TO pedro;

--
-- Name: tmplands_okresy_thread_seq; Type: SEQUENCE OWNED BY; Schema: ruian; Owner: pedro
--

ALTER SEQUENCE tmplands_okresy_thread_seq OWNED BY tmplands_okresy.thread;


--
-- Name: tmplands_okresy thread; Type: DEFAULT; Schema: ruian; Owner: pedro
--

ALTER TABLE ONLY tmplands_okresy ALTER COLUMN thread SET DEFAULT nextval('tmplands_okresy_thread_seq'::regclass);


--
-- Name: tmplands_okresy; Type: ACL; Schema: ruian; Owner: pedro
--

GRANT SELECT ON TABLE tmplands_okresy TO PUBLIC;


--
-- Name: tmplands_okresy_thread_seq; Type: ACL; Schema: ruian; Owner: pedro
--

GRANT SELECT ON SEQUENCE tmplands_okresy_thread_seq TO PUBLIC;


--
-- PostgreSQL database dump complete
--

