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
-- Name: parovane_delete; Type: VIEW; Schema: import; Owner: import
--

CREATE VIEW parovane_delete AS
 SELECT r.id AS kod,
    r.deleted,
    r.item_timestamp,
    r.cislo_popisne,
    r.cislo_evidencni,
    r.cislo_orientacni,
    r.ulice,
    r.cast_obce,
    r.obec,
    r.okres,
    r.psc,
    r.geom AS ruiangeom,
    o.co,
    o.id,
    o.conscriptionnumber,
    o.streetnumber,
    o.provisionalnumber,
    o.housenumber,
    o.street,
    o.place,
    r.is_in,
    o.geom AS osmgeom,
    distance_meters(r.geom, o.geom) AS distance,
    par.level,
    o.visible,
    o.version,
        CASE
            WHEN ((r.cislo_popisne IS NOT NULL) AND (r.cislo_orientacni IS NOT NULL)) THEN ((r.cislo_popisne || '/'::text) || r.cislo_orientacni)
            WHEN ((r.cislo_evidencni IS NOT NULL) AND (r.cislo_orientacni IS NOT NULL)) THEN ((('ev.'::text || r.cislo_evidencni) || '/'::text) || r.cislo_orientacni)
            WHEN ((r.cislo_popisne IS NOT NULL) AND (r.cislo_orientacni IS NULL)) THEN (r.cislo_popisne)::text
            WHEN ((r.cislo_evidencni IS NOT NULL) AND (r.cislo_orientacni IS NULL)) THEN ('ev.'::text || r.cislo_evidencni)
            WHEN ((r.cislo_popisne IS NULL) AND (r.cislo_evidencni IS NULL)) THEN ('/'::text || r.cislo_orientacni)
            ELSE NULL::text
        END AS cislo_domu,
    o.source,
    o.sourceaddr,
    o.refruian,
    r.mestska_cast,
    r.ulice_kod,
    r.am_nogeom,
    r.am_so_distance,
    r.kod_obce,
    r.kod_momc,
    par.deleteit
   FROM ((import0.ruian_osm_delete par
     LEFT JOIN ruian_adresy_dview r ON ((par.ruianid = r.id)))
     LEFT JOIN osm_adresy o ON (((par.osmid = o.id) AND (par.co = o.co))))
  WHERE (par.osmid IS NOT NULL);


ALTER TABLE parovane_delete OWNER TO import;

--
-- Name: parovane_delete; Type: ACL; Schema: import; Owner: import
--

GRANT SELECT ON TABLE parovane_delete TO PUBLIC;


--
-- PostgreSQL database dump complete
--

