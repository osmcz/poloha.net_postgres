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

SET default_with_oids = false;

--
-- Name: dkm; Type: TABLE; Schema: ruian; Owner: ruian
--

CREATE TABLE dkm (
    kod integer NOT NULL,
    ma_dkm boolean,
    new boolean DEFAULT true,
    datum date,
    id integer NOT NULL
);


ALTER TABLE dkm OWNER TO ruian;

--
-- Name: dkm_id_seq; Type: SEQUENCE; Schema: ruian; Owner: ruian
--

CREATE SEQUENCE dkm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dkm_id_seq OWNER TO ruian;

--
-- Name: dkm_id_seq; Type: SEQUENCE OWNED BY; Schema: ruian; Owner: ruian
--

ALTER SEQUENCE dkm_id_seq OWNED BY dkm.id;


--
-- Name: dkm id; Type: DEFAULT; Schema: ruian; Owner: ruian
--

ALTER TABLE ONLY dkm ALTER COLUMN id SET DEFAULT nextval('dkm_id_seq'::regclass);


--
-- Name: dkm dkm_kod_pkey; Type: CONSTRAINT; Schema: ruian; Owner: ruian
--

ALTER TABLE ONLY dkm
    ADD CONSTRAINT dkm_kod_pkey PRIMARY KEY (kod);


--
-- Name: dkm; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE dkm TO PUBLIC;


--
-- PostgreSQL database dump complete
--

