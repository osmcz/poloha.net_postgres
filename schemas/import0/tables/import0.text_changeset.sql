--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import0, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: text_changeset; Type: TABLE; Schema: import0; Owner: import0; Tablespace: 
--

CREATE TABLE text_changeset (
    xml text,
    id bigint NOT NULL
);


ALTER TABLE text_changeset OWNER TO import0;

--
-- Name: text_changeset_id_seq; Type: SEQUENCE; Schema: import0; Owner: import0
--

CREATE SEQUENCE text_changeset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE text_changeset_id_seq OWNER TO import0;

--
-- Name: text_changeset_id_seq; Type: SEQUENCE OWNED BY; Schema: import0; Owner: import0
--

ALTER SEQUENCE text_changeset_id_seq OWNED BY text_changeset.id;


--
-- Name: id; Type: DEFAULT; Schema: import0; Owner: import0
--

ALTER TABLE ONLY text_changeset ALTER COLUMN id SET DEFAULT nextval('text_changeset_id_seq'::regclass);


--
-- Name: text_changeset; Type: ACL; Schema: import0; Owner: import0
--

REVOKE ALL ON TABLE text_changeset FROM PUBLIC;
REVOKE ALL ON TABLE text_changeset FROM import0;
GRANT ALL ON TABLE text_changeset TO import0;
GRANT SELECT ON TABLE text_changeset TO PUBLIC;


--
-- PostgreSQL database dump complete
--

