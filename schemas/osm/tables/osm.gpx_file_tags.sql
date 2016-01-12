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
-- Name: gpx_file_tags; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE gpx_file_tags (
    gpx_id bigint DEFAULT (0)::bigint NOT NULL,
    tag character varying(255) NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE gpx_file_tags OWNER TO osm;

--
-- Name: gpx_file_tags_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE gpx_file_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE gpx_file_tags_id_seq OWNER TO osm;

--
-- Name: gpx_file_tags_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE gpx_file_tags_id_seq OWNED BY gpx_file_tags.id;


--
-- Name: id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY gpx_file_tags ALTER COLUMN id SET DEFAULT nextval('gpx_file_tags_id_seq'::regclass);


--
-- Name: gpx_file_tags_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY gpx_file_tags
    ADD CONSTRAINT gpx_file_tags_pkey PRIMARY KEY (id);


--
-- Name: gpx_file_tags_gpxid_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX gpx_file_tags_gpxid_idx ON gpx_file_tags USING btree (gpx_id);


--
-- Name: gpx_file_tags_tag_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX gpx_file_tags_tag_idx ON gpx_file_tags USING btree (tag);


--
-- Name: gpx_file_tags_gpx_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY gpx_file_tags
    ADD CONSTRAINT gpx_file_tags_gpx_id_fkey FOREIGN KEY (gpx_id) REFERENCES gpx_files(id);


--
-- Name: gpx_file_tags; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE gpx_file_tags FROM PUBLIC;
REVOKE ALL ON TABLE gpx_file_tags FROM osm;
GRANT ALL ON TABLE gpx_file_tags TO osm;
GRANT SELECT ON TABLE gpx_file_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

