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
-- Name: ul; Type: VIEW; Schema: public; Owner: pedro
--

CREATE VIEW ul AS
 SELECT rn_ulice.kod,
    rn_ulice.nazev,
    rn_ulice.nespravny,
    rn_ulice.obec_kod,
    rn_ulice.id_trans_ruian,
    rn_ulice.plati_od,
    rn_ulice.nz_id_globalni,
    rn_ulice.zmena_grafiky,
    rn_ulice.definicni_cara,
    rn_ulice.item_timestamp,
    rn_ulice.deleted
   FROM ruian.rn_ulice;


ALTER TABLE ul OWNER TO pedro;

--
-- Name: ul; Type: ACL; Schema: public; Owner: pedro
--

REVOKE ALL ON TABLE ul FROM PUBLIC;
REVOKE ALL ON TABLE ul FROM pedro;
GRANT ALL ON TABLE ul TO pedro;
GRANT SELECT ON TABLE ul TO PUBLIC;


--
-- PostgreSQL database dump complete
--

