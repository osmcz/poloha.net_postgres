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

SET default_with_oids = true;

--
-- Name: users; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE users (
    email character varying(255) NOT NULL,
    id bigint NOT NULL,
    pass_crypt character varying(255) NOT NULL,
    creation_time timestamp without time zone NOT NULL,
    display_name character varying(255) DEFAULT ''::character varying NOT NULL,
    data_public boolean DEFAULT false NOT NULL,
    description text DEFAULT ''::text NOT NULL,
    home_lat double precision,
    home_lon double precision,
    home_zoom smallint DEFAULT 3,
    nearby integer DEFAULT 50,
    pass_salt character varying(255),
    image_file_name text,
    email_valid boolean DEFAULT false NOT NULL,
    new_email character varying(255),
    creation_ip character varying(255),
    languages character varying(255),
    status user_status_enum DEFAULT 'pending'::user_status_enum NOT NULL,
    terms_agreed timestamp without time zone,
    consider_pd boolean DEFAULT false NOT NULL,
    auth_uid character varying(255),
    preferred_editor character varying(255),
    terms_seen boolean DEFAULT false NOT NULL,
    description_format format_enum DEFAULT 'markdown'::format_enum NOT NULL,
    image_fingerprint character varying(255),
    changesets_count integer DEFAULT 0 NOT NULL,
    traces_count integer DEFAULT 0 NOT NULL,
    diary_entries_count integer DEFAULT 0 NOT NULL,
    image_use_gravatar boolean DEFAULT true NOT NULL,
    image_content_type character varying(255),
    auth_provider character varying
);


ALTER TABLE users OWNER TO osm;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO osm;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users_auth_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE UNIQUE INDEX users_auth_idx ON users USING btree (auth_provider, auth_uid);


--
-- Name: users_display_name_lower_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX users_display_name_lower_idx ON users USING btree (lower((display_name)::text));


--
-- Name: users_email_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE UNIQUE INDEX users_email_idx ON users USING btree (email);


--
-- Name: users_email_lower_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX users_email_lower_idx ON users USING btree (lower((email)::text));


--
-- Name: users_suspend; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER users_suspend BEFORE INSERT OR UPDATE ON users FOR EACH ROW EXECUTE PROCEDURE users_suspend();


--
-- Name: users; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM osm;
GRANT ALL ON TABLE users TO osm;
GRANT SELECT ON TABLE users TO PUBLIC;


--
-- PostgreSQL database dump complete
--

