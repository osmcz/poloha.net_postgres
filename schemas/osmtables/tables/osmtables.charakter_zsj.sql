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

SET default_with_oids = false;

--
-- Name: charakter_zsj; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE charakter_zsj (
    kod integer,
    nazev text,
    popis text,
    zkraceny_nazev text,
    zacatek_platnosti timestamp without time zone,
    konec_platnosti timestamp without time zone
);


ALTER TABLE charakter_zsj OWNER TO pedro;

--
-- Name: charakter_zsj; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE charakter_zsj FROM PUBLIC;
REVOKE ALL ON TABLE charakter_zsj FROM pedro;
GRANT ALL ON TABLE charakter_zsj TO pedro;
GRANT SELECT ON TABLE charakter_zsj TO PUBLIC;


--
-- PostgreSQL database dump complete
--

