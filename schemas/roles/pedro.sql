--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = gis, pg_catalog;

--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: gis; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA gis REVOKE ALL ON TABLES  FROM pedro;
ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA gis GRANT SELECT ON TABLES  TO PUBLIC;


SET search_path = import, pg_catalog;

--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: import; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA import REVOKE ALL ON TABLES  FROM pedro;
ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA import GRANT SELECT ON TABLES  TO PUBLIC;


SET search_path = import0, pg_catalog;

--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: import0; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA import0 REVOKE ALL ON TABLES  FROM pedro;
ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA import0 GRANT SELECT ON TABLES  TO PUBLIC;


SET search_path = jsontiles, pg_catalog;

--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: jsontiles; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA jsontiles REVOKE ALL ON FUNCTIONS  FROM pedro;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: jsontiles; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA jsontiles REVOKE ALL ON TABLES  FROM pedro;
ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA jsontiles GRANT SELECT ON TABLES  TO PUBLIC;


SET search_path = osm, pg_catalog;

--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: osm; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA osm REVOKE ALL ON FUNCTIONS  FROM pedro;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: osm; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA osm REVOKE ALL ON TABLES  FROM pedro;
ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA osm GRANT SELECT ON TABLES  TO PUBLIC;


SET search_path = osmtables, pg_catalog;

--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: osmtables; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA osmtables REVOKE ALL ON TABLES  FROM pedro;
ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA osmtables GRANT SELECT ON TABLES  TO PUBLIC;


SET search_path = public, pg_catalog;

--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA public REVOKE ALL ON TABLES  FROM pedro;
ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA public GRANT SELECT ON TABLES  TO PUBLIC;


SET search_path = ruian, pg_catalog;

--
-- Name: DEFAULT PRIVILEGES FOR SEQUENCES; Type: DEFAULT ACL; Schema: ruian; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA ruian REVOKE ALL ON SEQUENCES  FROM pedro;
ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA ruian GRANT SELECT ON SEQUENCES  TO PUBLIC;


--
-- Name: DEFAULT PRIVILEGES FOR TYPES; Type: DEFAULT ACL; Schema: ruian; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA ruian REVOKE ALL ON TYPES  FROM pedro;


--
-- Name: DEFAULT PRIVILEGES FOR FUNCTIONS; Type: DEFAULT ACL; Schema: ruian; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA ruian REVOKE ALL ON FUNCTIONS  FROM pedro;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: ruian; Owner: pedro
--

ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA ruian REVOKE ALL ON TABLES  FROM pedro;
ALTER DEFAULT PRIVILEGES FOR ROLE pedro IN SCHEMA ruian GRANT SELECT ON TABLES  TO PUBLIC;


--
-- PostgreSQL database dump complete
--

