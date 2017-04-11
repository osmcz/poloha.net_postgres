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

SET search_path = osmtables, pg_catalog;

--
-- Name: vyuziti_parcel_statistika; Type: VIEW; Schema: osmtables; Owner: pedro
--

CREATE VIEW vyuziti_parcel_statistika AS
 SELECT oo.cnt AS pocet,
    oo.druh_pozemku_kod,
    druh.nazev AS druh,
    oo.zpusob_vyu_poz_kod,
    vyuziti.nazev AS vyuziti,
    zpusoby.kod,
    zpusoby.nazev
   FROM (((( SELECT count(*) AS cnt,
            rn_parcela.zpusob_vyu_poz_kod,
            rn_parcela.druh_pozemku_kod
           FROM ruian.rn_parcela
          WHERE ((NOT rn_parcela.deleted) AND (rn_parcela.hranice IS NOT NULL))
          GROUP BY rn_parcela.zpusob_vyu_poz_kod, rn_parcela.druh_pozemku_kod) oo
     LEFT JOIN druh_pozemku druh ON ((druh.kod = oo.druh_pozemku_kod)))
     LEFT JOIN zpusob_vyuziti_pozemku vyuziti ON (((vyuziti.kod = oo.zpusob_vyu_poz_kod) OR ((vyuziti.kod IS NULL) AND (oo.zpusob_vyu_poz_kod IS NULL)))))
     LEFT JOIN zpusoby_vyuziti_parcel zpusoby ON (((zpusoby.druh_pozemku_kod = oo.druh_pozemku_kod) AND ((zpusoby.zpusob_vyu_poz_kod = oo.zpusob_vyu_poz_kod) OR ((zpusoby.zpusob_vyu_poz_kod IS NULL) AND (oo.zpusob_vyu_poz_kod IS NULL))))));


ALTER TABLE vyuziti_parcel_statistika OWNER TO pedro;

--
-- Name: vyuziti_parcel_statistika; Type: ACL; Schema: osmtables; Owner: pedro
--

GRANT SELECT ON TABLE vyuziti_parcel_statistika TO PUBLIC;


--
-- PostgreSQL database dump complete
--

