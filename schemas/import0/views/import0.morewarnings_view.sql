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
-- Name: morewarnings_view; Type: VIEW; Schema: import0; Owner: import0
--

CREATE VIEW morewarnings_view AS
 SELECT ((((((('http://localhost:8111/zoom?left='::text || ((public.st_x(public.st_transform(p.ruiangeom, 4326)) - (0.0002)::double precision))::text) || '&right='::text) || ((public.st_x(public.st_transform(p.ruiangeom, 4326)) + (0.0002)::double precision))::text) || '&top='::text) || ((public.st_y(public.st_transform(p.ruiangeom, 4326)) + (0.0002)::double precision))::text) || '&bottom='::text) || ((public.st_y(public.st_transform(p.ruiangeom, 4326)) - (0.0002)::double precision))::text) AS josm,
    w.kod,
    w.id,
    w.distance,
    p.cislo_popisne,
    o.conscriptionnumber,
    p.cislo_evidencni,
    o.provisionalnumber,
    p.cislo_orientacni,
    o.streetnumber,
    p.ulice,
    o.street,
    p.cast_obce,
    o.place,
    p.obec,
    o.city,
    w.co
   FROM ((morewarnings w
     LEFT JOIN parovane_geom p ON ((w.kod = p.kod)))
     LEFT JOIN import.osm_adresy o ON (((w.id = o.id) AND (o.co = 'node'::import.co))))
  ORDER BY w.distance;


ALTER TABLE morewarnings_view OWNER TO import0;

--
-- Name: morewarnings_view; Type: ACL; Schema: import0; Owner: import0
--

REVOKE ALL ON TABLE morewarnings_view FROM PUBLIC;
REVOKE ALL ON TABLE morewarnings_view FROM import0;
GRANT ALL ON TABLE morewarnings_view TO import0;
GRANT SELECT ON TABLE morewarnings_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

