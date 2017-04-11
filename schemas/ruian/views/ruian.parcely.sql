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

--
-- Name: parcely; Type: VIEW; Schema: ruian; Owner: ruian
--

CREATE VIEW parcely AS
 SELECT rn_parcela.hranice AS way,
    ((
        CASE
            WHEN (rn_parcela.kmenove_cislo IS NULL) THEN ''::text
            ELSE (rn_parcela.kmenove_cislo)::text
        END ||
        CASE
            WHEN ((rn_parcela.kmenove_cislo IS NOT NULL) AND (rn_parcela.poddeleni_cisla IS NOT NULL)) THEN '/'::text
            ELSE ''::text
        END) ||
        CASE
            WHEN (rn_parcela.poddeleni_cisla IS NULL) THEN ''::text
            ELSE (rn_parcela.poddeleni_cisla)::text
        END) AS cislo
   FROM rn_parcela
  WHERE (NOT rn_parcela.deleted);


ALTER TABLE parcely OWNER TO ruian;

--
-- Name: parcely; Type: ACL; Schema: ruian; Owner: ruian
--

GRANT SELECT ON TABLE parcely TO PUBLIC;


--
-- PostgreSQL database dump complete
--

