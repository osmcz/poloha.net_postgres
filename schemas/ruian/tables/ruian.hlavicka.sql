--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ruian, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: hlavicka; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE hlavicka (
    typ_zaznamu character varying,
    typ_davky character varying,
    typ_souboru character varying,
    datum date,
    transakce_od_id integer,
    transakce_od_zapsano timestamp without time zone,
    transakce_do_id integer,
    transakce_do_zapsano timestamp without time zone,
    predchozi_soubor character varying,
    plny_soubor character varying,
    metadata character varying,
    import_timestamp timestamp without time zone DEFAULT timezone('utc'::text, now()),
    deleted boolean DEFAULT false
);


ALTER TABLE hlavicka OWNER TO ruian;

--
-- Name: hlavicka; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE hlavicka FROM PUBLIC;
REVOKE ALL ON TABLE hlavicka FROM ruian;
GRANT ALL ON TABLE hlavicka TO ruian;
GRANT SELECT ON TABLE hlavicka TO PUBLIC;


--
-- PostgreSQL database dump complete
--

