--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ruian, pg_catalog;

--
-- Name: tmplands_okresy_thread_seq; Type: SEQUENCE; Schema: ruian; Owner: pedro
--

CREATE SEQUENCE tmplands_okresy_thread_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 4
    CACHE 1
    CYCLE;


ALTER TABLE tmplands_okresy_thread_seq OWNER TO pedro;

--
-- Name: tmplands_okresy_thread_seq; Type: SEQUENCE OWNED BY; Schema: ruian; Owner: pedro
--

ALTER SEQUENCE tmplands_okresy_thread_seq OWNED BY tmplands_okresy.thread;


--
-- Name: tmplands_okresy_thread_seq; Type: ACL; Schema: ruian; Owner: pedro
--

REVOKE ALL ON SEQUENCE tmplands_okresy_thread_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE tmplands_okresy_thread_seq FROM pedro;
GRANT ALL ON SEQUENCE tmplands_okresy_thread_seq TO pedro;
GRANT SELECT ON SEQUENCE tmplands_okresy_thread_seq TO PUBLIC;


--
-- PostgreSQL database dump complete
--

