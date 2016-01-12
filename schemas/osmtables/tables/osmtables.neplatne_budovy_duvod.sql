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
-- Name: neplatne_budovy_duvod; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE neplatne_budovy_duvod (
    id smallint NOT NULL,
    popis text,
    chyba boolean
);


ALTER TABLE neplatne_budovy_duvod OWNER TO pedro;

--
-- Name: neplatne_budovy_duvod_pkey; Type: CONSTRAINT; Schema: osmtables; Owner: pedro; Tablespace: 
--

ALTER TABLE ONLY neplatne_budovy_duvod
    ADD CONSTRAINT neplatne_budovy_duvod_pkey PRIMARY KEY (id);


--
-- Name: neplatne_budovy_duvod; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE neplatne_budovy_duvod FROM PUBLIC;
REVOKE ALL ON TABLE neplatne_budovy_duvod FROM pedro;
GRANT ALL ON TABLE neplatne_budovy_duvod TO pedro;
GRANT SELECT ON TABLE neplatne_budovy_duvod TO PUBLIC;
GRANT ALL ON TABLE neplatne_budovy_duvod TO marian;


--
-- PostgreSQL database dump complete
--

