--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import, pg_catalog;

SET default_tablespace = '';

--
-- Name: stats_all; Type: MATERIALIZED VIEW; Schema: import; Owner: import0; Tablespace: 
--

CREATE MATERIALIZED VIEW stats_all AS
 SELECT foo.okres,
    foo.okres_kod,
    foo.obec,
    foo.obec_kod,
    foo.cast_obce,
    foo.celkem,
    foo.importovano,
    round((((foo.importovano)::real / (foo.celkem)::real) * (100)::double precision)) AS procent,
    foo.zpracovavano,
    round((((foo.zpracovavano)::real / (foo.celkem)::real) * (100)::double precision)) AS zpracovavanoprocent,
    duch.pocet_celkem AS pocet_so,
    duch.pocet_duchove AS pocet_duchu,
        CASE
            WHEN (((duch.pocet_duchove IS NOT NULL) AND (duch.pocet_duchove > 0)) AND (duch.pocet_celkem IS NOT NULL)) THEN (round(((((duch.pocet_duchove)::real / (duch.pocet_celkem)::real) * (100)::real))::double precision))::integer
            ELSE NULL::integer
        END AS procent_duchu
   FROM (( SELECT count(*) AS celkem,
            count(u.id) AS importovano,
            r.okres,
            o.kod AS okres_kod,
            r.obec,
            r.kod_obce AS obec_kod,
            r.cast_obce,
            count(z.id) AS zpracovavano
           FROM (((ruian_adresy_mview r
             LEFT JOIN osmtables.uploaded_changeset u ON (((r.id = u.id) AND (u.datum >= r.item_timestamp))))
             LEFT JOIN osmtables.inprogress_changeset z ON ((r.id = z.id)))
             LEFT JOIN ruian.rn_okres o ON (((r.okres)::text = (o.nazev)::text)))
          WHERE (NOT o.deleted)
          GROUP BY r.okres, r.obec, r.cast_obce, o.kod, r.kod_obce) foo
     LEFT JOIN duchove duch ON (((foo.obec_kod = duch.obec_kod) AND ((foo.cast_obce)::text = (duch.cast_obce)::text))))
  ORDER BY foo.okres, foo.obec, foo.cast_obce
  WITH NO DATA;


ALTER TABLE stats_all OWNER TO import0;

--
-- Name: stats_all; Type: ACL; Schema: import; Owner: import0
--

REVOKE ALL ON TABLE stats_all FROM PUBLIC;
REVOKE ALL ON TABLE stats_all FROM import0;
GRANT ALL ON TABLE stats_all TO import0;
GRANT SELECT ON TABLE stats_all TO PUBLIC;


--
-- PostgreSQL database dump complete
--

