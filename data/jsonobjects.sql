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
4	14	25	highway	bus_stop	I
6	8	15	place	city	I
8	9	15	place	town	I
9	12	15	place	village	I
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
48	16	25	natural	water	I
49	16	25	natural	spring	I
50	16	25	natural	hot_spring	I
51	16	25	natural	geyser	I
52	16	25	natural	rock	I
53	16	25	natural	stone	I
54	16	25	natural	cave_entrance	I
55	16	25	denotation	natural_monument	I
56	18	25	emergency	\N	I
57	15	25	emergency	ambulance_station	I
10	14	25	natural	peak	I
58	14	25	railway	halt	I
59	14	25	railway	stop	I
60	14	25	railway	station	I
62	14	25	railway	tram_stop	I
39	15	25	man_made	campanile	I
40	15	25	man_made	communications_tower	I
41	15	25	man_made	cross	I
42	15	25	man_made	monitoring_station	I
43	15	25	man_made	observatory	I
44	15	25	man_made	tower	I
45	15	25	man_made	watermill	I
46	18	25	man_made	water_well	I
47	15	25	man_made	works	I
5	17	25	shop	\N	I
66	15	25	amenity	college	I
67	15	25	amenity	kindergarten	I
68	15	25	amenity	library	I
69	15	25	amenity	school	I
70	15	25	amenity	university	I
71	15	25	amenity	restaurant	I
72	15	25	amenity	cafe	I
73	15	25	amenity	bus_station	I
74	15	25	amenity	charging_station	I
75	15	25	amenity	fuel	I
76	15	25	amenity	atm	I
77	15	25	amenity	clinic	I
78	15	25	amenity	hospital	I
79	15	25	amenity	cinema	I
80	15	25	amenity	planetarium	I
81	15	25	amenity	theatre	I
82	15	25	amenity	courthouse	I
83	15	25	amenity	embassy	I
84	15	25	amenity	fire_station	I
85	15	25	amenity	grave_yard	I
86	15	25	amenity	police	I
87	15	25	amenity	post_office	I
88	15	25	amenity	rescue_station	I
89	15	25	amenity	toilets	I
90	15	25	amenity	townhall	I
1	17	25	amenity	\N	I
91	15	25	amenity	place_of_worship	I
92	15	25	aeroway	aerodrome	I
93	15	25	aeroway	heliport	I
94	15	25	aeroway	helipad	I
95	15	25	landuse	cemetery	I
96	15	25	landuse	commercial	I
97	15	25	landuse	farmyard	I
98	15	25	landuse	military	I
99	15	25	landuse	recreation_ground	I
100	15	25	landuse	reservoir	I
101	15	25	website	\N	I
102	15	25	contact:website	\N	I
103	15	25	wikipedie	\N	I
104	15	25	description	\N	I
105	15	25	inscription	\N	I
106	15	25	leisure	garden	E
107	15	25	power	generator	I
108	15	19	leisure	common	E
109	18	25	opening_hours	\N	I
63	18	25	shop	no	E
110	15	25	shop	department_store	I
111	15	25	shop	mall	I
112	15	25	shop	supermarket	I
113	16	25	shop	bakery	I
114	16	25	shop	convenience	I
115	16	25	shop	general	I
116	16	25	shop	kiosk	I
118	14	25	operator	cz:KÈT	I
121	15	25	military	\N	I
\.


--
-- Name: jsonobjects_id_seq; Type: SEQUENCE SET; Schema: osmtables; Owner: pedro
--

SELECT pg_catalog.setval('jsonobjects_id_seq', 121, true);


--
-- PostgreSQL database dump complete
--

