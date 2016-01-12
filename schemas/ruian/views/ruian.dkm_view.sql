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

--
-- Name: dkm_view; Type: VIEW; Schema: ruian; Owner: pedro
--

CREATE VIEW dkm_view AS
 SELECT dkm.kod,
    ku.nazev,
    obec.nazev AS obec,
    okres.nazev AS okres,
    dkm.datum AS plati_od
   FROM (((dkm dkm
     LEFT JOIN rn_katastralni_uzemi ku ON ((dkm.kod = ku.kod)))
     LEFT JOIN rn_obec obec ON ((obec.kod = ku.obec_kod)))
     LEFT JOIN rn_okres okres ON ((obec.okres_kod = okres.kod)))
  WHERE ((((dkm.ma_dkm AND dkm.new) AND (NOT ku.deleted)) AND (NOT obec.deleted)) AND (NOT okres.deleted))
  ORDER BY dkm.datum DESC;


ALTER TABLE dkm_view OWNER TO pedro;

--
-- Name: dkm_view; Type: ACL; Schema: ruian; Owner: pedro
--

REVOKE ALL ON TABLE dkm_view FROM PUBLIC;
REVOKE ALL ON TABLE dkm_view FROM pedro;
GRANT ALL ON TABLE dkm_view TO pedro;
GRANT SELECT ON TABLE dkm_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

