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
13	14	11	Mok�ina	"natural"=>"wetland"	\N	\N	t
20	14	20	Rekrea�n� plocha a sportovi�t�	"leisure"=>"recreation_ground"	\N	\N	t
33	14	19	Zele�	"landuse"=>"village_green"	\N	\N	t
7	14	22	Kulturn� a osv�tov� plocha	\N	\N	\N	t
8	10	24	Les	"landuse"=>"forest"	\N	\N	t
18	6	\N	Ovocn� sad	"landuse"=>"orchard"	\N	\N	t
8	10	5	Les	"landuse"=>"forest"	\N	\N	t
17	14	17	Ostatn� komunikace	\N	\N	\N	t
8	10	\N	Les	"landuse"=>"forest"	\N	\N	t
8	10	3	Les	"landuse"=>"forest"	\N	\N	t
15	2	\N	Orn� p�da	"landuse"=>"farmland"	\N	\N	t
15	2	24	Orn� p�da	"landuse"=>"farmland"	\N	\N	t
28	4	\N	Vinice	"landuse"=>"vineyard"	\N	\N	t
24	6	1	Sklen�ky, pa�eni�t�	"landuse"=>"greenhouse_horticulture"	\N	\N	t
24	4	1	Sklen�ky, pa�eni�t�	"landuse"=>"greenhouse_horticulture"	\N	\N	t
24	5	1	Sklen�ky, pa�eni�t�	"landuse"=>"greenhouse_horticulture"	\N	\N	t
24	2	1	Sklen�ky, pa�eni�t�	"landuse"=>"greenhouse_horticulture"	\N	\N	t
24	7	1	Sklen�ky, pa�eni�t�	"landuse"=>"greenhouse_horticulture"	\N	\N	t
2	7	24	Dob�vac� prostor	"landuse"=>"quarry"	\N	\N	t
2	14	24	Dob�vac� prostor	"landuse"=>"quarry"	\N	\N	t
2	4	24	Dob�vac� prostor	"landuse"=>"quarry"	\N	\N	t
4	14	21	H�bitov, urnov� h�j	"landuse"=>"cemetery"	\N	\N	t
3	14	29	Fotovoltaick� elektr�rna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	\N	\N	t
1	14	15	D�lnice	"landuse"=>"highway"	\N	\N	t
6	11	7	Koryto vodn�ho toku	"landuse"=>"river"	\N	\N	t
6	11	8	Koryto vodn�ho toku	"landuse"=>"river"	\N	\N	t
10	10	20	Lesn� rekrea�n� plocha	"leisure"=>"recreation_ground"	\N	\N	t
26	6	2	�kolka mimo lesn�	"landuse"=>"plant_nursery"	\N	\N	t
26	2	2	�kolka mimo lesn�	"landuse"=>"plant_nursery"	\N	\N	t
26	5	2	�kolka mimo lesn�	"landuse"=>"plant_nursery"	\N	\N	t
26	7	2	�kolka mimo lesn�	"landuse"=>"plant_nursery"	\N	\N	t
29	11	10	Vodn� plocha	"landuse"=>"reservoir"	\N	\N	t
29	11	28	Vodn� plocha	"landuse"=>"reservoir"	\N	\N	t
29	11	\N	Vodn� plocha	"landuse"=>"reservoir"	\N	\N	t
29	11	9	Vodn� plocha	"landuse"=>"reservoir"	\N	\N	t
30	5	3	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	\N	\N	t
30	5	\N	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	\N	\N	t
30	5	24	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	\N	\N	t
35	10	4	Les (prales?)	"natural"=>"wood"	\N	\N	t
13	11	11	Mok�ina	"natural"=>"wetland"	\N	\N	t
12	14	23	Manipula�n� plocha	\N	\N	\N	t
14	14	27	Neplodn� p�da	\N	\N	\N	t
16	14	18	Ostatn� dopravn� plocha	\N	\N	\N	t
19	7	3	Plant� d�evin	\N	\N	\N	t
19	14	3	Plant� d�evin	\N	\N	\N	t
19	6	3	Plant� d�evin	\N	\N	\N	t
21	11	6	Rybn�k	\N	\N	\N	t
22	14	16	Silnice	\N	\N	\N	t
23	14	25	Skl�dka	\N	\N	\N	t
1001	14	26	ostatn� plocha | jin� plocha	\N	\N	\N	f
1002	14	\N	Ostatn� plocha	\N	\N	\N	f
9	10	17	Lesn� cesta	\N	\N	\N	t
11	10	2	Lesn� �kolka	\N	\N	\N	t
19	2	3	Plant� d�evin	\N	\N	\N	t
25	13	12	Spole�n� dv�r	\N	\N	\N	t
31	13	\N	Zastav�n� plocha	"building"=>"yes"	\N	\N	t
5	3	\N	Chmelnice	"crop"=>"hop", "landuse"=>"farmland"	\N	\N	t
34	14	14	�eleznice	"landuse"=>"railway"	\N	\N	t
32	13	13	Zbo�eni�t�	"landuse"=>"brownfield"	\N	\N	t
27	7	\N	Travn� porosty	"landuse"=>"grass"	\N	\N	t
3	2	29	Fotovoltaick� elektr�rna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	\N	\N	t
3	7	29	Fotovoltaick� elektr�rna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	\N	\N	t
\.


--
-- Name: zpusoby_vyuziti_parcel_id_seq; Type: SEQUENCE SET; Schema: osmtables; Owner: pedro
--

SELECT pg_catalog.setval('zpusoby_vyuziti_parcel_id_seq', 60, true);


--
-- PostgreSQL database dump complete
--

