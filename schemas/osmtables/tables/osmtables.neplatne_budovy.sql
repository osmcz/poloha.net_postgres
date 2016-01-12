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
-- Name: neplatne_budovy; Type: TABLE; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE TABLE neplatne_budovy (
    kod bigint,
    duvod smallint,
    datum date DEFAULT now(),
    user_id bigint,
    user_nick text,
    poznamka text,
    hlasit_cuzk boolean DEFAULT false,
    hlaseno boolean DEFAULT false,
    geom public.geometry
);


ALTER TABLE neplatne_budovy OWNER TO pedro;

--
-- Name: kod; Type: CONSTRAINT; Schema: osmtables; Owner: pedro; Tablespace: 
--

ALTER TABLE ONLY neplatne_budovy
    ADD CONSTRAINT kod UNIQUE (kod);


--
-- Name: neplatne_budovy_kod_idx; Type: INDEX; Schema: osmtables; Owner: pedro; Tablespace: 
--

CREATE INDEX neplatne_budovy_kod_idx ON neplatne_budovy USING btree (kod);


--
-- Name: update_building; Type: TRIGGER; Schema: osmtables; Owner: pedro
--

CREATE TRIGGER update_building AFTER INSERT OR DELETE OR UPDATE ON neplatne_budovy FOR EACH ROW EXECUTE PROCEDURE update_building();


--
-- Name: neplatne_budovy_duvod_fkey; Type: FK CONSTRAINT; Schema: osmtables; Owner: pedro
--

ALTER TABLE ONLY neplatne_budovy
    ADD CONSTRAINT neplatne_budovy_duvod_fkey FOREIGN KEY (duvod) REFERENCES neplatne_budovy_duvod(id) DEFERRABLE;


--
-- Name: neplatne_budovy; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE neplatne_budovy FROM PUBLIC;
REVOKE ALL ON TABLE neplatne_budovy FROM pedro;
GRANT ALL ON TABLE neplatne_budovy TO pedro;
GRANT SELECT ON TABLE neplatne_budovy TO PUBLIC;
GRANT ALL ON TABLE neplatne_budovy TO marian;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE neplatne_budovy TO hlasenibudov;


--
-- PostgreSQL database dump complete
--

