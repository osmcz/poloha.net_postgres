--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ruian, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: rozbite_budovy; Type: TABLE; Schema: ruian; Owner: ruian; Tablespace: 
--

CREATE TABLE rozbite_budovy (
    definicni_bod public.geometry,
    hranice public.geometry,
    spojnice public.geometry,
    kod bigint
);


ALTER TABLE rozbite_budovy OWNER TO ruian;

--
-- Name: rozbite_budovy; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE rozbite_budovy FROM PUBLIC;
REVOKE ALL ON TABLE rozbite_budovy FROM ruian;
GRANT ALL ON TABLE rozbite_budovy TO ruian;
GRANT SELECT ON TABLE rozbite_budovy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

