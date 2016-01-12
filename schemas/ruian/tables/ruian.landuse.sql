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
-- Name: landuse; Type: TABLE; Schema: ruian; Owner: pedro; Tablespace: 
--

CREATE TABLE landuse (
    kod integer,
    hranice public.geometry,
    okres_kod integer
);


ALTER TABLE landuse OWNER TO pedro;

--
-- Name: landuse_index; Type: INDEX; Schema: ruian; Owner: pedro; Tablespace: 
--

CREATE INDEX landuse_index ON landuse USING gist (hranice);


--
-- Name: landuse; Type: ACL; Schema: ruian; Owner: pedro
--

REVOKE ALL ON TABLE landuse FROM PUBLIC;
REVOKE ALL ON TABLE landuse FROM pedro;
GRANT ALL ON TABLE landuse TO pedro;
GRANT SELECT ON TABLE landuse TO PUBLIC;


--
-- PostgreSQL database dump complete
--

