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
-- Name: sk_polygon; Type: TABLE; Schema: sk; Owner: sk; Tablespace: 
--

CREATE TABLE sk_polygon (
    osm_id bigint,
    place text,
    way public.geometry(Geometry,900913)
);


ALTER TABLE sk_polygon OWNER TO sk;

--
-- Name: sk_polygon_index; Type: INDEX; Schema: sk; Owner: sk; Tablespace: 
--

CREATE INDEX sk_polygon_index ON sk_polygon USING gist (way);


--
-- Name: sk_polygon_pkey; Type: INDEX; Schema: sk; Owner: sk; Tablespace: 
--

CREATE INDEX sk_polygon_pkey ON sk_polygon USING btree (osm_id);


--
-- Name: sk_polygon; Type: ACL; Schema: sk; Owner: sk
--

REVOKE ALL ON TABLE sk_polygon FROM PUBLIC;
REVOKE ALL ON TABLE sk_polygon FROM sk;
GRANT ALL ON TABLE sk_polygon TO sk;
GRANT SELECT ON TABLE sk_polygon TO PUBLIC;


--
-- PostgreSQL database dump complete
--

