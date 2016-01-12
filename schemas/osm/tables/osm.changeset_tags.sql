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
-- Name: changeset_tags; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE changeset_tags (
    changeset_id bigint NOT NULL,
    k character varying(255) DEFAULT ''::character varying NOT NULL,
    v character varying(255) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE changeset_tags OWNER TO osm;

--
-- Name: changeset_tags_id_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX changeset_tags_id_idx ON changeset_tags USING btree (changeset_id);


--
-- Name: changeset_tags_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY changeset_tags
    ADD CONSTRAINT changeset_tags_id_fkey FOREIGN KEY (changeset_id) REFERENCES changesets(id) DEFERRABLE;


--
-- Name: changeset_tags; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE changeset_tags FROM PUBLIC;
REVOKE ALL ON TABLE changeset_tags FROM osm;
GRANT ALL ON TABLE changeset_tags TO osm;
GRANT SELECT ON TABLE changeset_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

