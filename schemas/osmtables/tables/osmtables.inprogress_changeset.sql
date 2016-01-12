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
-- Name: inprogress_changeset; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE inprogress_changeset (
    uid smallint NOT NULL,
    id bigint NOT NULL,
    datum timestamp without time zone DEFAULT now()
);


ALTER TABLE inprogress_changeset OWNER TO pedro;

--
-- Name: inprogress_id_pkey; Type: CONSTRAINT; Schema: osmtables; Owner: pedro; Tablespace: 
--

ALTER TABLE ONLY inprogress_changeset
    ADD CONSTRAINT inprogress_id_pkey PRIMARY KEY (id);


--
-- Name: refresh_stats; Type: TRIGGER; Schema: osmtables; Owner: pedro
--

CREATE TRIGGER refresh_stats AFTER INSERT OR DELETE OR UPDATE ON inprogress_changeset FOR EACH STATEMENT EXECUTE PROCEDURE import.update_stats();

ALTER TABLE inprogress_changeset DISABLE TRIGGER refresh_stats;


--
-- Name: inprogress_changeset; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE inprogress_changeset FROM PUBLIC;
REVOKE ALL ON TABLE inprogress_changeset FROM pedro;
GRANT ALL ON TABLE inprogress_changeset TO pedro;
GRANT SELECT ON TABLE inprogress_changeset TO PUBLIC;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE inprogress_changeset TO import;


--
-- PostgreSQL database dump complete
--

