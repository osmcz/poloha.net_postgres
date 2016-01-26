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
-- Name: changeset_comments; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE changeset_comments (
    id integer NOT NULL,
    changeset_id bigint NOT NULL,
    author_id bigint NOT NULL,
    body text NOT NULL,
    created_at timestamp without time zone NOT NULL,
    visible boolean NOT NULL
);


ALTER TABLE changeset_comments OWNER TO osm;

--
-- Name: changeset_comments_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE changeset_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE changeset_comments_id_seq OWNER TO osm;

--
-- Name: changeset_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE changeset_comments_id_seq OWNED BY changeset_comments.id;


--
-- Name: id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY changeset_comments ALTER COLUMN id SET DEFAULT nextval('changeset_comments_id_seq'::regclass);


--
-- Name: changeset_comments_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY changeset_comments
    ADD CONSTRAINT changeset_comments_pkey PRIMARY KEY (id);


--
-- Name: index_changeset_comments_on_created_at; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX index_changeset_comments_on_created_at ON changeset_comments USING btree (created_at);


--
-- Name: changeset_comments_author_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY changeset_comments
    ADD CONSTRAINT changeset_comments_author_id_fkey FOREIGN KEY (author_id) REFERENCES users(id);


--
-- Name: changeset_comments_changeset_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY changeset_comments
    ADD CONSTRAINT changeset_comments_changeset_id_fkey FOREIGN KEY (changeset_id) REFERENCES changesets(id);


--
-- Name: changeset_comments; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE changeset_comments FROM PUBLIC;
REVOKE ALL ON TABLE changeset_comments FROM osm;
GRANT ALL ON TABLE changeset_comments TO osm;
GRANT SELECT ON TABLE changeset_comments TO PUBLIC;


--
-- PostgreSQL database dump complete
--

