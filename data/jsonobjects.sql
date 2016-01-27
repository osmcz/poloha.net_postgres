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
-- Data for Name: jsonobjects; Type: TABLE DATA; Schema: osmtables; Owner: pedro
--

COPY jsonobjects (id, zoom_min, zoom_max, k, v, flag) FROM stdin;
1	14	25	amenity	\N	I
4	14	25	highway	bus_stop	I
5	14	25	shop	\N	I
6	8	15	place	city	I
8	9	15	place	town	I
9	12	15	place	village	I
10	11	25	natural	peak	I
2	14	17	amenity	bench	E
3	14	17	amenity	recycling	E
11	15	17	amenity	shower	E
12	15	17	amenity	shelter	E
13	15	17	amenity	post_box	E
14	15	17	amenity	vending_machine	E
15	15	25	leisure	\N	I
16	15	17	leisure	firepit	E
17	15	17	leisure	playground	E
18	14	25	information	\N	I
19	14	25	tourism	viewpoint	I
20	14	25	tourism	zoo	I
21	14	25	tourism	theme_park	I
22	14	25	tourism	museum	I
23	14	25	tourism	gallery	I
24	15	25	tourism	attraction	I
25	18	25	tourism	artwork	I
27	15	25	tourism	alpine_hut	I
28	15	25	tourism	apartment	I
29	15	25	tourism	hotel	I
30	15	25	tourism	motel	I
31	16	25	tourism	hostel	I
33	16	25	tourism	guest_house	I
34	16	25	tourism	chalet	I
35	16	25	tourism	camp_site	I
36	16	25	tourism	caravan_site	I
37	16	25	tourism	wilderness_hut	I
38	15	25	historic	\N	I
\.


--
-- Name: jsonobjects_id_seq; Type: SEQUENCE SET; Schema: osmtables; Owner: pedro
--

SELECT pg_catalog.setval('jsonobjects_id_seq', 38, true);


--
-- PostgreSQL database dump complete
--

