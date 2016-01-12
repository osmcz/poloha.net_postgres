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
-- Name: oauth_nonces; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE oauth_nonces (
    id integer NOT NULL,
    nonce character varying(255),
    "timestamp" integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE oauth_nonces OWNER TO osm;

--
-- Name: oauth_nonces_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE oauth_nonces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth_nonces_id_seq OWNER TO osm;

--
-- Name: oauth_nonces_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE oauth_nonces_id_seq OWNED BY oauth_nonces.id;


--
-- Name: id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY oauth_nonces ALTER COLUMN id SET DEFAULT nextval('oauth_nonces_id_seq'::regclass);


--
-- Name: oauth_nonces_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY oauth_nonces
    ADD CONSTRAINT oauth_nonces_pkey PRIMARY KEY (id);


--
-- Name: index_oauth_nonces_on_nonce_and_timestamp; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE UNIQUE INDEX index_oauth_nonces_on_nonce_and_timestamp ON oauth_nonces USING btree (nonce, "timestamp");


--
-- Name: oauth_nonces; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE oauth_nonces FROM PUBLIC;
REVOKE ALL ON TABLE oauth_nonces FROM osm;
GRANT ALL ON TABLE oauth_nonces TO osm;
GRANT SELECT ON TABLE oauth_nonces TO PUBLIC;


--
-- PostgreSQL database dump complete
--

