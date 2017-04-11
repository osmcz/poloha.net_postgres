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
-- Name: current_nodes; Type: TABLE; Schema: osm; Owner: osm
--

CREATE TABLE current_nodes (
    id bigint NOT NULL,
    latitude integer NOT NULL,
    longitude integer NOT NULL,
    changeset_id bigint NOT NULL,
    visible boolean NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    tile bigint NOT NULL,
    version bigint NOT NULL
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE current_nodes OWNER TO osm;

--
-- Name: current_nodes_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE current_nodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE current_nodes_id_seq OWNER TO osm;

--
-- Name: current_nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE current_nodes_id_seq OWNED BY current_nodes.id;


--
-- Name: current_nodes id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY current_nodes ALTER COLUMN id SET DEFAULT nextval('current_nodes_id_seq'::regclass);


--
-- Name: current_nodes current_nodes_pkey1; Type: CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY current_nodes
    ADD CONSTRAINT current_nodes_pkey1 PRIMARY KEY (id);


--
-- Name: current_nodes_tile_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX current_nodes_tile_idx ON current_nodes USING btree (tile);


--
-- Name: current_nodes delete_node; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_node BEFORE DELETE ON current_nodes FOR EACH ROW EXECUTE PROCEDURE delete_nodes();

ALTER TABLE current_nodes DISABLE TRIGGER delete_node;


--
-- Name: current_nodes; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE current_nodes TO PUBLIC;


--
-- PostgreSQL database dump complete
--

