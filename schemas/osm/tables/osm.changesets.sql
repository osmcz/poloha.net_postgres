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
-- Name: changesets; Type: TABLE; Schema: osm; Owner: osm
--

CREATE TABLE changesets (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    created_at timestamp without time zone NOT NULL,
    min_lat integer,
    max_lat integer,
    min_lon integer,
    max_lon integer,
    closed_at timestamp without time zone NOT NULL,
    num_changes integer DEFAULT 0 NOT NULL
);


ALTER TABLE changesets OWNER TO osm;

--
-- Name: changesets_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE changesets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE changesets_id_seq OWNER TO osm;

--
-- Name: changesets_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE changesets_id_seq OWNED BY changesets.id;


--
-- Name: changesets id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY changesets ALTER COLUMN id SET DEFAULT nextval('changesets_id_seq'::regclass);


--
-- Name: changesets changesets_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY changesets
    ADD CONSTRAINT changesets_pkey PRIMARY KEY (id);


--
-- Name: changesets_closed_at_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX changesets_closed_at_idx ON changesets USING btree (closed_at);


--
-- Name: changesets_created_at_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX changesets_created_at_idx ON changesets USING btree (created_at);


--
-- Name: changesets_user_id_created_at_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX changesets_user_id_created_at_idx ON changesets USING btree (user_id, created_at);


--
-- Name: changesets_user_id_id_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX changesets_user_id_id_idx ON changesets USING btree (user_id, id);


--
-- Name: changesets; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE changesets TO PUBLIC;


--
-- PostgreSQL database dump complete
--

