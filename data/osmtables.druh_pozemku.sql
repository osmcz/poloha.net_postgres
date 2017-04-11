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
-- Data for Name: druh_pozemku; Type: TABLE DATA; Schema: osmtables; Owner: marian
--

COPY druh_pozemku (kod, nazev, zemedelska_kultura, platnost_od, platnost_do, zkratka, typppd_kod, stavebni_parcela, povinna_ochrana_poz, povinny_zpusob_vyuz, osmtag_v, osmtag_k) FROM stdin;
2	orná pùda	a	1993-01-01	\N	orná pùda	\N	n	27	n	\N	\N
3	chmelnice	a	1993-01-01	\N	chmelnice	302	n	27	n	\N	\N
4	vinice	a	1993-01-01	\N	vinice	303	n	27	n	\N	\N
5	zahrada	a	1993-01-01	\N	zahrada	304	n	27	n	\N	\N
6	ovocný sad	a	1993-01-01	\N	ovoc. sad	305	n	27	n	\N	\N
7	trvalý travní porost	a	1993-01-01	\N	travní p.	306	n	27	n	\N	\N
8	trvalý travní porost	a	1993-01-01	2000-09-01	travní p.	307	n	27	n	\N	\N
10	lesní pozemek	n	1993-01-01	\N	lesní poz	308	n	26	n	\N	\N
11	vodní plocha	n	1993-01-01	\N	vodní pl.	\N	n	\N	a	\N	\N
13	zastavìná plocha a nádvoøí	n	1993-01-01	\N	zast. pl.	\N	a	\N	n	\N	\N
14	ostatní plocha	n	1993-01-01	\N	ostat.pl.	\N	n	\N	a	\N	\N
\.


--
-- PostgreSQL database dump complete
--

