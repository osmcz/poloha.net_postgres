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
-- Name: current_relation_members; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE current_relation_members (
    relation_id bigint NOT NULL,
    member_type nwr_enum NOT NULL,
    member_id bigint NOT NULL,
    member_role character varying(255) NOT NULL,
    sequence_id integer DEFAULT 0 NOT NULL
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE current_relation_members OWNER TO osm;

--
-- Name: current_relation_members_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY current_relation_members
    ADD CONSTRAINT current_relation_members_pkey PRIMARY KEY (relation_id, member_type, member_id, member_role, sequence_id);


--
-- Name: current_relation_members_member_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX current_relation_members_member_idx ON current_relation_members USING btree (member_type, member_id);


--
-- Name: delete_relation_members; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER delete_relation_members BEFORE DELETE ON current_relation_members FOR EACH ROW EXECUTE PROCEDURE delete_relation_members();

ALTER TABLE current_relation_members DISABLE TRIGGER delete_relation_members;


--
-- Name: current_relation_members_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY current_relation_members
    ADD CONSTRAINT current_relation_members_id_fkey FOREIGN KEY (relation_id) REFERENCES current_relations(id);


--
-- Name: current_relation_members; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE current_relation_members FROM PUBLIC;
REVOKE ALL ON TABLE current_relation_members FROM osm;
GRANT ALL ON TABLE current_relation_members TO osm;
GRANT SELECT ON TABLE current_relation_members TO PUBLIC;


--
-- PostgreSQL database dump complete
--

