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
-- Name: current_way_nodes; Type: TABLE; Schema: osm; Owner: osm
--

CREATE TABLE current_way_nodes (
    way_id bigint NOT NULL,
    node_id bigint NOT NULL,
    sequence_id bigint NOT NULL
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE current_way_nodes OWNER TO osm;

--
-- Name: current_way_nodes current_way_nodes_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY current_way_nodes
    ADD CONSTRAINT current_way_nodes_pkey PRIMARY KEY (way_id, sequence_id);


--
-- Name: current_way_nodes_node_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX current_way_nodes_node_idx ON current_way_nodes USING btree (node_id);


--
-- Name: current_way_nodes delete_way_nodes; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_way_nodes BEFORE DELETE ON current_way_nodes FOR EACH ROW EXECUTE PROCEDURE delete_way_nodes();

ALTER TABLE current_way_nodes DISABLE TRIGGER delete_way_nodes;


--
-- Name: current_way_nodes current_way_nodes_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY current_way_nodes
    ADD CONSTRAINT current_way_nodes_id_fkey FOREIGN KEY (way_id) REFERENCES current_ways(id);


--
-- Name: current_way_nodes current_way_nodes_node_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY current_way_nodes
    ADD CONSTRAINT current_way_nodes_node_id_fkey FOREIGN KEY (node_id) REFERENCES current_nodes(id);


--
-- Name: current_way_nodes; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE current_way_nodes TO PUBLIC;


--
-- PostgreSQL database dump complete
--

