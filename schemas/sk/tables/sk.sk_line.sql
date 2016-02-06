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
-- Name: sk_line; Type: TABLE; Schema: sk; Owner: sk; Tablespace: 
--

CREATE TABLE sk_line (
    osm_id bigint,
    way public.geometry(LineString,900913)
);


ALTER TABLE sk_line OWNER TO sk;

--
-- Name: sk_line_index; Type: INDEX; Schema: sk; Owner: sk; Tablespace: 
--

CREATE INDEX sk_line_index ON sk_line USING gist (way);


--
-- Name: sk_line_pkey; Type: INDEX; Schema: sk; Owner: sk; Tablespace: 
--

CREATE INDEX sk_line_pkey ON sk_line USING btree (osm_id);


--
-- Name: sk_line; Type: ACL; Schema: sk; Owner: sk
--

REVOKE ALL ON TABLE sk_line FROM PUBLIC;
REVOKE ALL ON TABLE sk_line FROM sk;
GRANT ALL ON TABLE sk_line TO sk;
GRANT SELECT ON TABLE sk_line TO PUBLIC;


--
-- PostgreSQL database dump complete
--

