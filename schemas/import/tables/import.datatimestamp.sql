--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: datatimestamp; Type: TABLE; Schema: import; Owner: pedro; Tablespace: 
--

CREATE TABLE datatimestamp (
    ruian timestamp with time zone,
    osm timestamp with time zone,
    buildings_todo timestamp with time zone,
    landuse timestamp with time zone
);


ALTER TABLE datatimestamp OWNER TO pedro;

--
-- Name: datatimestamp; Type: ACL; Schema: import; Owner: pedro
--

REVOKE ALL ON TABLE datatimestamp FROM PUBLIC;
REVOKE ALL ON TABLE datatimestamp FROM pedro;
GRANT ALL ON TABLE datatimestamp TO pedro;
GRANT SELECT ON TABLE datatimestamp TO PUBLIC;


--
-- Name: datatimestamp.ruian; Type: ACL; Schema: import; Owner: pedro
--

REVOKE ALL(ruian) ON TABLE datatimestamp FROM PUBLIC;
REVOKE ALL(ruian) ON TABLE datatimestamp FROM pedro;
GRANT UPDATE(ruian) ON TABLE datatimestamp TO ruian;


--
-- Name: datatimestamp.osm; Type: ACL; Schema: import; Owner: pedro
--

REVOKE ALL(osm) ON TABLE datatimestamp FROM PUBLIC;
REVOKE ALL(osm) ON TABLE datatimestamp FROM pedro;
GRANT UPDATE(osm) ON TABLE datatimestamp TO mapnik;


--
-- Name: datatimestamp.buildings_todo; Type: ACL; Schema: import; Owner: pedro
--

REVOKE ALL(buildings_todo) ON TABLE datatimestamp FROM PUBLIC;
REVOKE ALL(buildings_todo) ON TABLE datatimestamp FROM pedro;
GRANT UPDATE(buildings_todo) ON TABLE datatimestamp TO mapnik;


--
-- PostgreSQL database dump complete
--

