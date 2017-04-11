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

SET search_path = import0, pg_catalog;

--
-- Name: allwarnings_view; Type: VIEW; Schema: import0; Owner: import0
--

CREATE VIEW allwarnings_view AS
 SELECT import.josm_link(allwarnings.kod) AS josm_link,
    allwarnings.popis,
    allwarnings.distance,
        CASE
            WHEN (warnings_view.cislo_popisne_a IS NOT NULL) THEN warnings_view.cislo_popisne_a
            WHEN (warnings_view_full.cislo_popisne_a IS NOT NULL) THEN warnings_view_full.cislo_popisne_a
            WHEN (morewarnings_view.cislo_popisne IS NOT NULL) THEN morewarnings_view.cislo_popisne
            WHEN (par.cislo_popisne IS NOT NULL) THEN par.cislo_popisne
            ELSE NULL::integer
        END AS cislo_popisne_a,
        CASE
            WHEN (warnings_view.cislo_popisne_b IS NOT NULL) THEN warnings_view.cislo_popisne_b
            WHEN (warnings_view_full.cislo_popisne_b IS NOT NULL) THEN warnings_view_full.cislo_popisne_b
            ELSE NULL::integer
        END AS cislo_popisne_b,
    morewarnings_view.conscriptionnumber,
        CASE
            WHEN (warnings_view.cislo_evidencni_a IS NOT NULL) THEN warnings_view.cislo_evidencni_a
            WHEN (warnings_view_full.cislo_evidencni_a IS NOT NULL) THEN warnings_view_full.cislo_evidencni_a
            WHEN (morewarnings_view.cislo_evidencni IS NOT NULL) THEN morewarnings_view.cislo_evidencni
            WHEN (par.cislo_evidencni IS NOT NULL) THEN par.cislo_evidencni
            ELSE NULL::integer
        END AS cislo_evidencni_a,
        CASE
            WHEN (warnings_view.cislo_evidencni_b IS NOT NULL) THEN warnings_view.cislo_evidencni_b
            WHEN (warnings_view_full.cislo_evidencni_b IS NOT NULL) THEN warnings_view_full.cislo_evidencni_b
            ELSE NULL::integer
        END AS cislo_evidencni_b,
    morewarnings_view.provisionalnumber,
        CASE
            WHEN (warnings_view.cislo_orientacni_a IS NOT NULL) THEN warnings_view.cislo_orientacni_a
            WHEN (warnings_view_full.cislo_orientacni_a IS NOT NULL) THEN warnings_view_full.cislo_orientacni_a
            WHEN (morewarnings_view.cislo_orientacni IS NOT NULL) THEN morewarnings_view.cislo_orientacni
            WHEN (par.cislo_orientacni IS NOT NULL) THEN par.cislo_orientacni
            ELSE NULL::text
        END AS cislo_orientacni_a,
        CASE
            WHEN (warnings_view.cislo_orientacni_b IS NOT NULL) THEN warnings_view.cislo_orientacni_b
            WHEN (warnings_view_full.cislo_orientacni_b IS NOT NULL) THEN warnings_view_full.cislo_orientacni_b
            ELSE NULL::text
        END AS cislo_orientacni_b,
    morewarnings_view.streetnumber,
        CASE
            WHEN (warnings_view.ulice_a IS NOT NULL) THEN warnings_view.ulice_a
            WHEN (warnings_view_full.ulice_a IS NOT NULL) THEN warnings_view_full.ulice_a
            WHEN (morewarnings_view.ulice IS NOT NULL) THEN morewarnings_view.ulice
            WHEN (par.ulice IS NOT NULL) THEN par.ulice
            ELSE NULL::character varying
        END AS ulice_a,
        CASE
            WHEN (warnings_view.ulice_b IS NOT NULL) THEN warnings_view.ulice_b
            WHEN (warnings_view_full.ulice_b IS NOT NULL) THEN warnings_view_full.ulice_b
            ELSE NULL::character varying
        END AS ulice_b,
    morewarnings_view.street,
        CASE
            WHEN (warnings_view.cast_obce_a IS NOT NULL) THEN warnings_view.cast_obce_a
            WHEN (warnings_view_full.cast_obce_a IS NOT NULL) THEN warnings_view_full.cast_obce_a
            WHEN (morewarnings_view.cast_obce IS NOT NULL) THEN morewarnings_view.cast_obce
            WHEN (par.cast_obce IS NOT NULL) THEN par.cast_obce
            ELSE NULL::character varying
        END AS cast_obce_a,
        CASE
            WHEN (warnings_view.cast_obce_b IS NOT NULL) THEN warnings_view.cast_obce_b
            WHEN (warnings_view_full.cast_obce_b IS NOT NULL) THEN warnings_view_full.cast_obce_b
            ELSE NULL::character varying
        END AS cast_obce_b,
    morewarnings_view.place,
        CASE
            WHEN (warnings_view.obec_a IS NOT NULL) THEN warnings_view.obec_a
            WHEN (warnings_view_full.obec_a IS NOT NULL) THEN warnings_view_full.obec_a
            WHEN (morewarnings_view.obec IS NOT NULL) THEN morewarnings_view.obec
            WHEN (par.obec IS NOT NULL) THEN par.obec
            ELSE NULL::character varying
        END AS obec_a,
        CASE
            WHEN (warnings_view.obec_b IS NOT NULL) THEN warnings_view.obec_b
            WHEN (warnings_view_full.obec_b IS NOT NULL) THEN warnings_view_full.obec_b
            ELSE NULL::character varying
        END AS obec_b,
    morewarnings_view.city
   FROM ((((allwarnings
     LEFT JOIN warnings_view ON (((allwarnings.kod = warnings_view.kod_a) OR (allwarnings.kod = warnings_view.kod_b))))
     LEFT JOIN warnings_view_full ON (((allwarnings.kod = warnings_view_full.kod_a) OR (allwarnings.kod = warnings_view_full.kod_b))))
     LEFT JOIN morewarnings_view ON ((allwarnings.kod = morewarnings_view.kod)))
     LEFT JOIN parovane_geom par ON ((allwarnings.kod = par.kod)))
  ORDER BY allwarnings.distance;


ALTER TABLE allwarnings_view OWNER TO import0;

--
-- Name: allwarnings_view; Type: ACL; Schema: import0; Owner: import0
--

GRANT SELECT ON TABLE allwarnings_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

