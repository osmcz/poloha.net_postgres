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
-- Name: sk_nodes; Type: TABLE; Schema: sk; Owner: sk; Tablespace: 
--

CREATE TABLE sk_nodes (
    id bigint NOT NULL,
    lat integer NOT NULL,
    lon integer NOT NULL,
    tags text[]
);


ALTER TABLE sk_nodes OWNER TO sk;

--
-- Name: sk_nodes_pkey; Type: CONSTRAINT; Schema: sk; Owner: sk; Tablespace: 
--

ALTER TABLE ONLY sk_nodes
    ADD CONSTRAINT sk_nodes_pkey PRIMARY KEY (id);


--
-- Name: sk_nodes; Type: ACL; Schema: sk; Owner: sk
--

REVOKE ALL ON TABLE sk_nodes FROM PUBLIC;
REVOKE ALL ON TABLE sk_nodes FROM sk;
GRANT ALL ON TABLE sk_nodes TO sk;
GRANT SELECT ON TABLE sk_nodes TO PUBLIC;


--
-- PostgreSQL database dump complete
--

