--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import0, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ruian_osm; Type: TABLE; Schema: import0; Owner: import0; Tablespace: 
--

CREATE TABLE ruian_osm (
    ruianid bigint,
    osmid bigint,
    level smallint,
    autocreate boolean DEFAULT true,
    co import.co,
    geom public.geometry,
    kdesevzal smallint,
    naceste boolean DEFAULT false
);


ALTER TABLE ruian_osm OWNER TO import0;

--
-- Name: ruian_osm_geom_idx; Type: INDEX; Schema: import0; Owner: import0; Tablespace: 
--

CREATE INDEX ruian_osm_geom_idx ON ruian_osm USING gist (geom);


--
-- Name: ruian_osm; Type: ACL; Schema: import0; Owner: import0
--

REVOKE ALL ON TABLE ruian_osm FROM PUBLIC;
REVOKE ALL ON TABLE ruian_osm FROM import0;
GRANT ALL ON TABLE ruian_osm TO import0;
GRANT SELECT ON TABLE ruian_osm TO PUBLIC;


--
-- PostgreSQL database dump complete
--

