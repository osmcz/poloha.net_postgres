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
-- Data for Name: zpusoby_vyuziti_parcel; Type: TABLE DATA; Schema: osmtables; Owner: pedro
--

COPY zpusoby_vyuziti_parcel (kod, druh_pozemku_kod, zpusob_vyu_poz_kod, nazev, tagy, color, opacity, usable) FROM stdin;
1	14	15	Dálnice	"landuse"=>"highway"	#C0C0FF	0.649999976	t
2	7	24	Dobývací prostor	"landuse"=>"quarry"	#4E3B57	0.649999976	t
2	14	24	Dobývací prostor	"landuse"=>"quarry"	#4E3B57	0.649999976	t
2	4	24	Dobývací prostor	"landuse"=>"quarry"	#4E3B57	0.649999976	t
4	14	21	Høbitov, urnový háj	"landuse"=>"cemetery"	#008000	0.649999976	t
7	14	22	Kulturní a osvìtová plocha	\N	#02E697	0.649999976	t
8	10	24	Les	"landuse"=>"forest"	#00BD00	0.649999976	t
8	10	5	Les	"landuse"=>"forest"	#00BD00	0.649999976	t
8	10	\N	Les	"landuse"=>"forest"	#00BD00	0.649999976	t
8	10	3	Les	"landuse"=>"forest"	#00BD00	0.649999976	t
13	14	11	Mokøina	"natural"=>"wetland"	#4F5E9A	0.649999976	t
15	2	\N	Orná pùda	"landuse"=>"farmland"	#B48E70	0.649999976	t
15	2	24	Orná pùda	"landuse"=>"farmland"	#B48E70	0.649999976	t
17	14	17	Ostatní komunikace	\N	#ACACAC	0.649999976	t
18	6	\N	Ovocný sad	"landuse"=>"orchard"	#FD9C2C	0.649999976	t
20	14	20	Rekreaèní plocha a sportovi¹tì	"leisure"=>"recreation_ground"	#00B200	0.649999976	t
24	6	1	Skleníky, paøeni¹tì	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
24	4	1	Skleníky, paøeni¹tì	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
24	5	1	Skleníky, paøeni¹tì	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
24	2	1	Skleníky, paøeni¹tì	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
24	7	1	Skleníky, paøeni¹tì	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
28	4	\N	Vinice	"landuse"=>"vineyard"	#7E3ACA	0.649999976	t
33	14	19	Zeleò	"landuse"=>"village_green"	#5CAB5F	0.649999976	t
3	14	29	Fotovoltaická elektrárna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	#F0F000	0.649999976	t
3	2	29	Fotovoltaická elektrárna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	#F0F000	0.649999976	t
3	7	29	Fotovoltaická elektrárna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	#F0F000	0.649999976	t
5	3	\N	Chmelnice	"crop"=>"hop", "landuse"=>"farmland"	#9E9971	0.649999976	t
6	11	7	Koryto vodního toku	"landuse"=>"river"	#0B9EFF	0.649999976	t
6	11	8	Koryto vodního toku	"landuse"=>"river"	#0B9EFF	0.649999976	t
9	10	17	Lesní cesta	\N	#9D5A4E	0.649999976	t
10	10	20	Lesní rekreaèní plocha	"leisure"=>"recreation_ground"	#00EA00	0.649999976	t
11	10	2	Lesní ¹kolka	\N	#AAEA06	0.649999976	t
12	14	23	Manipulaèní plocha	\N	#C79EBD	0.649999976	t
13	11	11	Mokøina	"natural"=>"wetland"	#4F5E9A	0.649999976	t
14	14	27	Neplodná pùda	\N	#101010	0.649999976	t
16	14	18	Ostatní dopravní plocha	\N	#999999	0.649999976	t
19	7	3	Plantá¾ døevin	\N	#C56321	0.649999976	t
19	14	3	Plantá¾ døevin	\N	#C56321	0.649999976	t
19	6	3	Plantá¾ døevin	\N	#C56321	0.649999976	t
19	2	3	Plantá¾ døevin	\N	#C56321	0.649999976	t
21	11	6	Rybník	\N	#085FEA	0.649999976	t
22	14	16	Silnice	\N	#AEAEAE	0.649999976	t
23	14	25	Skládka	\N	#333333	0.649999976	t
24	10	1	Skleníky, paøeni¹tì	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
25	13	12	Spoleèný dvùr	\N	#A78C4B	0.649999976	t
26	6	2	©kolka mimo lesní	"landuse"=>"plant_nursery"	#C96D8C	0.649999976	t
26	2	2	©kolka mimo lesní	"landuse"=>"plant_nursery"	#C96D8C	0.649999976	t
26	5	2	©kolka mimo lesní	"landuse"=>"plant_nursery"	#C96D8C	0.649999976	t
26	7	2	©kolka mimo lesní	"landuse"=>"plant_nursery"	#C96D8C	0.649999976	t
27	7	\N	Travní porosty	"landuse"=>"grass"	#A1CF8C	0.649999976	t
29	11	10	Vodní plocha	"landuse"=>"reservoir"	#5BA1CD	0.649999976	t
29	11	28	Vodní plocha	"landuse"=>"reservoir"	#5BA1CD	0.649999976	t
29	11	\N	Vodní plocha	"landuse"=>"reservoir"	#5BA1CD	0.649999976	t
29	11	9	Vodní plocha	"landuse"=>"reservoir"	#5BA1CD	0.649999976	t
30	5	3	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	#98FF11	0.649999976	t
30	5	\N	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	#98FF11	0.649999976	t
30	5	24	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	#98FF11	0.649999976	t
31	13	\N	Zastavìná plocha	"building"=>"yes"	#674D3E	0.649999976	t
32	13	13	Zboøeni¹tì	"landuse"=>"brownfield"	#496741	0.649999976	t
34	14	14	®eleznice	"landuse"=>"railway"	#6B79AB	0.649999976	t
35	10	4	Les (prales?)	"natural"=>"wood"	#004000	0.649999976	t
1001	14	26	ostatní plocha | jiná plocha	\N	\N	\N	f
1002	14	\N	Ostatní plocha	\N	\N	\N	f
\.


--
-- Name: zpusoby_vyuziti_parcel_id_seq; Type: SEQUENCE SET; Schema: osmtables; Owner: pedro
--

SELECT pg_catalog.setval('zpusoby_vyuziti_parcel_id_seq', 60, true);


--
-- PostgreSQL database dump complete
--

