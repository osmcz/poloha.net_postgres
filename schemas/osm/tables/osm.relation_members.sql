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
-- Name: relation_members; Type: TABLE; Schema: osm; Owner: osm
--

CREATE TABLE relation_members (
    relation_id bigint DEFAULT (0)::bigint NOT NULL,
    member_type nwr_enum NOT NULL,
    member_id bigint NOT NULL,
    member_role character varying(255) NOT NULL,
    version bigint DEFAULT (0)::bigint NOT NULL,
    sequence_id integer DEFAULT 0 NOT NULL
);


ALTER TABLE relation_members OWNER TO osm;

--
-- Name: relation_members relation_members_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY relation_members
    ADD CONSTRAINT relation_members_pkey PRIMARY KEY (relation_id, version, member_type, member_id, member_role, sequence_id);


--
-- Name: relation_members_member_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX relation_members_member_idx ON relation_members USING btree (member_type, member_id);


--
-- Name: relation_members; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE relation_members TO PUBLIC;


--
-- PostgreSQL database dump complete
--

