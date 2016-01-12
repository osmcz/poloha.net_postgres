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
-- Name: note_comments; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE note_comments (
    id integer NOT NULL,
    note_id bigint NOT NULL,
    visible boolean NOT NULL,
    created_at timestamp without time zone NOT NULL,
    author_ip inet,
    author_id bigint,
    body text,
    event note_event_enum
);


ALTER TABLE note_comments OWNER TO osm;

--
-- Name: note_comments_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE note_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE note_comments_id_seq OWNER TO osm;

--
-- Name: note_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE note_comments_id_seq OWNED BY note_comments.id;


--
-- Name: id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY note_comments ALTER COLUMN id SET DEFAULT nextval('note_comments_id_seq'::regclass);


--
-- Name: note_comments_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY note_comments
    ADD CONSTRAINT note_comments_pkey PRIMARY KEY (id);


--
-- Name: index_note_comments_on_body; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX index_note_comments_on_body ON note_comments USING gin (to_tsvector('english'::regconfig, body));


--
-- Name: index_note_comments_on_created_at; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX index_note_comments_on_created_at ON note_comments USING btree (created_at);


--
-- Name: note_comments_note_id_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX note_comments_note_id_idx ON note_comments USING btree (note_id);


--
-- Name: note_comments_author_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY note_comments
    ADD CONSTRAINT note_comments_author_id_fkey FOREIGN KEY (author_id) REFERENCES users(id);


--
-- Name: note_comments_note_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY note_comments
    ADD CONSTRAINT note_comments_note_id_fkey FOREIGN KEY (note_id) REFERENCES notes(id);


--
-- Name: note_comments; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE note_comments FROM PUBLIC;
REVOKE ALL ON TABLE note_comments FROM osm;
GRANT ALL ON TABLE note_comments TO osm;
GRANT SELECT ON TABLE note_comments TO PUBLIC;


--
-- PostgreSQL database dump complete
--

