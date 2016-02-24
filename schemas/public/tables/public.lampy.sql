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

SET default_with_oids = false;

--
-- Name: lampy; Type: TABLE; Schema: public; Owner: pedro; Tablespace: 
--

CREATE TABLE lampy (
    gid integer NOT NULL,
    ctmtp_kod integer,
    uhel numeric,
    velikost numeric,
    spravce smallint,
    tmpb_id integer,
    externi_id character varying(114),
    cz_id_vzni integer,
    cz_id_zmen integer,
    cz_id_zani integer,
    dat_vznik date,
    dat_zmena date,
    dat_zanik date,
    puvod character varying(9),
    puvcis integer,
    rok smallint,
    ctmtp_popi character varying(254),
    __gid character varying(114),
    tid_tmiszn integer,
    id_poskyt integer,
    poskyt character varying(50),
    geom geometry(Point)
);


ALTER TABLE lampy OWNER TO pedro;

--
-- Name: lampy_gid_seq; Type: SEQUENCE; Schema: public; Owner: pedro
--

CREATE SEQUENCE lampy_gid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE lampy_gid_seq OWNER TO pedro;

--
-- Name: lampy_gid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pedro
--

ALTER SEQUENCE lampy_gid_seq OWNED BY lampy.gid;


--
-- Name: gid; Type: DEFAULT; Schema: public; Owner: pedro
--

ALTER TABLE ONLY lampy ALTER COLUMN gid SET DEFAULT nextval('lampy_gid_seq'::regclass);


--
-- Name: lampy_pkey; Type: CONSTRAINT; Schema: public; Owner: pedro; Tablespace: 
--

ALTER TABLE ONLY lampy
    ADD CONSTRAINT lampy_pkey PRIMARY KEY (gid);


--
-- Name: lampy; Type: ACL; Schema: public; Owner: pedro
--

REVOKE ALL ON TABLE lampy FROM PUBLIC;
REVOKE ALL ON TABLE lampy FROM pedro;
GRANT ALL ON TABLE lampy TO pedro;
GRANT SELECT ON TABLE lampy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

