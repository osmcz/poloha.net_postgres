--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: test; Type: TABLE; Schema: public; Owner: pedro; Tablespace: 
--

CREATE TABLE test (
    id integer NOT NULL,
    txt text
);


ALTER TABLE test OWNER TO pedro;

--
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: pedro
--

CREATE SEQUENCE test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE test_id_seq OWNER TO pedro;

--
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pedro
--

ALTER SEQUENCE test_id_seq OWNED BY test.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: pedro
--

ALTER TABLE ONLY test ALTER COLUMN id SET DEFAULT nextval('test_id_seq'::regclass);


--
-- Name: test; Type: ACL; Schema: public; Owner: pedro
--

REVOKE ALL ON TABLE test FROM PUBLIC;
REVOKE ALL ON TABLE test FROM pedro;
GRANT ALL ON TABLE test TO pedro;
GRANT SELECT ON TABLE test TO PUBLIC;


--
-- PostgreSQL database dump complete
--

