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
-- Name: adresy; Type: VIEW; Schema: ruian; Owner: ruian
--

CREATE VIEW adresy AS
 SELECT a.definicni_bod AS point,
    (((
        CASE
            WHEN (a.cislo_domovni IS NULL) THEN ''::text
            ELSE (a.cislo_domovni)::text
        END ||
        CASE
            WHEN ((a.cislo_domovni IS NOT NULL) AND ((a.cislo_orientacni_hodnota IS NOT NULL) OR (a.cislo_orientacni_pismeno IS NOT NULL))) THEN '/'::text
            ELSE ''::text
        END) ||
        CASE
            WHEN (a.cislo_orientacni_hodnota IS NULL) THEN ''::text
            ELSE (a.cislo_orientacni_hodnota)::text
        END) ||
        CASE
            WHEN (a.cislo_orientacni_pismeno IS NULL) THEN ''::text
            ELSE (a.cislo_orientacni_pismeno)::text
        END) AS cislo,
        CASE
            WHEN (s.typ_kod = 1) THEN 'R'::text
            WHEN (s.typ_kod = 2) THEN 'B'::text
            ELSE 'G'::text
        END AS barva
   FROM (rn_adresni_misto a
     LEFT JOIN rn_stavebni_objekt s ON ((a.stavobj_kod = s.kod)))
  WHERE (NOT a.deleted);


ALTER TABLE adresy OWNER TO ruian;

--
-- Name: adresy; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE adresy FROM PUBLIC;
REVOKE ALL ON TABLE adresy FROM ruian;
GRANT ALL ON TABLE adresy TO ruian;
GRANT SELECT ON TABLE adresy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

