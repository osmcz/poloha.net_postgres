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
-- Name: duchove; Type: VIEW; Schema: import; Owner: pedro
--

CREATE VIEW duchove AS
 SELECT okres.kod AS okres_kod,
    okres.nazev AS okres,
    o.kod AS obec_kod,
    o.nazev AS obec,
    co.kod AS cast_obce_kod,
    co.nazev AS cast_obce,
    d.pocet_celkem,
    d.pocet_duchove,
        CASE
            WHEN ((d.pocet_duchove IS NOT NULL) AND (d.pocet_duchove > 0) AND (d.pocet_duchove <> d.pocet_celkem) AND (d.pocet_celkem IS NOT NULL)) THEN (((d.pocet_duchove)::double precision / (d.pocet_celkem)::real) * (100)::double precision)
            ELSE NULL::double precision
        END AS procent
   FROM (((stat_duchove d
     LEFT JOIN ruian.rn_cast_obce co ON ((d.cobce_kod = co.kod)))
     LEFT JOIN ruian.rn_obec o ON ((co.obec_kod = o.kod)))
     LEFT JOIN ruian.rn_okres okres ON ((okres.kod = o.okres_kod)));


ALTER TABLE duchove OWNER TO pedro;

--
-- Name: duchove; Type: ACL; Schema: import; Owner: pedro
--

GRANT SELECT ON TABLE duchove TO PUBLIC;


--
-- PostgreSQL database dump complete
--

