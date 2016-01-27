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
2	14	25	amenity	bench	E
3	14	25	amenity	recycling	E
4	14	25	highway	bus_stop	I
5	14	25	shop	\N	I
\.


--
-- Name: jsonobjects_id_seq; Type: SEQUENCE SET; Schema: osmtables; Owner: pedro
--

SELECT pg_catalog.setval('jsonobjects_id_seq', 5, true);


--
-- PostgreSQL database dump complete
--

