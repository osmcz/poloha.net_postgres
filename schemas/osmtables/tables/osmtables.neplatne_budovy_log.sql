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

SET search_path = osmtables, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: neplatne_budovy_log; Type: TABLE; Schema: osmtables; Owner: pedro
--

CREATE TABLE neplatne_budovy_log (
    kod bigint,
    old_duvod smallint,
    new_duvod smallint,
    old_datum date,
    new_datum date,
    old_user_id bigint,
    new_user_id bigint,
    old_user_nick text,
    new_user_nick text,
    old_poznamka text,
    new_poznamka text,
    old_hlasit_cuzk text,
    new_hlasit_cuzk text,
    action action,
    id integer NOT NULL
);


ALTER TABLE neplatne_budovy_log OWNER TO pedro;

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
-- Name: neplatne_budovy_log id; Type: DEFAULT; Schema: osmtables; Owner: pedro
--

ALTER TABLE ONLY neplatne_budovy_log ALTER COLUMN id SET DEFAULT nextval('neplatne_budovy_log_id_seq'::regclass);


--
-- Name: neplatne_budovy_log; Type: ACL; Schema: osmtables; Owner: pedro
--

GRANT SELECT ON TABLE neplatne_budovy_log TO PUBLIC;
GRANT SELECT,INSERT ON TABLE neplatne_budovy_log TO hlasenibudov;


--
-- Name: neplatne_budovy_log_id_seq; Type: ACL; Schema: osmtables; Owner: pedro
--

GRANT ALL ON SEQUENCE neplatne_budovy_log_id_seq TO hlasenibudov;


--
-- PostgreSQL database dump complete
--

