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

SET search_path = import, pg_catalog;

--
-- Name: ruian_adresy_view; Type: VIEW; Schema: import; Owner: import
--

CREATE VIEW ruian_adresy_view AS
 SELECT addr.kod AS id,
        CASE
            WHEN (stavebniobjekt.typ_kod = 1) THEN addr.cislo_domovni
            ELSE NULL::integer
        END AS cislo_popisne,
        CASE
            WHEN (stavebniobjekt.typ_kod = 2) THEN addr.cislo_domovni
            ELSE NULL::integer
        END AS cislo_evidencni,
        CASE
            WHEN ((addr.cislo_orientacni_hodnota IS NOT NULL) AND (addr.cislo_orientacni_pismeno IS NOT NULL)) THEN ((addr.cislo_orientacni_hodnota)::text || (addr.cislo_orientacni_pismeno)::text)
            ELSE
            CASE
                WHEN (addr.cislo_orientacni_hodnota IS NOT NULL) THEN (addr.cislo_orientacni_hodnota)::text
                ELSE (addr.cislo_orientacni_pismeno)::text
            END
        END AS cislo_orientacni,
    ulice.nazev AS ulice,
    castobce.nazev AS cast_obce,
    obec.nazev AS obec,
    addr.adrp_psc AS psc,
        CASE
            WHEN (addr.definicni_bod IS NOT NULL) THEN addr.definicni_bod
            ELSE
            CASE
                WHEN (stavebniobjekt.hranice IS NOT NULL) THEN public.st_centroid(stavebniobjekt.hranice)
                ELSE stavebniobjekt.definicni_bod
            END
        END AS geom,
    okres.nazev AS okres,
    addr.item_timestamp,
    momc.nazev AS mestska_cast,
    NULL::text AS is_in,
    addr.ulice_kod,
        CASE
            WHEN (addr.definicni_bod IS NULL) THEN true
            ELSE false
        END AS am_nogeom,
        CASE
            WHEN (stavebniobjekt.hranice IS NOT NULL) THEN distance_meters(stavebniobjekt.hranice, addr.definicni_bod)
            ELSE distance_meters(stavebniobjekt.definicni_bod, addr.definicni_bod)
        END AS am_so_distance,
    obec.kod AS kod_obce,
    momc.kod AS kod_momc,
    castobce.kod AS cobce_kod,
    ku.nazev AS ku,
    ku.kod AS ku_kod,
    parcela.id AS parcela_id
   FROM ((((((((ruian.rn_adresni_misto addr
     LEFT JOIN ruian.rn_ulice ulice ON (((addr.ulice_kod = ulice.kod) AND (NOT ulice.deleted))))
     LEFT JOIN ruian.rn_stavebni_objekt stavebniobjekt ON (((addr.stavobj_kod = stavebniobjekt.kod) AND (NOT stavebniobjekt.deleted))))
     LEFT JOIN ruian.rn_cast_obce castobce ON (((stavebniobjekt.cobce_kod = castobce.kod) AND (NOT castobce.deleted))))
     LEFT JOIN ruian.rn_obec obec ON (((castobce.obec_kod = obec.kod) AND (NOT castobce.deleted))))
     LEFT JOIN ruian.rn_okres okres ON (((obec.okres_kod = okres.kod) AND (NOT okres.deleted))))
     LEFT JOIN ruian.rn_momc momc ON (((stavebniobjekt.momc_kod = momc.kod) AND (NOT momc.deleted))))
     LEFT JOIN ruian.rn_parcela parcela ON (((stavebniobjekt.identifikacni_parcela_id = parcela.id) AND (NOT parcela.deleted))))
     LEFT JOIN ruian.rn_katastralni_uzemi ku ON (((parcela.katuz_kod = ku.kod) AND (NOT ku.deleted))))
  WHERE (NOT addr.deleted);


ALTER TABLE ruian_adresy_view OWNER TO import;

--
-- Name: ruian_adresy_view; Type: ACL; Schema: import; Owner: import
--

GRANT SELECT ON TABLE ruian_adresy_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

