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
-- Name: studanky; Type: VIEW; Schema: public; Owner: pedro
--

CREATE VIEW studanky AS
 SELECT studanky.id,
    studanky.typ1,
    studanky.typ2,
    studanky.jmeno,
    studanky.foto,
    studanky.website,
    studanky.vlozeno,
    studanky.aktualizace,
    studanky.autor,
    studanky.patron,
    studanky.poznamka,
    studanky.pitelnost,
    studanky.geom,
    studanky.osm_id,
    studanky.co,
    studanky.aktualizovano
   FROM studanky.studanky;


ALTER TABLE studanky OWNER TO pedro;

--
-- Name: studanky; Type: ACL; Schema: public; Owner: pedro
--

REVOKE ALL ON TABLE studanky FROM PUBLIC;
REVOKE ALL ON TABLE studanky FROM pedro;
GRANT ALL ON TABLE studanky TO pedro;
GRANT SELECT ON TABLE studanky TO PUBLIC;


--
-- PostgreSQL database dump complete
--

