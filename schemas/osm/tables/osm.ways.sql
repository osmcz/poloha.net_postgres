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
-- Name: ways; Type: TABLE; Schema: osm; Owner: osm
--

CREATE TABLE ways (
    way_id bigint DEFAULT (0)::bigint NOT NULL,
    changeset_id bigint NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    version bigint NOT NULL,
    visible boolean DEFAULT true NOT NULL,
    redaction_id integer
);


ALTER TABLE ways OWNER TO osm;

--
-- Name: ways ways_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY ways
    ADD CONSTRAINT ways_pkey PRIMARY KEY (way_id, version);


--
-- Name: ways_changeset_id_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX ways_changeset_id_idx ON ways USING btree (changeset_id);


--
-- Name: ways_timestamp_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX ways_timestamp_idx ON ways USING btree ("timestamp");


--
-- Name: ways ways_changeset_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY ways
    ADD CONSTRAINT ways_changeset_id_fkey FOREIGN KEY (changeset_id) REFERENCES changesets(id);


--
-- Name: ways ways_redaction_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY ways
    ADD CONSTRAINT ways_redaction_id_fkey FOREIGN KEY (redaction_id) REFERENCES redactions(id);


--
-- Name: ways; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE ways TO PUBLIC;


--
-- PostgreSQL database dump complete
--

