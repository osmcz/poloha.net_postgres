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

SET search_path = osmtables, pg_catalog;

--
-- Data for Name: itags_osmadresy; Type: TABLE DATA; Schema: osmtables; Owner: pedro
--

COPY itags_osmadresy (tag) FROM stdin;
addr:conscriptionnumber
addr:provisionalnumber
addr:streetnumber
addr:housenumber
addr:street
addr:place
addr:suburb
addr:city
addr:postcode
addr:country
is_in
source
source:addr
source:position
ref:ruian
ref:ruian:addr
addr:alternatenumber
addr:provisional
source:loc
addr:borough
uir_adr:ADRESA_KOD
\.


--
-- PostgreSQL database dump complete
--

