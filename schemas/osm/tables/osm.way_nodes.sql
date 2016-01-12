--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osm, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: way_nodes; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE way_nodes (
    way_id bigint NOT NULL,
    node_id bigint NOT NULL,
    version bigint NOT NULL,
    sequence_id bigint NOT NULL
);


ALTER TABLE way_nodes OWNER TO osm;

--
-- Name: way_nodes_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY way_nodes
    ADD CONSTRAINT way_nodes_pkey PRIMARY KEY (way_id, version, sequence_id);


--
-- Name: way_nodes_node_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX way_nodes_node_idx ON way_nodes USING btree (node_id);


--
-- Name: way_nodes_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY way_nodes
    ADD CONSTRAINT way_nodes_id_fkey FOREIGN KEY (way_id, version) REFERENCES ways(way_id, version);


--
-- Name: way_nodes; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE way_nodes FROM PUBLIC;
REVOKE ALL ON TABLE way_nodes FROM osm;
GRANT ALL ON TABLE way_nodes TO osm;
GRANT SELECT ON TABLE way_nodes TO PUBLIC;


--
-- PostgreSQL database dump complete
--

