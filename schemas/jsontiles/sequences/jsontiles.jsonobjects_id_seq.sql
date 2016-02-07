--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = jsontiles, pg_catalog;

--
-- Name: jsonobjects_id_seq; Type: SEQUENCE; Schema: jsontiles; Owner: pedro
--

CREATE SEQUENCE jsonobjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jsonobjects_id_seq OWNER TO pedro;

--
-- Name: jsonobjects_id_seq; Type: SEQUENCE OWNED BY; Schema: jsontiles; Owner: pedro
--

ALTER SEQUENCE jsonobjects_id_seq OWNED BY jsonobjects.id;


--
-- Name: jsonobjects_id_seq; Type: ACL; Schema: jsontiles; Owner: pedro
--

REVOKE ALL ON SEQUENCE jsonobjects_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE jsonobjects_id_seq FROM pedro;
GRANT ALL ON SEQUENCE jsonobjects_id_seq TO pedro;
GRANT ALL ON SEQUENCE jsonobjects_id_seq TO marian;


--
-- PostgreSQL database dump complete
--

