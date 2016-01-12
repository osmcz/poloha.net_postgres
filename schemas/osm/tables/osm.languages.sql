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
-- Name: languages; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE languages (
    code character varying(255) NOT NULL,
    english_name character varying(255) NOT NULL,
    native_name character varying(255)
);


ALTER TABLE languages OWNER TO osm;

--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (code);


--
-- Name: languages; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE languages FROM PUBLIC;
REVOKE ALL ON TABLE languages FROM osm;
GRANT ALL ON TABLE languages TO osm;
GRANT SELECT ON TABLE languages TO PUBLIC;


--
-- PostgreSQL database dump complete
--

