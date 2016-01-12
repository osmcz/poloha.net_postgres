--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import0, pg_catalog;

--
-- Name: warnings_view_full; Type: VIEW; Schema: import0; Owner: import0
--

CREATE VIEW warnings_view_full AS
 SELECT ((((((('http://localhost:8111/zoom?left='::text || ((public.st_x(public.st_transform(a.ruiangeom, 4326)) - (0.0002)::double precision))::text) || '&right='::text) || ((public.st_x(public.st_transform(a.ruiangeom, 4326)) + (0.0002)::double precision))::text) || '&top='::text) || ((public.st_y(public.st_transform(a.ruiangeom, 4326)) + (0.0002)::double precision))::text) || '&bottom='::text) || ((public.st_y(public.st_transform(a.ruiangeom, 4326)) - (0.0002)::double precision))::text) AS josm,
    t.kod_a,
    t.kod_b,
    a.id AS id_a,
    b.id AS id_b,
    a.co AS co_a,
    b.co AS co_b,
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
  WHERE (((a.autocreate AND b.autocreate) AND (((a.id IS NULL) OR (b.id IS NULL)) OR (a.id <> b.id))) AND (NOT ((a.co = 'way'::import.co) AND (b.co = 'way'::import.co))))
  ORDER BY t.distance;


ALTER TABLE warnings_view_full OWNER TO import0;

--
-- Name: warnings_view_full; Type: ACL; Schema: import0; Owner: import0
--

REVOKE ALL ON TABLE warnings_view_full FROM PUBLIC;
REVOKE ALL ON TABLE warnings_view_full FROM import0;
GRANT ALL ON TABLE warnings_view_full TO import0;
GRANT SELECT ON TABLE warnings_view_full TO PUBLIC;


--
-- PostgreSQL database dump complete
--

