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
1	14	15	D�lnice	"landuse"=>"highway"	#C0C0FF	0.649999976	t
2	7	24	Dob�vac� prostor	"landuse"=>"quarry"	#4E3B57	0.649999976	t
2	14	24	Dob�vac� prostor	"landuse"=>"quarry"	#4E3B57	0.649999976	t
2	4	24	Dob�vac� prostor	"landuse"=>"quarry"	#4E3B57	0.649999976	t
4	14	21	H�bitov, urnov� h�j	"landuse"=>"cemetery"	#008000	0.649999976	t
7	14	22	Kulturn� a osv�tov� plocha	\N	#02E697	0.649999976	t
8	10	24	Les	"landuse"=>"forest"	#00BD00	0.649999976	t
8	10	5	Les	"landuse"=>"forest"	#00BD00	0.649999976	t
8	10	\N	Les	"landuse"=>"forest"	#00BD00	0.649999976	t
8	10	3	Les	"landuse"=>"forest"	#00BD00	0.649999976	t
13	14	11	Mok�ina	"natural"=>"wetland"	#4F5E9A	0.649999976	t
15	2	\N	Orn� p�da	"landuse"=>"farmland"	#B48E70	0.649999976	t
15	2	24	Orn� p�da	"landuse"=>"farmland"	#B48E70	0.649999976	t
17	14	17	Ostatn� komunikace	\N	#ACACAC	0.649999976	t
18	6	\N	Ovocn� sad	"landuse"=>"orchard"	#FD9C2C	0.649999976	t
20	14	20	Rekrea�n� plocha a sportovi�t�	"leisure"=>"recreation_ground"	#00B200	0.649999976	t
24	6	1	Sklen�ky, pa�eni�t�	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
24	4	1	Sklen�ky, pa�eni�t�	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
24	5	1	Sklen�ky, pa�eni�t�	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
24	2	1	Sklen�ky, pa�eni�t�	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
24	7	1	Sklen�ky, pa�eni�t�	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
28	4	\N	Vinice	"landuse"=>"vineyard"	#7E3ACA	0.649999976	t
33	14	19	Zele�	"landuse"=>"village_green"	#5CAB5F	0.649999976	t
3	14	29	Fotovoltaick� elektr�rna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	#F0F000	0.649999976	t
3	2	29	Fotovoltaick� elektr�rna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	#F0F000	0.649999976	t
3	7	29	Fotovoltaick� elektr�rna	"power"=>"generator", "landuse"=>"industrial", "generator:method"=>"photovoltaic", "generator:source"=>"solar", "generator:output:electricity"=>"yes"	#F0F000	0.649999976	t
5	3	\N	Chmelnice	"crop"=>"hop", "landuse"=>"farmland"	#9E9971	0.649999976	t
6	11	7	Koryto vodn�ho toku	"landuse"=>"river"	#0B9EFF	0.649999976	t
6	11	8	Koryto vodn�ho toku	"landuse"=>"river"	#0B9EFF	0.649999976	t
9	10	17	Lesn� cesta	\N	#9D5A4E	0.649999976	t
10	10	20	Lesn� rekrea�n� plocha	"leisure"=>"recreation_ground"	#00EA00	0.649999976	t
11	10	2	Lesn� �kolka	\N	#AAEA06	0.649999976	t
12	14	23	Manipula�n� plocha	\N	#C79EBD	0.649999976	t
13	11	11	Mok�ina	"natural"=>"wetland"	#4F5E9A	0.649999976	t
14	14	27	Neplodn� p�da	\N	#101010	0.649999976	t
16	14	18	Ostatn� dopravn� plocha	\N	#999999	0.649999976	t
19	7	3	Plant� d�evin	\N	#C56321	0.649999976	t
19	14	3	Plant� d�evin	\N	#C56321	0.649999976	t
19	6	3	Plant� d�evin	\N	#C56321	0.649999976	t
19	2	3	Plant� d�evin	\N	#C56321	0.649999976	t
21	11	6	Rybn�k	\N	#085FEA	0.649999976	t
22	14	16	Silnice	\N	#AEAEAE	0.649999976	t
23	14	25	Skl�dka	\N	#333333	0.649999976	t
24	10	1	Sklen�ky, pa�eni�t�	"landuse"=>"greenhouse_horticulture"	#8CD3BE	0.649999976	t
25	13	12	Spole�n� dv�r	\N	#A78C4B	0.649999976	t
26	6	2	�kolka mimo lesn�	"landuse"=>"plant_nursery"	#C96D8C	0.649999976	t
26	2	2	�kolka mimo lesn�	"landuse"=>"plant_nursery"	#C96D8C	0.649999976	t
26	5	2	�kolka mimo lesn�	"landuse"=>"plant_nursery"	#C96D8C	0.649999976	t
26	7	2	�kolka mimo lesn�	"landuse"=>"plant_nursery"	#C96D8C	0.649999976	t
27	7	\N	Travn� porosty	"landuse"=>"grass"	#A1CF8C	0.649999976	t
29	11	10	Vodn� plocha	"landuse"=>"reservoir"	#5BA1CD	0.649999976	t
29	11	28	Vodn� plocha	"landuse"=>"reservoir"	#5BA1CD	0.649999976	t
29	11	\N	Vodn� plocha	"landuse"=>"reservoir"	#5BA1CD	0.649999976	t
29	11	9	Vodn� plocha	"landuse"=>"reservoir"	#5BA1CD	0.649999976	t
30	5	3	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	#98FF11	0.649999976	t
30	5	\N	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	#98FF11	0.649999976	t
30	5	24	Zahrada	"leisure"=>"garden", "garden:type"=>"residential"	#98FF11	0.649999976	t
31	13	\N	Zastav�n� plocha	"building"=>"yes"	#674D3E	0.649999976	t
32	13	13	Zbo�eni�t�	"landuse"=>"brownfield"	#496741	0.649999976	t
34	14	14	�eleznice	"landuse"=>"railway"	#6B79AB	0.649999976	t
35	10	4	Les (prales?)	"natural"=>"wood"	#004000	0.649999976	t
1001	14	26	ostatn� plocha | jin� plocha	\N	\N	\N	f
1002	14	\N	Ostatn� plocha	\N	\N	\N	f
\.


--
-- Name: zpusoby_vyuziti_parcel_id_seq; Type: SEQUENCE SET; Schema: osmtables; Owner: pedro
--

SELECT pg_catalog.setval('zpusoby_vyuziti_parcel_id_seq', 60, true);


--
-- PostgreSQL database dump complete
--

