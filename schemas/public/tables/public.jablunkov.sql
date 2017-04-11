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

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: jablunkov; Type: TABLE; Schema: public; Owner: pedro
--

CREATE TABLE jablunkov (
    kod integer,
    nespravny boolean,
    identifikacni_parcela_id bigint,
    momc_kod integer,
    cobce_kod integer,
    budova_id bigint,
    cisla_domovni integer[],
    dokonceni date,
    je_vytah_kod integer,
    zmena_grafiky boolean,
    druh_konstrukce_kod integer,
    zmena_detailu boolean,
    obestaveny_prostor integer,
    pocet_bytu integer,
    pocet_podlazi integer,
    podlahova_plocha integer,
    pripoj_el_energie boolean,
    pripoj_kanal_sit_kod integer,
    pripoj_plyn_kod integer,
    pripoj_vodovod_kod integer,
    typ_kod integer,
    zastavena_plocha integer,
    zpusob_vytapeni_kod integer,
    zpusob_vyuziti_kod integer,
    id_trans_ruian bigint,
    plati_od date,
    nz_id_globalni bigint,
    definicni_bod geometry,
    hranice geometry,
    item_timestamp timestamp without time zone,
    deleted boolean
);


ALTER TABLE jablunkov OWNER TO pedro;

--
-- Name: jablunkov; Type: ACL; Schema: public; Owner: pedro
--

GRANT SELECT ON TABLE jablunkov TO PUBLIC;


--
-- PostgreSQL database dump complete
--

