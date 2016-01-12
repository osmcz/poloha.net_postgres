--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osmtables, pg_catalog;

--
-- Name: neplatne_budovy_log_id_seq; Type: SEQUENCE; Schema: osmtables; Owner: pedro
--

CREATE SEQUENCE neplatne_budovy_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE neplatne_budovy_log_id_seq OWNER TO pedro;

--
-- Name: neplatne_budovy_log_id_seq; Type: SEQUENCE OWNED BY; Schema: osmtables; Owner: pedro
--

ALTER SEQUENCE neplatne_budovy_log_id_seq OWNED BY neplatne_budovy_log.id;


--
-- Name: neplatne_budovy_log_id_seq; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON SEQUENCE neplatne_budovy_log_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE neplatne_budovy_log_id_seq FROM pedro;
GRANT ALL ON SEQUENCE neplatne_budovy_log_id_seq TO pedro;
GRANT ALL ON SEQUENCE neplatne_budovy_log_id_seq TO hlasenibudov;


--
-- PostgreSQL database dump complete
--

