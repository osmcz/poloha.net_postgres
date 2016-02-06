--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = sk, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: sk_roads; Type: TABLE; Schema: sk; Owner: sk; Tablespace: 
--

CREATE TABLE sk_roads (
    osm_id bigint,
    place text,
    way public.geometry(LineString,900913)
);


ALTER TABLE sk_roads OWNER TO sk;

--
-- Name: sk_roads_index; Type: INDEX; Schema: sk; Owner: sk; Tablespace: 
--

CREATE INDEX sk_roads_index ON sk_roads USING gist (way);


--
-- Name: sk_roads_pkey; Type: INDEX; Schema: sk; Owner: sk; Tablespace: 
--

CREATE INDEX sk_roads_pkey ON sk_roads USING btree (osm_id);


--
-- Name: sk_roads; Type: ACL; Schema: sk; Owner: sk
--

REVOKE ALL ON TABLE sk_roads FROM PUBLIC;
REVOKE ALL ON TABLE sk_roads FROM sk;
GRANT ALL ON TABLE sk_roads TO sk;
GRANT SELECT ON TABLE sk_roads TO PUBLIC;


--
-- PostgreSQL database dump complete
--

