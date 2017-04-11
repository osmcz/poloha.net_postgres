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
-- Data for Name: zpusob_vyuziti_objektu; Type: TABLE DATA; Schema: osmtables; Owner: pedro
--

COPY zpusob_vyuziti_objektu (kod, nazev, zkratka, osmtag_v, platnost_od, platnost_do, osmtag_k) FROM stdin;
8	stavba pro rodinnou rekreaci	rod.rekr	\N	1993-01-01	\N	\N
19	jiná stavba	jiná st.	\N	1993-01-01	\N	\N
20	víceúèelová stavba	víceúèel	\N	2007-03-01	\N	\N
29	stavba odkali¹tì	odkali¹.	\N	2007-01-01	\N	\N
11	stavba ubytovacího zaøízení	ubyt.zaø	hotel	1993-01-01	\N	building
7	rodinný dùm	rod.dùm	house	1993-01-01	\N	building
6	bytový dùm	byt.dùm	residential	1993-01-01	\N	building
3	objekt k bydlení	bydlení	residential	1993-01-01	\N	building
2	zemìdìlská usedlost	zem.used	farm_auxiliary	1993-01-01	\N	building
21	skleník	skleník	greenhouse	2007-03-01	\N	building
1	prùmyslový objekt	prùm.obj	industrial	1993-01-01	\N	building
10	stavba pro obchod	obchod	commercial	1993-01-01	\N	building
18	gará¾	gará¾	garage	1993-01-01	\N	building
5	objekt obèanské vybavenosti	obè.vyb	civic	1993-01-01	\N	building
4	objekt lesního hospodáøství	les.hosp	\N	1993-01-01	\N	\N
9	stavba pro shroma¾ïování vìt¹ího poètu osob	shroma¾.	civic	1993-01-01	\N	building
12	stavba pro výrobu a skladování	výroba	warehouse	1993-01-01	\N	building
13	zemìdìlská stavba	zem.stav	barn	1993-01-01	\N	building
14	stavba pro administrativu	adminis.	commercial	1993-01-01	\N	building
15	stavba obèanského vybavení	obè.vyb.	civic	1993-01-01	\N	building
16	stavba technického vybavení	tech.vyb	industrial	1993-01-01	\N	building
17	stavba pro dopravu	doprava	transportation	1993-01-01	\N	building
22	pøehrada	pøehrada	dam	2007-01-01	\N	waterway
23	hráz pøehrazující vodní tok nebo údolí	hráz pø.	dam	2007-01-01	\N	waterway
24	hráz k ochranì nemovitostí pøed zaplavením pøi povodni	hráz pod	wall	2007-01-01	\N	barrier
25	hráz ohrazující umìlou vodní nádr¾	hráz ohr	wall	2007-01-01	\N	barrier
26	jez	jez	weir	2007-01-01	\N	waterway
27	stavba k plaveb.úèelùm v korytech nebo na bøezích vod.tokù	plav.úè.	transportation	2007-01-01	\N	building
28	stavba k vyu¾ití vodní energie (vodní elektrárna)	vodní el	industrial	2007-01-01	\N	building
\.


--
-- PostgreSQL database dump complete
--

