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
-- Name: mapovat_budovy_view; Type: VIEW; Schema: import; Owner: pedro
--

CREATE VIEW mapovat_budovy_view AS
 SELECT mapovat.buildings,
    mapovat.mapped,
    mapovat.todo,
    mapovat.procent,
    mapovat.relation_id,
    mapovat.nazev,
    okres.nazev AS okres,
    mapovat.kod,
    public.local_textgeom(ku.definicni_bod) AS local_textgeom,
    josm_link(ku.definicni_bod) AS josm
   FROM (((mapovat_budovy mapovat
     LEFT JOIN ruian.rn_katastralni_uzemi ku ON ((mapovat.kod = ku.kod)))
     LEFT JOIN ruian.rn_obec obec ON ((ku.obec_kod = obec.kod)))
     LEFT JOIN ruian.rn_okres okres ON ((obec.okres_kod = okres.kod)))
  WHERE ((mapovat.procent < (15)::double precision) AND mapovat.ma_dkm)
  ORDER BY mapovat.todo DESC;


ALTER TABLE mapovat_budovy_view OWNER TO pedro;

--
-- Name: mapovat_budovy_view; Type: ACL; Schema: import; Owner: pedro
--

GRANT SELECT ON TABLE mapovat_budovy_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

