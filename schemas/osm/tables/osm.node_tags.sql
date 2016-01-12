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
-- Name: node_tags; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE node_tags (
    node_id bigint NOT NULL,
    version bigint NOT NULL,
    k character varying(255) DEFAULT ''::character varying NOT NULL,
    v character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE node_tags OWNER TO osm;

--
-- Name: node_tags_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY node_tags
    ADD CONSTRAINT node_tags_pkey PRIMARY KEY (node_id, version, k);


--
-- Name: node_tags_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY node_tags
    ADD CONSTRAINT node_tags_id_fkey FOREIGN KEY (node_id, version) REFERENCES nodes(node_id, version);


--
-- Name: node_tags; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE node_tags FROM PUBLIC;
REVOKE ALL ON TABLE node_tags FROM osm;
GRANT ALL ON TABLE node_tags TO osm;
GRANT SELECT ON TABLE node_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

