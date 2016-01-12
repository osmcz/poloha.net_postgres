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
-- Name: inchangeset; Type: TABLE; Schema: import0; Owner: import0; Tablespace: 
--

CREATE TABLE inchangeset (
    co import.co,
    id bigint
);


ALTER TABLE inchangeset OWNER TO import0;

--
-- Name: in_changeset_id; Type: INDEX; Schema: import0; Owner: import0; Tablespace: 
--

CREATE INDEX in_changeset_id ON inchangeset USING btree (id);


--
-- Name: inchangeset; Type: ACL; Schema: import0; Owner: import0
--

REVOKE ALL ON TABLE inchangeset FROM PUBLIC;
REVOKE ALL ON TABLE inchangeset FROM import0;
GRANT ALL ON TABLE inchangeset TO import0;
GRANT SELECT ON TABLE inchangeset TO PUBLIC;


--
-- PostgreSQL database dump complete
--

