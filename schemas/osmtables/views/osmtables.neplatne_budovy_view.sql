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
-- Name: neplatne_budovy_view; Type: VIEW; Schema: osmtables; Owner: pedro
--

CREATE VIEW neplatne_budovy_view AS
 SELECT DISTINCT ON (neplatne.kod) neplatne.kod,
    neplatne.datum,
    neplatne.user_nick,
    (((((((((((
        CASE
            WHEN (okres.nazev IS NOT NULL) THEN (okres.nazev)::text
            ELSE ''::text
        END || ', '::text) ||
        CASE
            WHEN (obec.nazev IS NOT NULL) THEN (obec.nazev)::text
            ELSE ''::text
        END) || ', '::text) ||
        CASE
            WHEN (ku.nazev IS NOT NULL) THEN (ku.nazev)::text
            ELSE ''::text
        END) || ', '::text) ||
        CASE
            WHEN (ulice.nazev IS NOT NULL) THEN (ulice.nazev)::text
            ELSE ''::text
        END) || ' '::text) ||
        CASE
            WHEN (am.cislo_domovni IS NOT NULL) THEN (am.cislo_domovni)::text
            ELSE ''::text
        END) ||
        CASE
            WHEN ((am.cislo_domovni IS NOT NULL) AND (am.cislo_orientacni_hodnota IS NOT NULL)) THEN '/'::text
            ELSE ''::text
        END) ||
        CASE
            WHEN (am.cislo_orientacni_hodnota IS NOT NULL) THEN (am.cislo_orientacni_hodnota)::text
            ELSE ''::text
        END) ||
        CASE
            WHEN (am.cislo_orientacni_pismeno IS NOT NULL) THEN (am.cislo_orientacni_pismeno)::text
            ELSE ''::text
        END) AS adresa,
        CASE
            WHEN (so.hranice IS NOT NULL) THEN public.local_textgeom(so.hranice)
            WHEN (so.definicni_bod IS NOT NULL) THEN public.local_textgeom(so.definicni_bod)
            WHEN (parcela.hranice IS NOT NULL) THEN public.local_textgeom(parcela.hranice)
            WHEN (parcela.definicni_bod IS NOT NULL) THEN public.local_textgeom(parcela.definicni_bod)
            ELSE NULL::text
        END AS lokace,
    (((neplatne.duvod)::text || ' - '::text) || duvod.popis) AS popis,
        CASE
            WHEN ((so.item_timestamp - '1 day'::interval) > neplatne.datum) THEN true
            ELSE false
        END AS aktualizovano,
    neplatne.duvod,
    neplatne.hlasit_cuzk,
    neplatne.hlaseno,
    (so.hranice IS NOT NULL) AS ma_geom,
    (so.kod IS NOT NULL) AS existuje,
    okres.kod AS okres_kod
   FROM ((((((((neplatne_budovy neplatne
     LEFT JOIN neplatne_budovy_duvod duvod ON ((neplatne.duvod = duvod.id)))
     LEFT JOIN ruian.rn_stavebni_objekt so ON (((neplatne.kod = so.kod) AND (NOT so.deleted))))
     LEFT JOIN ruian.rn_parcela parcela ON ((so.identifikacni_parcela_id = parcela.id)))
     LEFT JOIN ruian.rn_katastralni_uzemi ku ON ((parcela.katuz_kod = ku.kod)))
     LEFT JOIN ruian.rn_obec obec ON ((ku.obec_kod = obec.kod)))
     LEFT JOIN ruian.rn_okres okres ON ((obec.okres_kod = okres.kod)))
     LEFT JOIN ruian.rn_adresni_misto am ON ((so.kod = am.stavobj_kod)))
     LEFT JOIN ruian.rn_ulice ulice ON ((am.ulice_kod = ulice.kod)));


ALTER TABLE neplatne_budovy_view OWNER TO pedro;

--
-- Name: neplatne_budovy_view; Type: ACL; Schema: osmtables; Owner: pedro
--

GRANT SELECT ON TABLE neplatne_budovy_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

