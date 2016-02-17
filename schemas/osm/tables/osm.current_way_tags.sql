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
-- Name: current_way_tags; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE current_way_tags (
    way_id bigint NOT NULL,
    k character varying(255) DEFAULT ''::character varying NOT NULL,
    v character varying(255) DEFAULT ''::character varying NOT NULL
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE current_way_tags OWNER TO osm;

--
-- Name: current_way_tags_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY current_way_tags
    ADD CONSTRAINT current_way_tags_pkey PRIMARY KEY (way_id, k);


--
-- Name: delete_way_tags; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_way_tags BEFORE DELETE ON current_way_tags FOR EACH ROW EXECUTE PROCEDURE delete_way_tags();

ALTER TABLE current_way_tags DISABLE TRIGGER delete_way_tags;


--
-- Name: current_way_tags_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY current_way_tags
    ADD CONSTRAINT current_way_tags_id_fkey FOREIGN KEY (way_id) REFERENCES current_ways(id);


--
-- Name: current_way_tags; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE current_way_tags FROM PUBLIC;
REVOKE ALL ON TABLE current_way_tags FROM osm;
GRANT ALL ON TABLE current_way_tags TO osm;
GRANT SELECT ON TABLE current_way_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

