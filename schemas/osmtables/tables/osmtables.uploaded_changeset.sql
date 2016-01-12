--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osmtables, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: uploaded_changeset; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE uploaded_changeset (
    id bigint NOT NULL,
    datum timestamp without time zone DEFAULT now(),
    nickname text
);


ALTER TABLE uploaded_changeset OWNER TO pedro;

--
-- Name: uploaded_id_pkey; Type: CONSTRAINT; Schema: osmtables; Owner: pedro; Tablespace: 
--

ALTER TABLE ONLY uploaded_changeset
    ADD CONSTRAINT uploaded_id_pkey PRIMARY KEY (id);


--
-- Name: refresh_stats; Type: TRIGGER; Schema: osmtables; Owner: pedro
--

CREATE TRIGGER refresh_stats AFTER INSERT OR DELETE OR UPDATE ON uploaded_changeset FOR EACH STATEMENT EXECUTE PROCEDURE import.update_stats();

ALTER TABLE uploaded_changeset DISABLE TRIGGER refresh_stats;


--
-- Name: uploaded_changeset; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE uploaded_changeset FROM PUBLIC;
REVOKE ALL ON TABLE uploaded_changeset FROM pedro;
GRANT ALL ON TABLE uploaded_changeset TO pedro;
GRANT SELECT ON TABLE uploaded_changeset TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE uploaded_changeset TO import;


--
-- PostgreSQL database dump complete
--

