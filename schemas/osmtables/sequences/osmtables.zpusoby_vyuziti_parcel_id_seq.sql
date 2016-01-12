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
-- PostgreSQL database dump complete
--

