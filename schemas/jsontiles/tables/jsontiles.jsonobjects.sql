--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = jsontiles, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: jsonobjects; Type: TABLE; Schema: jsontiles; Owner: pedro; Tablespace: 
--

CREATE TABLE jsonobjects (
    zoom_min smallint,
    zoom_max smallint,
    k text,
    v text,
    flag incexc,
    id integer NOT NULL,
    CONSTRAINT minmax CHECK ((((zoom_min <= zoom_max) AND (zoom_min > 7)) AND (zoom_max < 30)))
);


ALTER TABLE jsonobjects OWNER TO pedro;

--
-- Name: jsonobjects_id_seq; Type: SEQUENCE; Schema: jsontiles; Owner: pedro
--

CREATE SEQUENCE jsonobjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE jsonobjects_id_seq OWNER TO pedro;

--
-- Name: jsonobjects_id_seq; Type: SEQUENCE OWNED BY; Schema: jsontiles; Owner: pedro
--

ALTER SEQUENCE jsonobjects_id_seq OWNED BY jsonobjects.id;


--
-- Name: id; Type: DEFAULT; Schema: jsontiles; Owner: pedro
--

ALTER TABLE ONLY jsonobjects ALTER COLUMN id SET DEFAULT nextval('jsonobjects_id_seq'::regclass);


--
-- Name: jsonobjects_k_v_unique; Type: CONSTRAINT; Schema: jsontiles; Owner: pedro; Tablespace: 
--

ALTER TABLE ONLY jsonobjects
    ADD CONSTRAINT jsonobjects_k_v_unique UNIQUE (k, v);


--
-- Name: jsonobjects; Type: ACL; Schema: jsontiles; Owner: pedro
--

REVOKE ALL ON TABLE jsonobjects FROM PUBLIC;
REVOKE ALL ON TABLE jsonobjects FROM pedro;
GRANT ALL ON TABLE jsonobjects TO pedro;
GRANT SELECT ON TABLE jsonobjects TO PUBLIC;
GRANT ALL ON TABLE jsonobjects TO marian;


--
-- Name: jsonobjects_id_seq; Type: ACL; Schema: jsontiles; Owner: pedro
--

REVOKE ALL ON SEQUENCE jsonobjects_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE jsonobjects_id_seq FROM pedro;
GRANT ALL ON SEQUENCE jsonobjects_id_seq TO pedro;
GRANT ALL ON SEQUENCE jsonobjects_id_seq TO marian;


--
-- PostgreSQL database dump complete
--

