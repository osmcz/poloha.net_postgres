--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osmtables, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: zpusoby_vyuziti_parcel; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE zpusoby_vyuziti_parcel (
    kod integer NOT NULL,
    druh_pozemku_kod smallint,
    zpusob_vyu_poz_kod smallint,
    nazev text,
    tagy public.hstore,
    color text,
    opacity real,
    usable boolean
);


ALTER TABLE zpusoby_vyuziti_parcel OWNER TO pedro;

--
-- Name: zpusoby_vyuziti_parcel_id_seq; Type: SEQUENCE; Schema: osmtables; Owner: pedro
--

CREATE SEQUENCE zpusoby_vyuziti_parcel_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE zpusoby_vyuziti_parcel_id_seq OWNER TO pedro;

--
-- Name: zpusoby_vyuziti_parcel_id_seq; Type: SEQUENCE OWNED BY; Schema: osmtables; Owner: pedro
--

ALTER SEQUENCE zpusoby_vyuziti_parcel_id_seq OWNED BY zpusoby_vyuziti_parcel.kod;


--
-- Name: kod; Type: DEFAULT; Schema: osmtables; Owner: pedro
--

ALTER TABLE ONLY zpusoby_vyuziti_parcel ALTER COLUMN kod SET DEFAULT nextval('zpusoby_vyuziti_parcel_id_seq'::regclass);


--
-- Name: zpusoby_vyuziti_parcel; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE zpusoby_vyuziti_parcel FROM PUBLIC;
REVOKE ALL ON TABLE zpusoby_vyuziti_parcel FROM pedro;
GRANT ALL ON TABLE zpusoby_vyuziti_parcel TO pedro;
GRANT SELECT ON TABLE zpusoby_vyuziti_parcel TO PUBLIC;


--
-- Name: zpusoby_vyuziti_parcel.tagy; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL(tagy) ON TABLE zpusoby_vyuziti_parcel FROM PUBLIC;
REVOKE ALL(tagy) ON TABLE zpusoby_vyuziti_parcel FROM pedro;
GRANT UPDATE(tagy) ON TABLE zpusoby_vyuziti_parcel TO marian;


--
-- PostgreSQL database dump complete
--

