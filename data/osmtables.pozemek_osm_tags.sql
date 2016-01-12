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
-- Data for Name: pozemek_osm_tags; Type: TABLE DATA; Schema: osmtables; Owner: marian
--

COPY pozemek_osm_tags (druh_kod, druh_nazev, druh_zkratka, zpusob_vyuziti_kod, zpusob_vyuziti_nazev, zpusob_vyziti_zkratka, osmtag_k, osmtag_v) FROM stdin;
2	orná pùda	orná pùda	1	skleník, paøeni¹tì	skleník-paøeni¹.	\N	\N
2	orná pùda	orná pùda	2	¹kolka	¹kolka	\N	\N
2	orná pùda	orná pùda	3	plantá¾ døevin	plantá¾ døevin	\N	\N
2	orná pùda	orná pùda	4	les jiný ne¾ hospodáøský	les(ne hospodáø)	\N	\N
2	orná pùda	orná pùda	5	lesní pozemek, na kterém je budova	les s budovou	\N	\N
2	orná pùda	orná pùda	6	rybník	rybník	\N	\N
2	orná pùda	orná pùda	7	koryto vodního toku pøirozené nebo upravené	tok pøirozený	\N	\N
2	orná pùda	orná pùda	8	koryto vodního toku umìlé	tok umìlý	\N	\N
2	orná pùda	orná pùda	9	vodní nádr¾ pøírodní	nádr¾ pøírodní	\N	\N
2	orná pùda	orná pùda	10	vodní nádr¾ umìlá	nádr¾ umìlá	\N	\N
2	orná pùda	orná pùda	11	zamokøená plocha	zamokøená pl.	\N	\N
2	orná pùda	orná pùda	12	spoleèný dvùr	spoleèný dvùr	\N	\N
2	orná pùda	orná pùda	13	zboøeni¹tì	zboøeni¹tì	\N	\N
2	orná pùda	orná pùda	14	dráha	dráha	\N	\N
2	orná pùda	orná pùda	15	dálnice	dálnice	\N	\N
2	orná pùda	orná pùda	16	silnice	silnice	\N	\N
2	orná pùda	orná pùda	17	ostatní komunikace	ostat.komunikace	\N	\N
2	orná pùda	orná pùda	18	ostatní dopravní plocha	ost.dopravní pl.	\N	\N
2	orná pùda	orná pùda	19	zeleò	zeleò	\N	\N
2	orná pùda	orná pùda	20	sportovi¹tì a rekreaèní plocha	sport.a rekr.pl.	\N	\N
2	orná pùda	orná pùda	21	høbitov, urnový háj	høbitov-urn.háj	\N	\N
2	orná pùda	orná pùda	22	kulturní a osvìtová plocha	kult.a osvìt.pl.	\N	\N
2	orná pùda	orná pùda	23	manipulaèní plocha	manipulaèní pl.	\N	\N
2	orná pùda	orná pùda	24	dobývací prostor	dobývací prost.	\N	\N
2	orná pùda	orná pùda	25	skládka	skládka	\N	\N
2	orná pùda	orná pùda	26	jiná plocha	jiná plocha	\N	\N
2	orná pùda	orná pùda	27	neplodná pùda	neplodná pùda	\N	\N
2	orná pùda	orná pùda	28	vodní plocha, na které je budova	vod.pl.s budovou	\N	\N
2	orná pùda	orná pùda	29	fotovoltaická elektrárna	foto. elektrárna	\N	\N
3	chmelnice	chmelnice	1	skleník, paøeni¹tì	skleník-paøeni¹.	\N	\N
3	chmelnice	chmelnice	2	¹kolka	¹kolka	\N	\N
3	chmelnice	chmelnice	3	plantá¾ døevin	plantá¾ døevin	\N	\N
3	chmelnice	chmelnice	4	les jiný ne¾ hospodáøský	les(ne hospodáø)	\N	\N
3	chmelnice	chmelnice	5	lesní pozemek, na kterém je budova	les s budovou	\N	\N
3	chmelnice	chmelnice	6	rybník	rybník	\N	\N
3	chmelnice	chmelnice	7	koryto vodního toku pøirozené nebo upravené	tok pøirozený	\N	\N
3	chmelnice	chmelnice	8	koryto vodního toku umìlé	tok umìlý	\N	\N
3	chmelnice	chmelnice	9	vodní nádr¾ pøírodní	nádr¾ pøírodní	\N	\N
3	chmelnice	chmelnice	10	vodní nádr¾ umìlá	nádr¾ umìlá	\N	\N
3	chmelnice	chmelnice	11	zamokøená plocha	zamokøená pl.	\N	\N
3	chmelnice	chmelnice	12	spoleèný dvùr	spoleèný dvùr	\N	\N
3	chmelnice	chmelnice	13	zboøeni¹tì	zboøeni¹tì	\N	\N
3	chmelnice	chmelnice	14	dráha	dráha	\N	\N
3	chmelnice	chmelnice	15	dálnice	dálnice	\N	\N
3	chmelnice	chmelnice	16	silnice	silnice	\N	\N
3	chmelnice	chmelnice	17	ostatní komunikace	ostat.komunikace	\N	\N
3	chmelnice	chmelnice	18	ostatní dopravní plocha	ost.dopravní pl.	\N	\N
3	chmelnice	chmelnice	19	zeleò	zeleò	\N	\N
3	chmelnice	chmelnice	20	sportovi¹tì a rekreaèní plocha	sport.a rekr.pl.	\N	\N
3	chmelnice	chmelnice	21	høbitov, urnový háj	høbitov-urn.háj	\N	\N
3	chmelnice	chmelnice	22	kulturní a osvìtová plocha	kult.a osvìt.pl.	\N	\N
3	chmelnice	chmelnice	23	manipulaèní plocha	manipulaèní pl.	\N	\N
3	chmelnice	chmelnice	24	dobývací prostor	dobývací prost.	\N	\N
3	chmelnice	chmelnice	25	skládka	skládka	\N	\N
3	chmelnice	chmelnice	26	jiná plocha	jiná plocha	\N	\N
3	chmelnice	chmelnice	27	neplodná pùda	neplodná pùda	\N	\N
3	chmelnice	chmelnice	28	vodní plocha, na které je budova	vod.pl.s budovou	\N	\N
3	chmelnice	chmelnice	29	fotovoltaická elektrárna	foto. elektrárna	\N	\N
4	vinice	vinice	1	skleník, paøeni¹tì	skleník-paøeni¹.	\N	\N
4	vinice	vinice	2	¹kolka	¹kolka	\N	\N
4	vinice	vinice	3	plantá¾ døevin	plantá¾ døevin	\N	\N
4	vinice	vinice	4	les jiný ne¾ hospodáøský	les(ne hospodáø)	\N	\N
4	vinice	vinice	5	lesní pozemek, na kterém je budova	les s budovou	\N	\N
4	vinice	vinice	6	rybník	rybník	\N	\N
4	vinice	vinice	7	koryto vodního toku pøirozené nebo upravené	tok pøirozený	\N	\N
4	vinice	vinice	8	koryto vodního toku umìlé	tok umìlý	\N	\N
4	vinice	vinice	9	vodní nádr¾ pøírodní	nádr¾ pøírodní	\N	\N
4	vinice	vinice	10	vodní nádr¾ umìlá	nádr¾ umìlá	\N	\N
4	vinice	vinice	11	zamokøená plocha	zamokøená pl.	\N	\N
4	vinice	vinice	12	spoleèný dvùr	spoleèný dvùr	\N	\N
4	vinice	vinice	13	zboøeni¹tì	zboøeni¹tì	\N	\N
4	vinice	vinice	14	dráha	dráha	\N	\N
4	vinice	vinice	15	dálnice	dálnice	\N	\N
4	vinice	vinice	16	silnice	silnice	\N	\N
4	vinice	vinice	17	ostatní komunikace	ostat.komunikace	\N	\N
4	vinice	vinice	18	ostatní dopravní plocha	ost.dopravní pl.	\N	\N
4	vinice	vinice	19	zeleò	zeleò	\N	\N
4	vinice	vinice	20	sportovi¹tì a rekreaèní plocha	sport.a rekr.pl.	\N	\N
4	vinice	vinice	21	høbitov, urnový háj	høbitov-urn.háj	\N	\N
4	vinice	vinice	22	kulturní a osvìtová plocha	kult.a osvìt.pl.	\N	\N
4	vinice	vinice	23	manipulaèní plocha	manipulaèní pl.	\N	\N
4	vinice	vinice	24	dobývací prostor	dobývací prost.	\N	\N
4	vinice	vinice	25	skládka	skládka	\N	\N
4	vinice	vinice	26	jiná plocha	jiná plocha	\N	\N
4	vinice	vinice	27	neplodná pùda	neplodná pùda	\N	\N
4	vinice	vinice	28	vodní plocha, na které je budova	vod.pl.s budovou	\N	\N
4	vinice	vinice	29	fotovoltaická elektrárna	foto. elektrárna	\N	\N
5	zahrada	zahrada	1	skleník, paøeni¹tì	skleník-paøeni¹.	\N	\N
5	zahrada	zahrada	2	¹kolka	¹kolka	\N	\N
5	zahrada	zahrada	3	plantá¾ døevin	plantá¾ døevin	\N	\N
5	zahrada	zahrada	4	les jiný ne¾ hospodáøský	les(ne hospodáø)	\N	\N
5	zahrada	zahrada	5	lesní pozemek, na kterém je budova	les s budovou	\N	\N
5	zahrada	zahrada	6	rybník	rybník	\N	\N
5	zahrada	zahrada	7	koryto vodního toku pøirozené nebo upravené	tok pøirozený	\N	\N
5	zahrada	zahrada	8	koryto vodního toku umìlé	tok umìlý	\N	\N
5	zahrada	zahrada	9	vodní nádr¾ pøírodní	nádr¾ pøírodní	\N	\N
5	zahrada	zahrada	10	vodní nádr¾ umìlá	nádr¾ umìlá	\N	\N
5	zahrada	zahrada	11	zamokøená plocha	zamokøená pl.	\N	\N
5	zahrada	zahrada	12	spoleèný dvùr	spoleèný dvùr	\N	\N
5	zahrada	zahrada	13	zboøeni¹tì	zboøeni¹tì	\N	\N
5	zahrada	zahrada	14	dráha	dráha	\N	\N
5	zahrada	zahrada	15	dálnice	dálnice	\N	\N
5	zahrada	zahrada	16	silnice	silnice	\N	\N
5	zahrada	zahrada	17	ostatní komunikace	ostat.komunikace	\N	\N
5	zahrada	zahrada	18	ostatní dopravní plocha	ost.dopravní pl.	\N	\N
5	zahrada	zahrada	19	zeleò	zeleò	\N	\N
5	zahrada	zahrada	20	sportovi¹tì a rekreaèní plocha	sport.a rekr.pl.	\N	\N
5	zahrada	zahrada	21	høbitov, urnový háj	høbitov-urn.háj	\N	\N
5	zahrada	zahrada	22	kulturní a osvìtová plocha	kult.a osvìt.pl.	\N	\N
5	zahrada	zahrada	23	manipulaèní plocha	manipulaèní pl.	\N	\N
5	zahrada	zahrada	24	dobývací prostor	dobývací prost.	\N	\N
5	zahrada	zahrada	25	skládka	skládka	\N	\N
5	zahrada	zahrada	26	jiná plocha	jiná plocha	\N	\N
5	zahrada	zahrada	27	neplodná pùda	neplodná pùda	\N	\N
5	zahrada	zahrada	28	vodní plocha, na které je budova	vod.pl.s budovou	\N	\N
5	zahrada	zahrada	29	fotovoltaická elektrárna	foto. elektrárna	\N	\N
6	ovocný sad	ovoc. sad	1	skleník, paøeni¹tì	skleník-paøeni¹.	\N	\N
6	ovocný sad	ovoc. sad	2	¹kolka	¹kolka	\N	\N
6	ovocný sad	ovoc. sad	3	plantá¾ døevin	plantá¾ døevin	\N	\N
6	ovocný sad	ovoc. sad	4	les jiný ne¾ hospodáøský	les(ne hospodáø)	\N	\N
6	ovocný sad	ovoc. sad	5	lesní pozemek, na kterém je budova	les s budovou	\N	\N
6	ovocný sad	ovoc. sad	6	rybník	rybník	\N	\N
6	ovocný sad	ovoc. sad	7	koryto vodního toku pøirozené nebo upravené	tok pøirozený	\N	\N
6	ovocný sad	ovoc. sad	8	koryto vodního toku umìlé	tok umìlý	\N	\N
6	ovocný sad	ovoc. sad	9	vodní nádr¾ pøírodní	nádr¾ pøírodní	\N	\N
6	ovocný sad	ovoc. sad	10	vodní nádr¾ umìlá	nádr¾ umìlá	\N	\N
6	ovocný sad	ovoc. sad	11	zamokøená plocha	zamokøená pl.	\N	\N
6	ovocný sad	ovoc. sad	12	spoleèný dvùr	spoleèný dvùr	\N	\N
6	ovocný sad	ovoc. sad	13	zboøeni¹tì	zboøeni¹tì	\N	\N
6	ovocný sad	ovoc. sad	14	dráha	dráha	\N	\N
6	ovocný sad	ovoc. sad	15	dálnice	dálnice	\N	\N
6	ovocný sad	ovoc. sad	16	silnice	silnice	\N	\N
6	ovocný sad	ovoc. sad	17	ostatní komunikace	ostat.komunikace	\N	\N
6	ovocný sad	ovoc. sad	18	ostatní dopravní plocha	ost.dopravní pl.	\N	\N
6	ovocný sad	ovoc. sad	19	zeleò	zeleò	\N	\N
6	ovocný sad	ovoc. sad	20	sportovi¹tì a rekreaèní plocha	sport.a rekr.pl.	\N	\N
6	ovocný sad	ovoc. sad	21	høbitov, urnový háj	høbitov-urn.háj	\N	\N
6	ovocný sad	ovoc. sad	22	kulturní a osvìtová plocha	kult.a osvìt.pl.	\N	\N
6	ovocný sad	ovoc. sad	23	manipulaèní plocha	manipulaèní pl.	\N	\N
6	ovocný sad	ovoc. sad	24	dobývací prostor	dobývací prost.	\N	\N
6	ovocný sad	ovoc. sad	25	skládka	skládka	\N	\N
6	ovocný sad	ovoc. sad	26	jiná plocha	jiná plocha	\N	\N
6	ovocný sad	ovoc. sad	27	neplodná pùda	neplodná pùda	\N	\N
6	ovocný sad	ovoc. sad	28	vodní plocha, na které je budova	vod.pl.s budovou	\N	\N
6	ovocný sad	ovoc. sad	29	fotovoltaická elektrárna	foto. elektrárna	\N	\N
7	trvalý travní porost	travní p.	1	skleník, paøeni¹tì	skleník-paøeni¹.	\N	\N
7	trvalý travní porost	travní p.	2	¹kolka	¹kolka	\N	\N
7	trvalý travní porost	travní p.	3	plantá¾ døevin	plantá¾ døevin	\N	\N
7	trvalý travní porost	travní p.	4	les jiný ne¾ hospodáøský	les(ne hospodáø)	\N	\N
7	trvalý travní porost	travní p.	5	lesní pozemek, na kterém je budova	les s budovou	\N	\N
7	trvalý travní porost	travní p.	6	rybník	rybník	\N	\N
7	trvalý travní porost	travní p.	7	koryto vodního toku pøirozené nebo upravené	tok pøirozený	\N	\N
7	trvalý travní porost	travní p.	8	koryto vodního toku umìlé	tok umìlý	\N	\N
7	trvalý travní porost	travní p.	9	vodní nádr¾ pøírodní	nádr¾ pøírodní	\N	\N
7	trvalý travní porost	travní p.	10	vodní nádr¾ umìlá	nádr¾ umìlá	\N	\N
7	trvalý travní porost	travní p.	11	zamokøená plocha	zamokøená pl.	\N	\N
7	trvalý travní porost	travní p.	12	spoleèný dvùr	spoleèný dvùr	\N	\N
7	trvalý travní porost	travní p.	13	zboøeni¹tì	zboøeni¹tì	\N	\N
7	trvalý travní porost	travní p.	14	dráha	dráha	\N	\N
7	trvalý travní porost	travní p.	15	dálnice	dálnice	\N	\N
7	trvalý travní porost	travní p.	16	silnice	silnice	\N	\N
7	trvalý travní porost	travní p.	17	ostatní komunikace	ostat.komunikace	\N	\N
7	trvalý travní porost	travní p.	18	ostatní dopravní plocha	ost.dopravní pl.	\N	\N
7	trvalý travní porost	travní p.	19	zeleò	zeleò	\N	\N
7	trvalý travní porost	travní p.	20	sportovi¹tì a rekreaèní plocha	sport.a rekr.pl.	\N	\N
7	trvalý travní porost	travní p.	21	høbitov, urnový háj	høbitov-urn.háj	\N	\N
7	trvalý travní porost	travní p.	22	kulturní a osvìtová plocha	kult.a osvìt.pl.	\N	\N
7	trvalý travní porost	travní p.	23	manipulaèní plocha	manipulaèní pl.	\N	\N
7	trvalý travní porost	travní p.	24	dobývací prostor	dobývací prost.	\N	\N
7	trvalý travní porost	travní p.	25	skládka	skládka	\N	\N
7	trvalý travní porost	travní p.	26	jiná plocha	jiná plocha	\N	\N
7	trvalý travní porost	travní p.	27	neplodná pùda	neplodná pùda	\N	\N
7	trvalý travní porost	travní p.	28	vodní plocha, na které je budova	vod.pl.s budovou	\N	\N
7	trvalý travní porost	travní p.	29	fotovoltaická elektrárna	foto. elektrárna	\N	\N
8	trvalý travní porost	travní p.	1	skleník, paøeni¹tì	skleník-paøeni¹.	\N	\N
8	trvalý travní porost	travní p.	2	¹kolka	¹kolka	\N	\N
8	trvalý travní porost	travní p.	3	plantá¾ døevin	plantá¾ døevin	\N	\N
8	trvalý travní porost	travní p.	4	les jiný ne¾ hospodáøský	les(ne hospodáø)	\N	\N
8	trvalý travní porost	travní p.	5	lesní pozemek, na kterém je budova	les s budovou	\N	\N
8	trvalý travní porost	travní p.	6	rybník	rybník	\N	\N
8	trvalý travní porost	travní p.	7	koryto vodního toku pøirozené nebo upravené	tok pøirozený	\N	\N
8	trvalý travní porost	travní p.	8	koryto vodního toku umìlé	tok umìlý	\N	\N
8	trvalý travní porost	travní p.	9	vodní nádr¾ pøírodní	nádr¾ pøírodní	\N	\N
8	trvalý travní porost	travní p.	10	vodní nádr¾ umìlá	nádr¾ umìlá	\N	\N
8	trvalý travní porost	travní p.	11	zamokøená plocha	zamokøená pl.	\N	\N
8	trvalý travní porost	travní p.	12	spoleèný dvùr	spoleèný dvùr	\N	\N
8	trvalý travní porost	travní p.	13	zboøeni¹tì	zboøeni¹tì	\N	\N
8	trvalý travní porost	travní p.	14	dráha	dráha	\N	\N
8	trvalý travní porost	travní p.	15	dálnice	dálnice	\N	\N
8	trvalý travní porost	travní p.	16	silnice	silnice	\N	\N
8	trvalý travní porost	travní p.	17	ostatní komunikace	ostat.komunikace	\N	\N
8	trvalý travní porost	travní p.	18	ostatní dopravní plocha	ost.dopravní pl.	\N	\N
8	trvalý travní porost	travní p.	19	zeleò	zeleò	\N	\N
8	trvalý travní porost	travní p.	20	sportovi¹tì a rekreaèní plocha	sport.a rekr.pl.	\N	\N
8	trvalý travní porost	travní p.	21	høbitov, urnový háj	høbitov-urn.háj	\N	\N
8	trvalý travní porost	travní p.	22	kulturní a osvìtová plocha	kult.a osvìt.pl.	\N	\N
8	trvalý travní porost	travní p.	23	manipulaèní plocha	manipulaèní pl.	\N	\N
8	trvalý travní porost	travní p.	24	dobývací prostor	dobývací prost.	\N	\N
8	trvalý travní porost	travní p.	25	skládka	skládka	\N	\N
8	trvalý travní porost	travní p.	26	jiná plocha	jiná plocha	\N	\N
8	trvalý travní porost	travní p.	27	neplodná pùda	neplodná pùda	\N	\N
8	trvalý travní porost	travní p.	28	vodní plocha, na které je budova	vod.pl.s budovou	\N	\N
8	trvalý travní porost	travní p.	29	fotovoltaická elektrárna	foto. elektrárna	\N	\N
10	lesní pozemek	lesní poz	1	skleník, paøeni¹tì	skleník-paøeni¹.	\N	\N
10	lesní pozemek	lesní poz	2	¹kolka	¹kolka	\N	\N
10	lesní pozemek	lesní poz	3	plantá¾ døevin	plantá¾ døevin	\N	\N
10	lesní pozemek	lesní poz	4	les jiný ne¾ hospodáøský	les(ne hospodáø)	\N	\N
10	lesní pozemek	lesní poz	5	lesní pozemek, na kterém je budova	les s budovou	\N	\N
10	lesní pozemek	lesní poz	6	rybník	rybník	\N	\N
10	lesní pozemek	lesní poz	7	koryto vodního toku pøirozené nebo upravené	tok pøirozený	\N	\N
10	lesní pozemek	lesní poz	8	koryto vodního toku umìlé	tok umìlý	\N	\N
10	lesní pozemek	lesní poz	9	vodní nádr¾ pøírodní	nádr¾ pøírodní	\N	\N
10	lesní pozemek	lesní poz	10	vodní nádr¾ umìlá	nádr¾ umìlá	\N	\N
10	lesní pozemek	lesní poz	11	zamokøená plocha	zamokøená pl.	\N	\N
10	lesní pozemek	lesní poz	12	spoleèný dvùr	spoleèný dvùr	\N	\N
10	lesní pozemek	lesní poz	13	zboøeni¹tì	zboøeni¹tì	\N	\N
10	lesní pozemek	lesní poz	14	dráha	dráha	\N	\N
10	lesní pozemek	lesní poz	15	dálnice	dálnice	\N	\N
10	lesní pozemek	lesní poz	16	silnice	silnice	\N	\N
10	lesní pozemek	lesní poz	17	ostatní komunikace	ostat.komunikace	\N	\N
10	lesní pozemek	lesní poz	18	ostatní dopravní plocha	ost.dopravní pl.	\N	\N
10	lesní pozemek	lesní poz	19	zeleò	zeleò	\N	\N
10	lesní pozemek	lesní poz	20	sportovi¹tì a rekreaèní plocha	sport.a rekr.pl.	\N	\N
10	lesní pozemek	lesní poz	21	høbitov, urnový háj	høbitov-urn.háj	\N	\N
10	lesní pozemek	lesní poz	22	kulturní a osvìtová plocha	kult.a osvìt.pl.	\N	\N
10	lesní pozemek	lesní poz	23	manipulaèní plocha	manipulaèní pl.	\N	\N
10	lesní pozemek	lesní poz	24	dobývací prostor	dobývací prost.	\N	\N
10	lesní pozemek	lesní poz	25	skládka	skládka	\N	\N
10	lesní pozemek	lesní poz	26	jiná plocha	jiná plocha	\N	\N
10	lesní pozemek	lesní poz	27	neplodná pùda	neplodná pùda	\N	\N
10	lesní pozemek	lesní poz	28	vodní plocha, na které je budova	vod.pl.s budovou	\N	\N
10	lesní pozemek	lesní poz	29	fotovoltaická elektrárna	foto. elektrárna	\N	\N
11	vodní plocha	vodní pl.	1	skleník, paøeni¹tì	skleník-paøeni¹.	\N	\N
11	vodní plocha	vodní pl.	2	¹kolka	¹kolka	\N	\N
11	vodní plocha	vodní pl.	3	plantá¾ døevin	plantá¾ døevin	\N	\N
11	vodní plocha	vodní pl.	4	les jiný ne¾ hospodáøský	les(ne hospodáø)	\N	\N
11	vodní plocha	vodní pl.	5	lesní pozemek, na kterém je budova	les s budovou	\N	\N
11	vodní plocha	vodní pl.	6	rybník	rybník	\N	\N
11	vodní plocha	vodní pl.	7	koryto vodního toku pøirozené nebo upravené	tok pøirozený	\N	\N
11	vodní plocha	vodní pl.	8	koryto vodního toku umìlé	tok umìlý	\N	\N
11	vodní plocha	vodní pl.	9	vodní nádr¾ pøírodní	nádr¾ pøírodní	\N	\N
11	vodní plocha	vodní pl.	10	vodní nádr¾ umìlá	nádr¾ umìlá	\N	\N
11	vodní plocha	vodní pl.	11	zamokøená plocha	zamokøená pl.	\N	\N
11	vodní plocha	vodní pl.	12	spoleèný dvùr	spoleèný dvùr	\N	\N
11	vodní plocha	vodní pl.	13	zboøeni¹tì	zboøeni¹tì	\N	\N
11	vodní plocha	vodní pl.	14	dráha	dráha	\N	\N
11	vodní plocha	vodní pl.	15	dálnice	dálnice	\N	\N
11	vodní plocha	vodní pl.	16	silnice	silnice	\N	\N
11	vodní plocha	vodní pl.	17	ostatní komunikace	ostat.komunikace	\N	\N
11	vodní plocha	vodní pl.	18	ostatní dopravní plocha	ost.dopravní pl.	\N	\N
11	vodní plocha	vodní pl.	19	zeleò	zeleò	\N	\N
11	vodní plocha	vodní pl.	20	sportovi¹tì a rekreaèní plocha	sport.a rekr.pl.	\N	\N
11	vodní plocha	vodní pl.	21	høbitov, urnový háj	høbitov-urn.háj	\N	\N
11	vodní plocha	vodní pl.	22	kulturní a osvìtová plocha	kult.a osvìt.pl.	\N	\N
11	vodní plocha	vodní pl.	23	manipulaèní plocha	manipulaèní pl.	\N	\N
11	vodní plocha	vodní pl.	24	dobývací prostor	dobývací prost.	\N	\N
11	vodní plocha	vodní pl.	25	skládka	skládka	\N	\N
11	vodní plocha	vodní pl.	26	jiná plocha	jiná plocha	\N	\N
11	vodní plocha	vodní pl.	27	neplodná pùda	neplodná pùda	\N	\N
11	vodní plocha	vodní pl.	28	vodní plocha, na které je budova	vod.pl.s budovou	\N	\N
11	vodní plocha	vodní pl.	29	fotovoltaická elektrárna	foto. elektrárna	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	1	skleník, paøeni¹tì	skleník-paøeni¹.	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	2	¹kolka	¹kolka	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	3	plantá¾ døevin	plantá¾ døevin	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	4	les jiný ne¾ hospodáøský	les(ne hospodáø)	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	5	lesní pozemek, na kterém je budova	les s budovou	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	6	rybník	rybník	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	7	koryto vodního toku pøirozené nebo upravené	tok pøirozený	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	8	koryto vodního toku umìlé	tok umìlý	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	9	vodní nádr¾ pøírodní	nádr¾ pøírodní	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	10	vodní nádr¾ umìlá	nádr¾ umìlá	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	11	zamokøená plocha	zamokøená pl.	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	12	spoleèný dvùr	spoleèný dvùr	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	13	zboøeni¹tì	zboøeni¹tì	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	14	dráha	dráha	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	15	dálnice	dálnice	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	16	silnice	silnice	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	17	ostatní komunikace	ostat.komunikace	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	18	ostatní dopravní plocha	ost.dopravní pl.	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	19	zeleò	zeleò	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	20	sportovi¹tì a rekreaèní plocha	sport.a rekr.pl.	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	21	høbitov, urnový háj	høbitov-urn.háj	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	22	kulturní a osvìtová plocha	kult.a osvìt.pl.	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	23	manipulaèní plocha	manipulaèní pl.	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	24	dobývací prostor	dobývací prost.	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	25	skládka	skládka	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	26	jiná plocha	jiná plocha	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	27	neplodná pùda	neplodná pùda	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	28	vodní plocha, na které je budova	vod.pl.s budovou	\N	\N
13	zastavìná plocha a nádvoøí	zast. pl.	29	fotovoltaická elektrárna	foto. elektrárna	\N	\N
14	ostatní plocha	ostat.pl.	1	skleník, paøeni¹tì	skleník-paøeni¹.	\N	\N
14	ostatní plocha	ostat.pl.	2	¹kolka	¹kolka	\N	\N
14	ostatní plocha	ostat.pl.	3	plantá¾ døevin	plantá¾ døevin	\N	\N
14	ostatní plocha	ostat.pl.	4	les jiný ne¾ hospodáøský	les(ne hospodáø)	\N	\N
14	ostatní plocha	ostat.pl.	5	lesní pozemek, na kterém je budova	les s budovou	\N	\N
14	ostatní plocha	ostat.pl.	6	rybník	rybník	\N	\N
14	ostatní plocha	ostat.pl.	7	koryto vodního toku pøirozené nebo upravené	tok pøirozený	\N	\N
14	ostatní plocha	ostat.pl.	8	koryto vodního toku umìlé	tok umìlý	\N	\N
14	ostatní plocha	ostat.pl.	9	vodní nádr¾ pøírodní	nádr¾ pøírodní	\N	\N
14	ostatní plocha	ostat.pl.	10	vodní nádr¾ umìlá	nádr¾ umìlá	\N	\N
14	ostatní plocha	ostat.pl.	11	zamokøená plocha	zamokøená pl.	\N	\N
14	ostatní plocha	ostat.pl.	12	spoleèný dvùr	spoleèný dvùr	\N	\N
14	ostatní plocha	ostat.pl.	13	zboøeni¹tì	zboøeni¹tì	\N	\N
14	ostatní plocha	ostat.pl.	14	dráha	dráha	\N	\N
14	ostatní plocha	ostat.pl.	15	dálnice	dálnice	\N	\N
14	ostatní plocha	ostat.pl.	16	silnice	silnice	\N	\N
14	ostatní plocha	ostat.pl.	17	ostatní komunikace	ostat.komunikace	\N	\N
14	ostatní plocha	ostat.pl.	18	ostatní dopravní plocha	ost.dopravní pl.	\N	\N
14	ostatní plocha	ostat.pl.	19	zeleò	zeleò	\N	\N
14	ostatní plocha	ostat.pl.	20	sportovi¹tì a rekreaèní plocha	sport.a rekr.pl.	\N	\N
14	ostatní plocha	ostat.pl.	21	høbitov, urnový háj	høbitov-urn.háj	\N	\N
14	ostatní plocha	ostat.pl.	22	kulturní a osvìtová plocha	kult.a osvìt.pl.	\N	\N
14	ostatní plocha	ostat.pl.	23	manipulaèní plocha	manipulaèní pl.	\N	\N
14	ostatní plocha	ostat.pl.	24	dobývací prostor	dobývací prost.	\N	\N
14	ostatní plocha	ostat.pl.	25	skládka	skládka	\N	\N
14	ostatní plocha	ostat.pl.	26	jiná plocha	jiná plocha	\N	\N
14	ostatní plocha	ostat.pl.	27	neplodná pùda	neplodná pùda	\N	\N
14	ostatní plocha	ostat.pl.	28	vodní plocha, na které je budova	vod.pl.s budovou	\N	\N
14	ostatní plocha	ostat.pl.	29	fotovoltaická elektrárna	foto. elektrárna	\N	\N
\.


--
-- PostgreSQL database dump complete
--

