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
-- Name: warnings_view; Type: VIEW; Schema: import0; Owner: import0
--

CREATE VIEW warnings_view AS
 SELECT ((((((('http://localhost:8111/zoom?left='::text || ((public.st_x(public.st_transform(a.ruiangeom, 4326)) - (0.0002)::double precision))::text) || '&right='::text) || ((public.st_x(public.st_transform(a.ruiangeom, 4326)) + (0.0002)::double precision))::text) || '&top='::text) || ((public.st_y(public.st_transform(a.ruiangeom, 4326)) + (0.0002)::double precision))::text) || '&bottom='::text) || ((public.st_y(public.st_transform(a.ruiangeom, 4326)) - (0.0002)::double precision))::text) AS josm,
    t.kod_a,
    t.kod_b,
    a.co AS co_a,
    b.co AS co_b,
    a.id AS id_a,
    b.id AS id_b,
    a.level AS level_a,
    b.level AS level_b,
    t.distance,
    a.cislo_popisne AS cislo_popisne_a,
    b.cislo_popisne AS cislo_popisne_b,
    a.cislo_evidencni AS cislo_evidencni_a,
    b.cislo_evidencni AS cislo_evidencni_b,
    a.cislo_orientacni AS cislo_orientacni_a,
    b.cislo_orientacni AS cislo_orientacni_b,
    a.ulice AS ulice_a,
    b.ulice AS ulice_b,
    a.autocreate AS autocr_a,
    b.autocreate AS autocr_b,
    a.cast_obce AS cast_obce_a,
    b.cast_obce AS cast_obce_b,
    a.obec AS obec_a,
    b.obec AS obec_b
   FROM ((warnings t
     LEFT JOIN parovane_geom a ON ((t.kod_a = a.kod)))
     LEFT JOIN parovane_geom b ON ((t.kod_b = b.kod)))
  WHERE (((a.cislo_popisne = b.cislo_popisne) OR (a.cislo_evidencni = b.cislo_evidencni) OR (a.cislo_popisne = b.cislo_evidencni) OR (a.cislo_evidencni = b.cislo_popisne)) AND ((a.cislo_orientacni = b.cislo_orientacni) OR (a.cislo_orientacni IS NULL) OR (b.cislo_orientacni IS NULL)) AND ((public.difference((a.ulice)::text, (b.ulice)::text) > 2) OR (a.ulice IS NULL) OR (b.ulice IS NULL)) AND a.autocreate AND b.autocreate AND ((a.id IS NULL) OR (b.id IS NULL) OR (a.id <> b.id)))
  ORDER BY t.distance;


ALTER TABLE warnings_view OWNER TO import0;

--
-- Name: warnings_view; Type: ACL; Schema: import0; Owner: import0
--

GRANT SELECT ON TABLE warnings_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

