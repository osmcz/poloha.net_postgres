--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: osmstudanky; Type: VIEW; Schema: public; Owner: pedro
--

CREATE VIEW osmstudanky AS
 SELECT osm_studanky.id,
    osm_studanky.co,
    osm_studanky.geom
   FROM studanky.osm_studanky;


ALTER TABLE osmstudanky OWNER TO pedro;

--
-- Name: osmstudanky; Type: ACL; Schema: public; Owner: pedro
--

REVOKE ALL ON TABLE osmstudanky FROM PUBLIC;
REVOKE ALL ON TABLE osmstudanky FROM pedro;
GRANT ALL ON TABLE osmstudanky TO pedro;
GRANT SELECT ON TABLE osmstudanky TO PUBLIC;


--
-- PostgreSQL database dump complete
--

