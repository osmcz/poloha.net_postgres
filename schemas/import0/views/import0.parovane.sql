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
-- Name: parovane; Type: VIEW; Schema: import0; Owner: import0
--

CREATE VIEW parovane AS
 SELECT ((('http://ruian.poloha.net/20/'::text || (public.st_y(public.st_transform(r.geom, 4326)))::text) || '/'::text) || (public.st_x(public.st_transform(r.geom, 4326)))::text) AS url,
    ((((((('http://localhost:8111/zoom?left='::text || ((public.st_x(public.st_transform(r.geom, 4326)) - (0.0002)::double precision))::text) || '&right='::text) || ((public.st_x(public.st_transform(r.geom, 4326)) + (0.0002)::double precision))::text) || '&top='::text) || ((public.st_y(public.st_transform(r.geom, 4326)) + (0.0002)::double precision))::text) || '&bottom='::text) || ((public.st_y(public.st_transform(r.geom, 4326)) - (0.0002)::double precision))::text) AS josm,
    r.id AS kod,
    r.cislo_popisne,
    r.cislo_evidencni,
    r.cislo_orientacni,
    r.ulice,
    r.cast_obce,
    r.obec,
    r.okres,
    r.psc,
    o.id,
    o.co,
    o.conscriptionnumber,
    o.provisionalnumber,
    o.streetnumber,
    o.housenumber,
    o.street,
    o.place,
    o.is_in,
    import.distance_meters(r.geom, o.geom) AS distance,
    par.level,
    par.autocreate,
    par.naceste
   FROM ((ruian_osm par
     LEFT JOIN import.ruian_adresy_view r ON ((par.ruianid = r.id)))
     LEFT JOIN import.osm_adresy o ON (((par.osmid = o.id) AND (par.co = o.co))));


ALTER TABLE parovane OWNER TO import0;

--
-- Name: parovane; Type: ACL; Schema: import0; Owner: import0
--

REVOKE ALL ON TABLE parovane FROM PUBLIC;
REVOKE ALL ON TABLE parovane FROM import0;
GRANT ALL ON TABLE parovane TO import0;
GRANT SELECT ON TABLE parovane TO PUBLIC;


--
-- PostgreSQL database dump complete
--

