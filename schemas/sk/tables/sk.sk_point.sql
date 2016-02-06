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
-- Name: sk_point; Type: TABLE; Schema: sk; Owner: sk; Tablespace: 
--

CREATE TABLE sk_point (
    osm_id bigint,
    place text,
    way public.geometry(Point,900913)
);


ALTER TABLE sk_point OWNER TO sk;

--
-- Name: sk_point_index; Type: INDEX; Schema: sk; Owner: sk; Tablespace: 
--

CREATE INDEX sk_point_index ON sk_point USING gist (way);


--
-- Name: sk_point_pkey; Type: INDEX; Schema: sk; Owner: sk; Tablespace: 
--

CREATE INDEX sk_point_pkey ON sk_point USING btree (osm_id);


--
-- Name: sk_point_place; Type: INDEX; Schema: sk; Owner: sk; Tablespace: 
--

CREATE INDEX sk_point_place ON sk_point USING btree (((place IS NOT NULL)));


--
-- Name: sk_point; Type: ACL; Schema: sk; Owner: sk
--

REVOKE ALL ON TABLE sk_point FROM PUBLIC;
REVOKE ALL ON TABLE sk_point FROM sk;
GRANT ALL ON TABLE sk_point TO sk;
GRANT SELECT ON TABLE sk_point TO PUBLIC;


--
-- PostgreSQL database dump complete
--

