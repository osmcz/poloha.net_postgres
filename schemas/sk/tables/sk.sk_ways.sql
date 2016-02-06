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
-- Name: sk_ways; Type: TABLE; Schema: sk; Owner: sk; Tablespace: 
--

CREATE TABLE sk_ways (
    id bigint NOT NULL,
    nodes bigint[] NOT NULL,
    tags text[]
);


ALTER TABLE sk_ways OWNER TO sk;

--
-- Name: sk_ways_pkey; Type: CONSTRAINT; Schema: sk; Owner: sk; Tablespace: 
--

ALTER TABLE ONLY sk_ways
    ADD CONSTRAINT sk_ways_pkey PRIMARY KEY (id);


--
-- Name: sk_ways_nodes; Type: INDEX; Schema: sk; Owner: sk; Tablespace: 
--

CREATE INDEX sk_ways_nodes ON sk_ways USING gin (nodes) WITH (fastupdate=off);


--
-- Name: sk_ways; Type: ACL; Schema: sk; Owner: sk
--

REVOKE ALL ON TABLE sk_ways FROM PUBLIC;
REVOKE ALL ON TABLE sk_ways FROM sk;
GRANT ALL ON TABLE sk_ways TO sk;
GRANT SELECT ON TABLE sk_ways TO PUBLIC;


--
-- PostgreSQL database dump complete
--

