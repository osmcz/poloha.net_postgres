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
-- Name: changesets_subscribers; Type: TABLE; Schema: osm; Owner: osm
--

CREATE TABLE changesets_subscribers (
    subscriber_id bigint NOT NULL,
    changeset_id bigint NOT NULL
);


ALTER TABLE changesets_subscribers OWNER TO osm;

--
-- Name: index_changesets_subscribers_on_changeset_id; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX index_changesets_subscribers_on_changeset_id ON changesets_subscribers USING btree (changeset_id);


--
-- Name: index_changesets_subscribers_on_subscriber_id_and_changeset_id; Type: INDEX; Schema: osm; Owner: osm
--

CREATE UNIQUE INDEX index_changesets_subscribers_on_subscriber_id_and_changeset_id ON changesets_subscribers USING btree (subscriber_id, changeset_id);


--
-- Name: changesets_subscribers changesets_subscribers_changeset_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY changesets_subscribers
    ADD CONSTRAINT changesets_subscribers_changeset_id_fkey FOREIGN KEY (changeset_id) REFERENCES changesets(id);


--
-- Name: changesets_subscribers changesets_subscribers_subscriber_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY changesets_subscribers
    ADD CONSTRAINT changesets_subscribers_subscriber_id_fkey FOREIGN KEY (subscriber_id) REFERENCES users(id);


--
-- Name: changesets_subscribers; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE changesets_subscribers TO PUBLIC;


--
-- PostgreSQL database dump complete
--

