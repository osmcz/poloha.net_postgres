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
-- Data for Name: zpusob_vyuziti_pozemku; Type: TABLE DATA; Schema: osmtables; Owner: marian
--

COPY zpusob_vyuziti_pozemku (kod, nazev, platnost_od, platnost_do, typppd_kod, zkratka, osmtag_v, osmtag_k) FROM stdin;
1	skleník, paøeni¹tì	1993-01-01	\N	\N	skleník-paøeni¹.	\N	\N
2	¹kolka	1993-01-01	\N	\N	¹kolka	\N	\N
3	plantá¾ døevin	1998-10-15	\N	\N	plantá¾ døevin	\N	\N
4	les jiný ne¾ hospodáøský	1993-01-01	\N	\N	les(ne hospodáø)	\N	\N
5	lesní pozemek, na kterém je budova	1993-01-01	\N	\N	les s budovou	\N	\N
6	rybník	1993-01-01	\N	803	rybník	\N	\N
7	koryto vodního toku pøirozené nebo upravené	1993-01-01	\N	802	tok pøirozený	\N	\N
8	koryto vodního toku umìlé	1993-01-01	\N	802	tok umìlý	\N	\N
9	vodní nádr¾ pøírodní	1993-01-01	\N	803	nádr¾ pøírodní	\N	\N
10	vodní nádr¾ umìlá	1993-01-01	\N	803	nádr¾ umìlá	\N	\N
11	zamokøená plocha	1993-01-01	\N	804	zamokøená pl.	\N	\N
12	spoleèný dvùr	1993-01-01	\N	319	spoleèný dvùr	\N	\N
13	zboøeni¹tì	1993-01-01	\N	319	zboøeni¹tì	\N	\N
14	dráha	1993-01-01	\N	\N	dráha	\N	\N
15	dálnice	1993-01-01	\N	\N	dálnice	\N	\N
16	silnice	1993-01-01	\N	\N	silnice	\N	\N
17	ostatní komunikace	1993-01-01	\N	\N	ostat.komunikace	\N	\N
18	ostatní dopravní plocha	1993-01-01	\N	\N	ost.dopravní pl.	\N	\N
19	zeleò	1993-01-01	\N	314	zeleò	\N	\N
20	sportovi¹tì a rekreaèní plocha	1993-01-01	\N	\N	sport.a rekr.pl.	\N	\N
21	høbitov, urnový háj	1993-01-01	\N	315	høbitov-urn.háj	\N	\N
22	kulturní a osvìtová plocha	1993-01-01	\N	\N	kult.a osvìt.pl.	\N	\N
23	manipulaèní plocha	1993-01-01	\N	\N	manipulaèní pl.	\N	\N
24	dobývací prostor	1993-01-01	\N	701	dobývací prost.	\N	\N
25	skládka	1993-01-01	\N	\N	skládka	\N	\N
26	jiná plocha	1993-01-01	\N	\N	jiná plocha	\N	\N
27	neplodná pùda	1993-01-01	\N	316	neplodná pùda	\N	\N
28	vodní plocha, na které je budova	2007-03-01	\N	\N	vod.pl.s budovou	\N	\N
29	fotovoltaická elektrárna	2014-01-01	\N	\N	foto. elektrárna	\N	\N
\.


--
-- PostgreSQL database dump complete
--

