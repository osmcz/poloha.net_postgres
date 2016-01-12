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
-- Name: redactions; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE redactions (
    id integer NOT NULL,
    title character varying(255),
    description text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id bigint NOT NULL,
    description_format format_enum DEFAULT 'markdown'::format_enum NOT NULL
);


ALTER TABLE redactions OWNER TO osm;

--
-- Name: redactions_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE redactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE redactions_id_seq OWNER TO osm;

--
-- Name: redactions_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE redactions_id_seq OWNED BY redactions.id;


--
-- Name: id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY redactions ALTER COLUMN id SET DEFAULT nextval('redactions_id_seq'::regclass);


--
-- Name: redactions_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY redactions
    ADD CONSTRAINT redactions_pkey PRIMARY KEY (id);


--
-- Name: redactions_user_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY redactions
    ADD CONSTRAINT redactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: redactions; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE redactions FROM PUBLIC;
REVOKE ALL ON TABLE redactions FROM osm;
GRANT ALL ON TABLE redactions TO osm;
GRANT SELECT ON TABLE redactions TO PUBLIC;


--
-- PostgreSQL database dump complete
--

