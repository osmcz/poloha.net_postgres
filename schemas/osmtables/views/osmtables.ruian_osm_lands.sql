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

--
-- Name: ruian_osm_lands; Type: VIEW; Schema: osmtables; Owner: pedro
--

CREATE VIEW ruian_osm_lands AS
 SELECT zp_pa.druh_pozemku_kod,
    druhpoz.nazev AS druh_pozemku_nazev,
    zp_pa.zpusob_vyu_poz_kod,
    zpusob_poz.nazev AS zpusob_vyu_poz_nazev,
    zp_pa.nazev AS osm_nazev,
    zp_pa.tagy
   FROM ((zpusoby_vyuziti_parcel zp_pa
     LEFT JOIN druh_pozemku druhpoz ON ((druhpoz.kod = zp_pa.druh_pozemku_kod)))
     LEFT JOIN zpusob_vyuziti_pozemku zpusob_poz ON ((zpusob_poz.kod = zp_pa.zpusob_vyu_poz_kod)))
  ORDER BY zp_pa.druh_pozemku_kod, zp_pa.zpusob_vyu_poz_kod;


ALTER TABLE ruian_osm_lands OWNER TO pedro;

--
-- Name: ruian_osm_lands; Type: ACL; Schema: osmtables; Owner: pedro
--

REVOKE ALL ON TABLE ruian_osm_lands FROM PUBLIC;
REVOKE ALL ON TABLE ruian_osm_lands FROM pedro;
GRANT ALL ON TABLE ruian_osm_lands TO pedro;
GRANT SELECT ON TABLE ruian_osm_lands TO PUBLIC;


--
-- PostgreSQL database dump complete
--

