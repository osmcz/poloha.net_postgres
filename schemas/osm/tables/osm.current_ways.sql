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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: current_ways; Type: TABLE; Schema: osm; Owner: osm
--

CREATE TABLE current_ways (
    id bigint NOT NULL,
    changeset_id bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    visible boolean NOT NULL,
    version bigint NOT NULL
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE current_ways OWNER TO osm;

--
-- Name: current_ways_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE current_ways_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE current_ways_id_seq OWNER TO osm;

--
-- Name: current_ways_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE current_ways_id_seq OWNED BY current_ways.id;


--
-- Name: current_ways id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY current_ways ALTER COLUMN id SET DEFAULT nextval('current_ways_id_seq'::regclass);


--
-- Name: current_ways current_ways_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY current_ways
    ADD CONSTRAINT current_ways_pkey PRIMARY KEY (id);


--
-- Name: current_ways delete_way; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_way BEFORE DELETE ON current_ways FOR EACH ROW EXECUTE PROCEDURE delete_ways();

ALTER TABLE current_ways DISABLE TRIGGER delete_way;


--
-- Name: current_ways; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE current_ways TO PUBLIC;


--
-- PostgreSQL database dump complete
--

