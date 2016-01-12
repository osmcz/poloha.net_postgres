--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ruian, pg_catalog;

--
-- Name: ruian_stats_full; Type: VIEW; Schema: ruian; Owner: ruian
--

CREATE VIEW ruian_stats_full AS
 SELECT t.table_name,
    count(*) AS total,
    count(t.definicni_bod) AS bod,
    count(t.cary) AS cary,
    count(
        CASE
            WHEN ((t.cary IS NULL) OR public.st_isvalid(public.st_curvetoline(t.cary))) THEN NULL::boolean
            ELSE true
        END) AS invalid_cary,
    ((count(t.definicni_bod) * 100) / count(*)) AS p_bod,
    ((count(t.cary) * 100) / count(*)) AS p_cary
   FROM ( SELECT 'rn_adresni_misto'::text AS table_name,
            rn_adresni_misto.definicni_bod,
            NULL::public.geometry AS cary
           FROM rn_adresni_misto
          WHERE (rn_adresni_misto.deleted = false)
        UNION ALL
         SELECT 'rn_cast_obce'::text AS text,
            rn_cast_obce.definicni_bod,
            rn_cast_obce.hranice
           FROM rn_cast_obce
          WHERE (rn_cast_obce.deleted = false)
        UNION ALL
         SELECT 'rn_katastralni_uzemi'::text AS text,
            rn_katastralni_uzemi.definicni_bod,
            rn_katastralni_uzemi.hranice
           FROM rn_katastralni_uzemi
          WHERE (rn_katastralni_uzemi.deleted = false)
        UNION ALL
         SELECT 'rn_kraj_1960'::text AS text,
            rn_kraj_1960.definicni_bod,
            rn_kraj_1960.hranice
           FROM rn_kraj_1960
          WHERE (rn_kraj_1960.deleted = false)
        UNION ALL
         SELECT 'rn_momc'::text AS text,
            rn_momc.definicni_bod,
            rn_momc.hranice
           FROM rn_momc
          WHERE (rn_momc.deleted = false)
        UNION ALL
         SELECT 'rn_mop'::text AS text,
            rn_mop.definicni_bod,
            rn_mop.hranice
           FROM rn_mop
          WHERE (rn_mop.deleted = false)
        UNION ALL
         SELECT 'rn_obec'::text AS text,
            rn_obec.definicni_bod,
            rn_obec.hranice
           FROM rn_obec
          WHERE (rn_obec.deleted = false)
        UNION ALL
         SELECT 'rn_okres'::text AS text,
            rn_okres.definicni_bod,
            rn_okres.hranice
           FROM rn_okres
          WHERE (rn_okres.deleted = false)
        UNION ALL
         SELECT 'rn_orp'::text AS text,
            rn_orp.definicni_bod,
            rn_orp.hranice
           FROM rn_orp
          WHERE (rn_orp.deleted = false)
        UNION ALL
         SELECT 'rn_parcela'::text AS text,
            rn_parcela.definicni_bod,
            rn_parcela.hranice
           FROM rn_parcela
          WHERE (rn_parcela.deleted = false)
        UNION ALL
         SELECT 'rn_pou'::text AS text,
            rn_pou.definicni_bod,
            rn_pou.hranice
           FROM rn_pou
          WHERE (rn_pou.deleted = false)
        UNION ALL
         SELECT 'rn_region_soudrznosti'::text AS text,
            rn_region_soudrznosti.definicni_bod,
            rn_region_soudrznosti.hranice
           FROM rn_region_soudrznosti
          WHERE (rn_region_soudrznosti.deleted = false)
        UNION ALL
         SELECT 'rn_spravni_obvod'::text AS text,
            rn_spravni_obvod.definicni_bod,
            rn_spravni_obvod.hranice
           FROM rn_spravni_obvod
          WHERE (rn_spravni_obvod.deleted = false)
        UNION ALL
         SELECT 'rn_stat'::text AS text,
            rn_stat.definicni_bod,
            rn_stat.hranice
           FROM rn_stat
          WHERE (rn_stat.deleted = false)
        UNION ALL
         SELECT 'rn_stavebni_objekt'::text AS text,
            rn_stavebni_objekt.definicni_bod,
            rn_stavebni_objekt.hranice
           FROM rn_stavebni_objekt
          WHERE (rn_stavebni_objekt.deleted = false)
        UNION ALL
         SELECT 'rn_ulice'::text AS text,
            NULL::public.geometry AS geometry,
            rn_ulice.definicni_cara
           FROM rn_ulice
          WHERE (rn_ulice.deleted = false)
        UNION ALL
         SELECT 'rn_vusc'::text AS text,
            rn_vusc.definicni_bod,
            rn_vusc.hranice
           FROM rn_vusc
          WHERE (rn_vusc.deleted = false)
        UNION ALL
         SELECT 'rn_zsj'::text AS text,
            rn_zsj.definicni_bod,
            rn_zsj.hranice
           FROM rn_zsj
          WHERE (rn_zsj.deleted = false)) t
  GROUP BY t.table_name
  ORDER BY t.table_name;


ALTER TABLE ruian_stats_full OWNER TO ruian;

--
-- Name: ruian_stats_full; Type: ACL; Schema: ruian; Owner: ruian
--

REVOKE ALL ON TABLE ruian_stats_full FROM PUBLIC;
REVOKE ALL ON TABLE ruian_stats_full FROM ruian;
GRANT ALL ON TABLE ruian_stats_full TO ruian;
GRANT SELECT ON TABLE ruian_stats_full TO PUBLIC;


--
-- PostgreSQL database dump complete
--

