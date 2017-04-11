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

SET search_path = ruian, pg_catalog;

SET default_tablespace = '';

--
-- Name: dkm_rss_view; Type: MATERIALIZED VIEW; Schema: ruian; Owner: ruian
--

CREATE MATERIALIZED VIEW dkm_rss_view AS
 SELECT DISTINCT ON (dkm.datum, dkm.id, dkm.kod, ku.nazev, obec.nazev, okres.nazev, ref.relation_id) dkm.datum,
    dkm.kod,
    ku.nazev,
    obec.nazev AS obec,
    okres.nazev AS okres,
    dkm.datum AS plati_od,
    ref.relation_id AS relation,
    dkm.id
   FROM (((((dkm dkm
     LEFT JOIN rn_katastralni_uzemi ku ON ((dkm.kod = ku.kod)))
     LEFT JOIN rn_obec obec ON ((obec.kod = ku.obec_kod)))
     LEFT JOIN rn_okres okres ON ((obec.okres_kod = okres.kod)))
     LEFT JOIN osm.current_relation_tags ref ON ((((ref.k)::text = 'ref'::text) AND ((ref.v)::text = (ku.kod)::text))))
     LEFT JOIN osm.current_relation_tags adminlevel ON ((((adminlevel.k)::text = 'admin_level'::text) AND ((adminlevel.v)::text = '10'::text) AND (adminlevel.relation_id = ref.relation_id))))
  WHERE (dkm.ma_dkm AND (dkm.datum IS NOT NULL) AND (NOT ku.deleted) AND (NOT obec.deleted) AND (NOT okres.deleted))
  ORDER BY dkm.datum DESC
 LIMIT 250
  WITH NO DATA;


ALTER TABLE dkm_rss_view OWNER TO ruian;

--
-- Name: dkm_rss_view_idx; Type: INDEX; Schema: ruian; Owner: ruian
--

CREATE UNIQUE INDEX dkm_rss_view_idx ON dkm_rss_view USING btree (id);


--
-- Name: dkm_rss_view; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE dkm_rss_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

