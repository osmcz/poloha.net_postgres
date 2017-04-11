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

SET search_path = gis, pg_catalog;

SET default_tablespace = '';

--
-- Name: rozbite_relace; Type: MATERIALIZED VIEW; Schema: gis; Owner: mapnik
--

CREATE MATERIALIZED VIEW rozbite_relace AS
 SELECT f.relation_id,
    f.valid,
    o.nazev AS okres
   FROM (( SELECT (- cz_line.osm_id) AS relation_id,
            (public.st_geometrytype(public.st_linemerge(public.st_collect(cz_line.way))) = 'ST_LineString'::text) AS valid,
            public.st_linemerge(public.st_collect(cz_line.way)) AS way
           FROM cz_line
          WHERE ((cz_line.osm_id < 0) AND ((cz_line.route = 'hiking'::text) OR (cz_line.route = 'foot'::text)))
          GROUP BY cz_line.osm_id) f
     LEFT JOIN ruian.rn_okres o ON (public.st_intersects(o.hranice, f.way)))
  WITH NO DATA;


ALTER TABLE rozbite_relace OWNER TO mapnik;

--
-- Name: rozbite_relace_idx; Type: INDEX; Schema: gis; Owner: mapnik
--

CREATE UNIQUE INDEX rozbite_relace_idx ON rozbite_relace USING btree (relation_id, okres);


--
-- Name: rozbite_relace; Type: ACL; Schema: gis; Owner: mapnik
--

GRANT SELECT ON TABLE rozbite_relace TO PUBLIC;


--
-- PostgreSQL database dump complete
--

