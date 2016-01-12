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
-- Name: way_tags; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE way_tags (
    way_id bigint DEFAULT (0)::bigint NOT NULL,
    k character varying(255) NOT NULL,
    v character varying(255) NOT NULL,
    version bigint NOT NULL
);


ALTER TABLE way_tags OWNER TO osm;

--
-- Name: way_tags_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY way_tags
    ADD CONSTRAINT way_tags_pkey PRIMARY KEY (way_id, version, k);


--
-- Name: way_tags_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY way_tags
    ADD CONSTRAINT way_tags_id_fkey FOREIGN KEY (way_id, version) REFERENCES ways(way_id, version);


--
-- Name: way_tags; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE way_tags FROM PUBLIC;
REVOKE ALL ON TABLE way_tags FROM osm;
GRANT ALL ON TABLE way_tags TO osm;
GRANT SELECT ON TABLE way_tags TO PUBLIC;


--
-- PostgreSQL database dump complete
--

