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
-- Name: notes; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE notes (
    id integer NOT NULL,
    latitude integer NOT NULL,
    longitude integer NOT NULL,
    tile bigint NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    created_at timestamp without time zone NOT NULL,
    status note_status_enum NOT NULL,
    closed_at timestamp without time zone
);


ALTER TABLE notes OWNER TO osm;

--
-- Name: notes_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE notes_id_seq OWNER TO osm;

--
-- Name: notes_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE notes_id_seq OWNED BY notes.id;


--
-- Name: id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY notes ALTER COLUMN id SET DEFAULT nextval('notes_id_seq'::regclass);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (id);


--
-- Name: notes_created_at_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX notes_created_at_idx ON notes USING btree (created_at);


--
-- Name: notes_tile_status_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX notes_tile_status_idx ON notes USING btree (tile, status);


--
-- Name: notes_updated_at_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX notes_updated_at_idx ON notes USING btree (updated_at);


--
-- Name: notes; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE notes FROM PUBLIC;
REVOKE ALL ON TABLE notes FROM osm;
GRANT ALL ON TABLE notes TO osm;
GRANT SELECT ON TABLE notes TO PUBLIC;


--
-- PostgreSQL database dump complete
--

