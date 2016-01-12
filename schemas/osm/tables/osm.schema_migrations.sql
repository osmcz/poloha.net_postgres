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
-- Name: schema_migrations; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE schema_migrations OWNER TO osm;

--
-- Name: unique_schema_migrations; Type: INDEX; Schema: osm; Owner: osm; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: schema_migrations; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE schema_migrations FROM PUBLIC;
REVOKE ALL ON TABLE schema_migrations FROM osm;
GRANT ALL ON TABLE schema_migrations TO osm;
GRANT SELECT ON TABLE schema_migrations TO PUBLIC;


--
-- PostgreSQL database dump complete
--

