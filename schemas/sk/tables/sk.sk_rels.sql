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
-- Name: sk_rels; Type: TABLE; Schema: sk; Owner: sk; Tablespace: 
--

CREATE TABLE sk_rels (
    id bigint NOT NULL,
    way_off smallint,
    rel_off smallint,
    parts bigint[],
    members text[],
    tags text[]
);


ALTER TABLE sk_rels OWNER TO sk;

--
-- Name: sk_rels_pkey; Type: CONSTRAINT; Schema: sk; Owner: sk; Tablespace: 
--

ALTER TABLE ONLY sk_rels
    ADD CONSTRAINT sk_rels_pkey PRIMARY KEY (id);


--
-- Name: sk_rels_parts; Type: INDEX; Schema: sk; Owner: sk; Tablespace: 
--

CREATE INDEX sk_rels_parts ON sk_rels USING gin (parts) WITH (fastupdate=off);


--
-- Name: sk_rels; Type: ACL; Schema: sk; Owner: sk
--

REVOKE ALL ON TABLE sk_rels FROM PUBLIC;
REVOKE ALL ON TABLE sk_rels FROM sk;
GRANT ALL ON TABLE sk_rels TO sk;
GRANT SELECT ON TABLE sk_rels TO PUBLIC;


--
-- PostgreSQL database dump complete
--

