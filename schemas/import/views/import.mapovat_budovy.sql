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

SET default_tablespace = '';

--
-- Name: mapovat_budovy; Type: MATERIALIZED VIEW; Schema: import; Owner: mapnik
--

CREATE MATERIALIZED VIEW mapovat_budovy AS
 SELECT foo2.buildings,
    foo2.mapped,
    (foo2.buildings - foo2.mapped) AS todo,
    (((foo2.mapped)::real / (foo2.buildings)::real) * (100)::double precision) AS procent,
    ref.relation_id,
    ku.nazev,
    ku.ma_dkm,
    ku.kod
   FROM (((( SELECT sum(1) AS buildings,
            sum(
                CASE
                    WHEN foo.mapped THEN 1
                    ELSE 0
                END) AS mapped,
            parcela.katuz_kod
           FROM (( SELECT DISTINCT ON (so.kod) so.kod,
                    so.identifikacni_parcela_id,
                    (todo.kod IS NULL) AS mapped
                   FROM (ruian.rn_stavebni_objekt so
                     LEFT JOIN ruian.buildings_todo todo ON ((so.kod = todo.kod)))
                  WHERE ((so.hranice IS NOT NULL) AND (NOT so.deleted))) foo
             LEFT JOIN ruian.rn_parcela parcela ON ((parcela.id = foo.identifikacni_parcela_id)))
          GROUP BY parcela.katuz_kod) foo2
     LEFT JOIN ruian.rn_katastralni_uzemi ku ON ((ku.kod = foo2.katuz_kod)))
     LEFT JOIN osm.current_relation_tags ref ON ((((ref.k)::text = 'ref'::text) AND ((ref.v)::text = (foo2.katuz_kod)::text))))
     LEFT JOIN osm.current_relation_tags adminlevel ON ((((adminlevel.k)::text = 'admin_level'::text) AND ((adminlevel.v)::text = '10'::text) AND (adminlevel.relation_id = ref.relation_id))))
  WITH NO DATA;


ALTER TABLE mapovat_budovy OWNER TO mapnik;

--
-- Name: mapovat_budovy; Type: ACL; Schema: import; Owner: mapnik
--

GRANT SELECT ON TABLE mapovat_budovy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

