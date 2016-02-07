--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = jsontiles, pg_catalog;

--
-- Data for Name: jsonobjects; Type: TABLE DATA; Schema: jsontiles; Owner: pedro
--

COPY jsonobjects (zoom_min, zoom_max, k, v, flag, id) FROM stdin;
14	25	highway	bus_stop	I	1
8	15	place	city	I	2
9	15	place	town	I	3
12	15	place	village	I	4
15	25	leisure	\N	I	5
15	17	leisure	firepit	E	6
15	17	leisure	playground	E	7
14	25	information	\N	I	8
14	25	tourism	viewpoint	I	9
14	25	tourism	zoo	I	10
14	25	tourism	theme_park	I	11
14	25	tourism	museum	I	12
14	25	tourism	gallery	I	13
15	25	tourism	attraction	I	14
18	25	tourism	artwork	I	15
15	25	tourism	alpine_hut	I	16
15	25	tourism	apartment	I	17
15	25	tourism	hotel	I	18
15	25	tourism	motel	I	19
16	25	tourism	hostel	I	20
16	25	tourism	guest_house	I	21
16	25	tourism	chalet	I	22
16	25	tourism	camp_site	I	23
16	25	tourism	caravan_site	I	24
16	25	tourism	wilderness_hut	I	25
15	25	historic	\N	I	26
16	25	natural	water	I	27
16	25	natural	spring	I	28
16	25	natural	hot_spring	I	29
16	25	natural	geyser	I	30
16	25	natural	rock	I	31
16	25	natural	stone	I	32
16	25	natural	cave_entrance	I	33
16	25	denotation	natural_monument	I	34
18	25	emergency	\N	I	35
15	25	emergency	ambulance_station	I	36
14	25	natural	peak	I	37
14	25	railway	halt	I	38
14	25	railway	stop	I	39
14	25	railway	station	I	40
14	25	railway	tram_stop	I	41
15	25	man_made	campanile	I	42
15	25	man_made	communications_tower	I	43
15	25	man_made	cross	I	44
15	25	man_made	monitoring_station	I	45
15	25	man_made	observatory	I	46
15	25	man_made	tower	I	47
15	25	man_made	watermill	I	48
18	25	man_made	water_well	I	49
15	25	man_made	works	I	50
17	25	shop	\N	I	51
15	25	amenity	college	I	52
15	25	amenity	kindergarten	I	53
15	25	amenity	library	I	54
15	25	amenity	school	I	55
15	25	amenity	university	I	56
15	25	amenity	restaurant	I	57
15	25	amenity	cafe	I	58
15	25	amenity	bus_station	I	59
15	25	amenity	charging_station	I	60
15	25	amenity	fuel	I	61
15	25	amenity	atm	I	62
15	25	amenity	clinic	I	63
15	25	amenity	hospital	I	64
15	25	amenity	cinema	I	65
15	25	amenity	planetarium	I	66
15	25	amenity	theatre	I	67
15	25	amenity	courthouse	I	68
15	25	amenity	embassy	I	69
15	25	amenity	fire_station	I	70
15	25	amenity	grave_yard	I	71
15	25	amenity	police	I	72
15	25	amenity	post_office	I	73
15	25	amenity	rescue_station	I	74
15	25	amenity	toilets	I	75
15	25	amenity	townhall	I	76
17	25	amenity	\N	I	77
15	25	amenity	place_of_worship	I	78
15	25	aeroway	aerodrome	I	79
15	25	aeroway	heliport	I	80
15	25	aeroway	helipad	I	81
15	25	landuse	cemetery	I	82
15	25	landuse	commercial	I	83
15	25	landuse	farmyard	I	84
15	25	landuse	military	I	85
15	25	landuse	recreation_ground	I	86
15	25	landuse	reservoir	I	87
15	25	website	\N	I	88
15	25	contact:website	\N	I	89
15	25	wikipedie	\N	I	90
15	25	description	\N	I	91
15	25	inscription	\N	I	92
15	25	leisure	garden	E	93
15	25	power	generator	I	94
15	19	leisure	common	E	95
18	25	opening_hours	\N	I	96
18	25	shop	no	E	97
15	25	shop	department_store	I	98
15	25	shop	mall	I	99
15	25	shop	supermarket	I	100
16	25	shop	bakery	I	101
16	25	shop	convenience	I	102
16	25	shop	general	I	103
16	25	shop	kiosk	I	104
14	25	operator	cz:KÈT	I	105
15	25	military	\N	I	106
\.


--
-- Name: jsonobjects_id_seq; Type: SEQUENCE SET; Schema: jsontiles; Owner: pedro
--

SELECT pg_catalog.setval('jsonobjects_id_seq', 106, true);


--
-- PostgreSQL database dump complete
--

