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
-- Name: acls; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE acls (
    id integer NOT NULL,
    address inet,
    k character varying(255) NOT NULL,
    v character varying(255),
    domain character varying(255)
);


ALTER TABLE acls OWNER TO osm;

--
-- Name: acls_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE acls_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE acls_id_seq OWNER TO osm;

--
-- Name: acls_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE acls_id_seq OWNED BY acls.id;


--
-- Name: id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY acls ALTER COLUMN id SET DEFAULT nextval('acls_id_seq'::regclass);


--
-- Name: acls_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY acls
    ADD CONSTRAINT acls_pkey PRIMARY KEY (id);


--
-- Name: acls_k_idx; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE INDEX acls_k_idx ON acls USING btree (k);


--
-- Name: acls; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE acls FROM PUBLIC;
REVOKE ALL ON TABLE acls FROM osm;
GRANT ALL ON TABLE acls TO osm;
GRANT SELECT ON TABLE acls TO PUBLIC;


--
-- PostgreSQL database dump complete
--

