--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osmtables, pg_catalog;

--
-- Data for Name: zpusoby_vyuziti_parcel; Type: TABLE DATA; Schema: osmtables; Owner: pedro
--

COPY zpusoby_vyuziti_parcel (kod, druh_pozemku_kod, zpusob_vyu_poz_kod, nazev, tagy, color, opacity, usable) FROM stdin;
13	14	11	Mokøina	"natural"=>"wetland"	\N	\N	t
20	14	20	Rekreaèní plocha a sportovi¹tì	"leisure"=>"recreation_ground"	\N	\N	t
33	14	19	Zeleò	"landuse"=>"village_green"	\N	\N	t
7	14	22	Kulturní a osvìtová plocha	\N	\N	\N	t
8	10	24	Les	"landuse"=>"forest"	\N	\N	t
18	6	\N	Ovocný sad	"landuse"=>"orchard"	\N	\N	t
8	10	5	Les	"landuse"=>"forest"	\N	\N	t
17	14	17	Ostatní komunikace	\N	\N	\N	t
8	10	\N	Les	"landuse"=>"forest"	\N	\N	t
8	10	3	Les	"landuse"=>"forest"	\N	\N	t
15	2	\N	Orná pùda	"landuse"=>"farmland"	\N	\N	t
15	2	24	Orná pùda	"landuse"=>"farmland"	\N	\N	t
28	4	\N	Vinice	"landuse"=>"vineyard"	\N	\N	t
24	6	1	Skleníky, paøeni¹tì	"landuse"=>"greenhouse_horticulture"	\N	\N	t
24	4	1	Skleníky, paøeni¹tì	"landuse"=>"greenhouse_horticulture"	\N	\N	t
24	5	1	Skleníky, paøeni¹tì	"landuse"=>"greenhouse_horticulture"	\N	\N	t
24	2	1	Skleníky, paøeni¹tì	"landuse"=>"greenhouse_horticulture"	\N	\N	t
24	7	1	Skleníky, paøeni¹tì	"landuse"=>"greenhouse_horticulture"	\N	\N	t
2	7	24	Dobývací prostor	"landuse"=>"quarry"	\N	\N	t
2	14	24	Dobývací prostor	"landuse"=>"quarry"	\N	\N	t
2	4	24	Dobývací prostor	"landuse"=>"quarry"	\N	\N	t
4	14	21	Høbitov, urnový háj	"landuse"=>"cemetery"	\N	\N	t
3	14	29	Fotovoltaická elektrárna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	\N	\N	t
1	14	15	Dálnice	"landuse"=>"highway"	\N	\N	t
6	11	7	Koryto vodního toku	"landuse"=>"river"	\N	\N	t
6	11	8	Koryto vodního toku	"landuse"=>"river"	\N	\N	t
10	10	20	Lesní rekreaèní plocha	"leisure"=>"recreation_ground"	\N	\N	t
26	6	2	©kolka mimo lesní	"landuse"=>"plant_nursery"	\N	\N	t
26	2	2	©kolka mimo lesní	"landuse"=>"plant_nursery"	\N	\N	t
26	5	2	©kolka mimo lesní	"landuse"=>"plant_nursery"	\N	\N	t
26	7	2	©kolka mimo lesní	"landuse"=>"plant_nursery"	\N	\N	t
29	11	10	Vodní plocha	"landuse"=>"reservoir"	\N	\N	t
29	11	28	Vodní plocha	"landuse"=>"reservoir"	\N	\N	t
29	11	\N	Vodní plocha	"landuse"=>"reservoir"	\N	\N	t
29	11	9	Vodní plocha	"landuse"=>"reservoir"	\N	\N	t
30	5	3	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	\N	\N	t
30	5	\N	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	\N	\N	t
30	5	24	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	\N	\N	t
35	10	4	Les (prales?)	"natural"=>"wood"	\N	\N	t
13	11	11	Mokøina	"natural"=>"wetland"	\N	\N	t
12	14	23	Manipulaèní plocha	\N	\N	\N	t
14	14	27	Neplodná pùda	\N	\N	\N	t
16	14	18	Ostatní dopravní plocha	\N	\N	\N	t
19	7	3	Plantá¾ døevin	\N	\N	\N	t
19	14	3	Plantá¾ døevin	\N	\N	\N	t
19	6	3	Plantá¾ døevin	\N	\N	\N	t
21	11	6	Rybník	\N	\N	\N	t
22	14	16	Silnice	\N	\N	\N	t
23	14	25	Skládka	\N	\N	\N	t
1001	14	26	ostatní plocha | jiná plocha	\N	\N	\N	f
1002	14	\N	Ostatní plocha	\N	\N	\N	f
9	10	17	Lesní cesta	\N	\N	\N	t
11	10	2	Lesní ¹kolka	\N	\N	\N	t
19	2	3	Plantá¾ døevin	\N	\N	\N	t
25	13	12	Spoleèný dvùr	\N	\N	\N	t
31	13	\N	Zastavìná plocha	"building"=>"yes"	\N	\N	t
5	3	\N	Chmelnice	"crop"=>"hop", "landuse"=>"farmland"	\N	\N	t
34	14	14	®eleznice	"landuse"=>"railway"	\N	\N	t
32	13	13	Zboøeni¹tì	"landuse"=>"brownfield"	\N	\N	t
27	7	\N	Travní porosty	"landuse"=>"grass"	\N	\N	t
3	2	29	Fotovoltaická elektrárna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	\N	\N	t
3	7	29	Fotovoltaická elektrárna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	\N	\N	t
\.


--
-- Name: zpusoby_vyuziti_parcel_id_seq; Type: SEQUENCE SET; Schema: osmtables; Owner: pedro
--

SELECT pg_catalog.setval('zpusoby_vyuziti_parcel_id_seq', 60, true);


--
-- PostgreSQL database dump complete
--

