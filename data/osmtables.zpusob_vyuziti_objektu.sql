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
19	jin� stavba	jin� st.	\N	1993-01-01	\N	\N
20	v�ce��elov� stavba	v�ce��el	\N	2007-03-01	\N	\N
29	stavba odkali�t�	odkali�.	\N	2007-01-01	\N	\N
11	stavba ubytovac�ho za��zen�	ubyt.za�	hotel	1993-01-01	\N	building
7	rodinn� d�m	rod.d�m	house	1993-01-01	\N	building
6	bytov� d�m	byt.d�m	residential	1993-01-01	\N	building
3	objekt k bydlen�	bydlen�	residential	1993-01-01	\N	building
2	zem�d�lsk� usedlost	zem.used	farm_auxiliary	1993-01-01	\N	building
21	sklen�k	sklen�k	greenhouse	2007-03-01	\N	building
1	pr�myslov� objekt	pr�m.obj	industrial	1993-01-01	\N	building
10	stavba pro obchod	obchod	commercial	1993-01-01	\N	building
18	gar�	gar�	garage	1993-01-01	\N	building
5	objekt ob�ansk� vybavenosti	ob�.vyb	civic	1993-01-01	\N	building
4	objekt lesn�ho hospod��stv�	les.hosp	\N	1993-01-01	\N	\N
9	stavba pro shroma��ov�n� v�t��ho po�tu osob	shroma�.	civic	1993-01-01	\N	building
12	stavba pro v�robu a skladov�n�	v�roba	warehouse	1993-01-01	\N	building
13	zem�d�lsk� stavba	zem.stav	barn	1993-01-01	\N	building
14	stavba pro administrativu	adminis.	commercial	1993-01-01	\N	building
15	stavba ob�ansk�ho vybaven�	ob�.vyb.	civic	1993-01-01	\N	building
16	stavba technick�ho vybaven�	tech.vyb	industrial	1993-01-01	\N	building
17	stavba pro dopravu	doprava	transportation	1993-01-01	\N	building
22	p�ehrada	p�ehrada	dam	2007-01-01	\N	waterway
23	hr�z p�ehrazuj�c� vodn� tok nebo �dol�	hr�z p�.	dam	2007-01-01	\N	waterway
24	hr�z k ochran� nemovitost� p�ed zaplaven�m p�i povodni	hr�z pod	wall	2007-01-01	\N	barrier
25	hr�z ohrazuj�c� um�lou vodn� n�dr�	hr�z ohr	wall	2007-01-01	\N	barrier
26	jez	jez	weir	2007-01-01	\N	waterway
27	stavba k plaveb.��el�m v korytech nebo na b�ez�ch vod.tok�	plav.��.	transportation	2007-01-01	\N	building
28	stavba k vyu�it� vodn� energie (vodn� elektr�rna)	vodn� el	industrial	2007-01-01	\N	building
\.


--
-- PostgreSQL database dump complete
--

