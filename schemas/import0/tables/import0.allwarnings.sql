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
-- Name: allwarnings; Type: TABLE; Schema: import0; Owner: import0; Tablespace: 
--

CREATE TABLE allwarnings (
    kod bigint NOT NULL,
    distance real,
    popis text
);


ALTER TABLE allwarnings OWNER TO import0;

--
-- Name: allwarnings_pkey; Type: CONSTRAINT; Schema: import0; Owner: import0; Tablespace: 
--

ALTER TABLE ONLY allwarnings
    ADD CONSTRAINT allwarnings_pkey PRIMARY KEY (kod);


--
-- Name: allwarnings; Type: ACL; Schema: import0; Owner: import0
--

REVOKE ALL ON TABLE allwarnings FROM PUBLIC;
REVOKE ALL ON TABLE allwarnings FROM import0;
GRANT ALL ON TABLE allwarnings TO import0;
GRANT SELECT ON TABLE allwarnings TO PUBLIC;


--
-- PostgreSQL database dump complete
--

