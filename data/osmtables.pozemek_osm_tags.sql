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
2	orn� p�da	orn� p�da	1	sklen�k, pa�eni�t�	sklen�k-pa�eni�.	\N	\N
2	orn� p�da	orn� p�da	2	�kolka	�kolka	\N	\N
2	orn� p�da	orn� p�da	3	plant� d�evin	plant� d�evin	\N	\N
2	orn� p�da	orn� p�da	4	les jin� ne� hospod��sk�	les(ne hospod��)	\N	\N
2	orn� p�da	orn� p�da	5	lesn� pozemek, na kter�m je budova	les s budovou	\N	\N
2	orn� p�da	orn� p�da	6	rybn�k	rybn�k	\N	\N
2	orn� p�da	orn� p�da	7	koryto vodn�ho toku p�irozen� nebo upraven�	tok p�irozen�	\N	\N
2	orn� p�da	orn� p�da	8	koryto vodn�ho toku um�l�	tok um�l�	\N	\N
2	orn� p�da	orn� p�da	9	vodn� n�dr� p��rodn�	n�dr� p��rodn�	\N	\N
2	orn� p�da	orn� p�da	10	vodn� n�dr� um�l�	n�dr� um�l�	\N	\N
2	orn� p�da	orn� p�da	11	zamok�en� plocha	zamok�en� pl.	\N	\N
2	orn� p�da	orn� p�da	12	spole�n� dv�r	spole�n� dv�r	\N	\N
2	orn� p�da	orn� p�da	13	zbo�eni�t�	zbo�eni�t�	\N	\N
2	orn� p�da	orn� p�da	14	dr�ha	dr�ha	\N	\N
2	orn� p�da	orn� p�da	15	d�lnice	d�lnice	\N	\N
2	orn� p�da	orn� p�da	16	silnice	silnice	\N	\N
2	orn� p�da	orn� p�da	17	ostatn� komunikace	ostat.komunikace	\N	\N
2	orn� p�da	orn� p�da	18	ostatn� dopravn� plocha	ost.dopravn� pl.	\N	\N
2	orn� p�da	orn� p�da	19	zele�	zele�	\N	\N
2	orn� p�da	orn� p�da	20	sportovi�t� a rekrea�n� plocha	sport.a rekr.pl.	\N	\N
2	orn� p�da	orn� p�da	21	h�bitov, urnov� h�j	h�bitov-urn.h�j	\N	\N
2	orn� p�da	orn� p�da	22	kulturn� a osv�tov� plocha	kult.a osv�t.pl.	\N	\N
2	orn� p�da	orn� p�da	23	manipula�n� plocha	manipula�n� pl.	\N	\N
2	orn� p�da	orn� p�da	24	dob�vac� prostor	dob�vac� prost.	\N	\N
2	orn� p�da	orn� p�da	25	skl�dka	skl�dka	\N	\N
2	orn� p�da	orn� p�da	26	jin� plocha	jin� plocha	\N	\N
2	orn� p�da	orn� p�da	27	neplodn� p�da	neplodn� p�da	\N	\N
2	orn� p�da	orn� p�da	28	vodn� plocha, na kter� je budova	vod.pl.s budovou	\N	\N
2	orn� p�da	orn� p�da	29	fotovoltaick� elektr�rna	foto. elektr�rna	\N	\N
3	chmelnice	chmelnice	1	sklen�k, pa�eni�t�	sklen�k-pa�eni�.	\N	\N
3	chmelnice	chmelnice	2	�kolka	�kolka	\N	\N
3	chmelnice	chmelnice	3	plant� d�evin	plant� d�evin	\N	\N
3	chmelnice	chmelnice	4	les jin� ne� hospod��sk�	les(ne hospod��)	\N	\N
3	chmelnice	chmelnice	5	lesn� pozemek, na kter�m je budova	les s budovou	\N	\N
3	chmelnice	chmelnice	6	rybn�k	rybn�k	\N	\N
3	chmelnice	chmelnice	7	koryto vodn�ho toku p�irozen� nebo upraven�	tok p�irozen�	\N	\N
3	chmelnice	chmelnice	8	koryto vodn�ho toku um�l�	tok um�l�	\N	\N
3	chmelnice	chmelnice	9	vodn� n�dr� p��rodn�	n�dr� p��rodn�	\N	\N
3	chmelnice	chmelnice	10	vodn� n�dr� um�l�	n�dr� um�l�	\N	\N
3	chmelnice	chmelnice	11	zamok�en� plocha	zamok�en� pl.	\N	\N
3	chmelnice	chmelnice	12	spole�n� dv�r	spole�n� dv�r	\N	\N
3	chmelnice	chmelnice	13	zbo�eni�t�	zbo�eni�t�	\N	\N
3	chmelnice	chmelnice	14	dr�ha	dr�ha	\N	\N
3	chmelnice	chmelnice	15	d�lnice	d�lnice	\N	\N
3	chmelnice	chmelnice	16	silnice	silnice	\N	\N
3	chmelnice	chmelnice	17	ostatn� komunikace	ostat.komunikace	\N	\N
3	chmelnice	chmelnice	18	ostatn� dopravn� plocha	ost.dopravn� pl.	\N	\N
3	chmelnice	chmelnice	19	zele�	zele�	\N	\N
3	chmelnice	chmelnice	20	sportovi�t� a rekrea�n� plocha	sport.a rekr.pl.	\N	\N
3	chmelnice	chmelnice	21	h�bitov, urnov� h�j	h�bitov-urn.h�j	\N	\N
3	chmelnice	chmelnice	22	kulturn� a osv�tov� plocha	kult.a osv�t.pl.	\N	\N
3	chmelnice	chmelnice	23	manipula�n� plocha	manipula�n� pl.	\N	\N
3	chmelnice	chmelnice	24	dob�vac� prostor	dob�vac� prost.	\N	\N
3	chmelnice	chmelnice	25	skl�dka	skl�dka	\N	\N
3	chmelnice	chmelnice	26	jin� plocha	jin� plocha	\N	\N
3	chmelnice	chmelnice	27	neplodn� p�da	neplodn� p�da	\N	\N
3	chmelnice	chmelnice	28	vodn� plocha, na kter� je budova	vod.pl.s budovou	\N	\N
3	chmelnice	chmelnice	29	fotovoltaick� elektr�rna	foto. elektr�rna	\N	\N
4	vinice	vinice	1	sklen�k, pa�eni�t�	sklen�k-pa�eni�.	\N	\N
4	vinice	vinice	2	�kolka	�kolka	\N	\N
4	vinice	vinice	3	plant� d�evin	plant� d�evin	\N	\N
4	vinice	vinice	4	les jin� ne� hospod��sk�	les(ne hospod��)	\N	\N
4	vinice	vinice	5	lesn� pozemek, na kter�m je budova	les s budovou	\N	\N
4	vinice	vinice	6	rybn�k	rybn�k	\N	\N
4	vinice	vinice	7	koryto vodn�ho toku p�irozen� nebo upraven�	tok p�irozen�	\N	\N
4	vinice	vinice	8	koryto vodn�ho toku um�l�	tok um�l�	\N	\N
4	vinice	vinice	9	vodn� n�dr� p��rodn�	n�dr� p��rodn�	\N	\N
4	vinice	vinice	10	vodn� n�dr� um�l�	n�dr� um�l�	\N	\N
4	vinice	vinice	11	zamok�en� plocha	zamok�en� pl.	\N	\N
4	vinice	vinice	12	spole�n� dv�r	spole�n� dv�r	\N	\N
4	vinice	vinice	13	zbo�eni�t�	zbo�eni�t�	\N	\N
4	vinice	vinice	14	dr�ha	dr�ha	\N	\N
4	vinice	vinice	15	d�lnice	d�lnice	\N	\N
4	vinice	vinice	16	silnice	silnice	\N	\N
4	vinice	vinice	17	ostatn� komunikace	ostat.komunikace	\N	\N
4	vinice	vinice	18	ostatn� dopravn� plocha	ost.dopravn� pl.	\N	\N
4	vinice	vinice	19	zele�	zele�	\N	\N
4	vinice	vinice	20	sportovi�t� a rekrea�n� plocha	sport.a rekr.pl.	\N	\N
4	vinice	vinice	21	h�bitov, urnov� h�j	h�bitov-urn.h�j	\N	\N
4	vinice	vinice	22	kulturn� a osv�tov� plocha	kult.a osv�t.pl.	\N	\N
4	vinice	vinice	23	manipula�n� plocha	manipula�n� pl.	\N	\N
4	vinice	vinice	24	dob�vac� prostor	dob�vac� prost.	\N	\N
4	vinice	vinice	25	skl�dka	skl�dka	\N	\N
4	vinice	vinice	26	jin� plocha	jin� plocha	\N	\N
4	vinice	vinice	27	neplodn� p�da	neplodn� p�da	\N	\N
4	vinice	vinice	28	vodn� plocha, na kter� je budova	vod.pl.s budovou	\N	\N
4	vinice	vinice	29	fotovoltaick� elektr�rna	foto. elektr�rna	\N	\N
5	zahrada	zahrada	1	sklen�k, pa�eni�t�	sklen�k-pa�eni�.	\N	\N
5	zahrada	zahrada	2	�kolka	�kolka	\N	\N
5	zahrada	zahrada	3	plant� d�evin	plant� d�evin	\N	\N
5	zahrada	zahrada	4	les jin� ne� hospod��sk�	les(ne hospod��)	\N	\N
5	zahrada	zahrada	5	lesn� pozemek, na kter�m je budova	les s budovou	\N	\N
5	zahrada	zahrada	6	rybn�k	rybn�k	\N	\N
5	zahrada	zahrada	7	koryto vodn�ho toku p�irozen� nebo upraven�	tok p�irozen�	\N	\N
5	zahrada	zahrada	8	koryto vodn�ho toku um�l�	tok um�l�	\N	\N
5	zahrada	zahrada	9	vodn� n�dr� p��rodn�	n�dr� p��rodn�	\N	\N
5	zahrada	zahrada	10	vodn� n�dr� um�l�	n�dr� um�l�	\N	\N
5	zahrada	zahrada	11	zamok�en� plocha	zamok�en� pl.	\N	\N
5	zahrada	zahrada	12	spole�n� dv�r	spole�n� dv�r	\N	\N
5	zahrada	zahrada	13	zbo�eni�t�	zbo�eni�t�	\N	\N
5	zahrada	zahrada	14	dr�ha	dr�ha	\N	\N
5	zahrada	zahrada	15	d�lnice	d�lnice	\N	\N
5	zahrada	zahrada	16	silnice	silnice	\N	\N
5	zahrada	zahrada	17	ostatn� komunikace	ostat.komunikace	\N	\N
5	zahrada	zahrada	18	ostatn� dopravn� plocha	ost.dopravn� pl.	\N	\N
5	zahrada	zahrada	19	zele�	zele�	\N	\N
5	zahrada	zahrada	20	sportovi�t� a rekrea�n� plocha	sport.a rekr.pl.	\N	\N
5	zahrada	zahrada	21	h�bitov, urnov� h�j	h�bitov-urn.h�j	\N	\N
5	zahrada	zahrada	22	kulturn� a osv�tov� plocha	kult.a osv�t.pl.	\N	\N
5	zahrada	zahrada	23	manipula�n� plocha	manipula�n� pl.	\N	\N
5	zahrada	zahrada	24	dob�vac� prostor	dob�vac� prost.	\N	\N
5	zahrada	zahrada	25	skl�dka	skl�dka	\N	\N
5	zahrada	zahrada	26	jin� plocha	jin� plocha	\N	\N
5	zahrada	zahrada	27	neplodn� p�da	neplodn� p�da	\N	\N
5	zahrada	zahrada	28	vodn� plocha, na kter� je budova	vod.pl.s budovou	\N	\N
5	zahrada	zahrada	29	fotovoltaick� elektr�rna	foto. elektr�rna	\N	\N
6	ovocn� sad	ovoc. sad	1	sklen�k, pa�eni�t�	sklen�k-pa�eni�.	\N	\N
6	ovocn� sad	ovoc. sad	2	�kolka	�kolka	\N	\N
6	ovocn� sad	ovoc. sad	3	plant� d�evin	plant� d�evin	\N	\N
6	ovocn� sad	ovoc. sad	4	les jin� ne� hospod��sk�	les(ne hospod��)	\N	\N
6	ovocn� sad	ovoc. sad	5	lesn� pozemek, na kter�m je budova	les s budovou	\N	\N
6	ovocn� sad	ovoc. sad	6	rybn�k	rybn�k	\N	\N
6	ovocn� sad	ovoc. sad	7	koryto vodn�ho toku p�irozen� nebo upraven�	tok p�irozen�	\N	\N
6	ovocn� sad	ovoc. sad	8	koryto vodn�ho toku um�l�	tok um�l�	\N	\N
6	ovocn� sad	ovoc. sad	9	vodn� n�dr� p��rodn�	n�dr� p��rodn�	\N	\N
6	ovocn� sad	ovoc. sad	10	vodn� n�dr� um�l�	n�dr� um�l�	\N	\N
6	ovocn� sad	ovoc. sad	11	zamok�en� plocha	zamok�en� pl.	\N	\N
6	ovocn� sad	ovoc. sad	12	spole�n� dv�r	spole�n� dv�r	\N	\N
6	ovocn� sad	ovoc. sad	13	zbo�eni�t�	zbo�eni�t�	\N	\N
6	ovocn� sad	ovoc. sad	14	dr�ha	dr�ha	\N	\N
6	ovocn� sad	ovoc. sad	15	d�lnice	d�lnice	\N	\N
6	ovocn� sad	ovoc. sad	16	silnice	silnice	\N	\N
6	ovocn� sad	ovoc. sad	17	ostatn� komunikace	ostat.komunikace	\N	\N
6	ovocn� sad	ovoc. sad	18	ostatn� dopravn� plocha	ost.dopravn� pl.	\N	\N
6	ovocn� sad	ovoc. sad	19	zele�	zele�	\N	\N
6	ovocn� sad	ovoc. sad	20	sportovi�t� a rekrea�n� plocha	sport.a rekr.pl.	\N	\N
6	ovocn� sad	ovoc. sad	21	h�bitov, urnov� h�j	h�bitov-urn.h�j	\N	\N
6	ovocn� sad	ovoc. sad	22	kulturn� a osv�tov� plocha	kult.a osv�t.pl.	\N	\N
6	ovocn� sad	ovoc. sad	23	manipula�n� plocha	manipula�n� pl.	\N	\N
6	ovocn� sad	ovoc. sad	24	dob�vac� prostor	dob�vac� prost.	\N	\N
6	ovocn� sad	ovoc. sad	25	skl�dka	skl�dka	\N	\N
6	ovocn� sad	ovoc. sad	26	jin� plocha	jin� plocha	\N	\N
6	ovocn� sad	ovoc. sad	27	neplodn� p�da	neplodn� p�da	\N	\N
6	ovocn� sad	ovoc. sad	28	vodn� plocha, na kter� je budova	vod.pl.s budovou	\N	\N
6	ovocn� sad	ovoc. sad	29	fotovoltaick� elektr�rna	foto. elektr�rna	\N	\N
7	trval� travn� porost	travn� p.	1	sklen�k, pa�eni�t�	sklen�k-pa�eni�.	\N	\N
7	trval� travn� porost	travn� p.	2	�kolka	�kolka	\N	\N
7	trval� travn� porost	travn� p.	3	plant� d�evin	plant� d�evin	\N	\N
7	trval� travn� porost	travn� p.	4	les jin� ne� hospod��sk�	les(ne hospod��)	\N	\N
7	trval� travn� porost	travn� p.	5	lesn� pozemek, na kter�m je budova	les s budovou	\N	\N
7	trval� travn� porost	travn� p.	6	rybn�k	rybn�k	\N	\N
7	trval� travn� porost	travn� p.	7	koryto vodn�ho toku p�irozen� nebo upraven�	tok p�irozen�	\N	\N
7	trval� travn� porost	travn� p.	8	koryto vodn�ho toku um�l�	tok um�l�	\N	\N
7	trval� travn� porost	travn� p.	9	vodn� n�dr� p��rodn�	n�dr� p��rodn�	\N	\N
7	trval� travn� porost	travn� p.	10	vodn� n�dr� um�l�	n�dr� um�l�	\N	\N
7	trval� travn� porost	travn� p.	11	zamok�en� plocha	zamok�en� pl.	\N	\N
7	trval� travn� porost	travn� p.	12	spole�n� dv�r	spole�n� dv�r	\N	\N
7	trval� travn� porost	travn� p.	13	zbo�eni�t�	zbo�eni�t�	\N	\N
7	trval� travn� porost	travn� p.	14	dr�ha	dr�ha	\N	\N
7	trval� travn� porost	travn� p.	15	d�lnice	d�lnice	\N	\N
7	trval� travn� porost	travn� p.	16	silnice	silnice	\N	\N
7	trval� travn� porost	travn� p.	17	ostatn� komunikace	ostat.komunikace	\N	\N
7	trval� travn� porost	travn� p.	18	ostatn� dopravn� plocha	ost.dopravn� pl.	\N	\N
7	trval� travn� porost	travn� p.	19	zele�	zele�	\N	\N
7	trval� travn� porost	travn� p.	20	sportovi�t� a rekrea�n� plocha	sport.a rekr.pl.	\N	\N
7	trval� travn� porost	travn� p.	21	h�bitov, urnov� h�j	h�bitov-urn.h�j	\N	\N
7	trval� travn� porost	travn� p.	22	kulturn� a osv�tov� plocha	kult.a osv�t.pl.	\N	\N
7	trval� travn� porost	travn� p.	23	manipula�n� plocha	manipula�n� pl.	\N	\N
7	trval� travn� porost	travn� p.	24	dob�vac� prostor	dob�vac� prost.	\N	\N
7	trval� travn� porost	travn� p.	25	skl�dka	skl�dka	\N	\N
7	trval� travn� porost	travn� p.	26	jin� plocha	jin� plocha	\N	\N
7	trval� travn� porost	travn� p.	27	neplodn� p�da	neplodn� p�da	\N	\N
7	trval� travn� porost	travn� p.	28	vodn� plocha, na kter� je budova	vod.pl.s budovou	\N	\N
7	trval� travn� porost	travn� p.	29	fotovoltaick� elektr�rna	foto. elektr�rna	\N	\N
8	trval� travn� porost	travn� p.	1	sklen�k, pa�eni�t�	sklen�k-pa�eni�.	\N	\N
8	trval� travn� porost	travn� p.	2	�kolka	�kolka	\N	\N
8	trval� travn� porost	travn� p.	3	plant� d�evin	plant� d�evin	\N	\N
8	trval� travn� porost	travn� p.	4	les jin� ne� hospod��sk�	les(ne hospod��)	\N	\N
8	trval� travn� porost	travn� p.	5	lesn� pozemek, na kter�m je budova	les s budovou	\N	\N
8	trval� travn� porost	travn� p.	6	rybn�k	rybn�k	\N	\N
8	trval� travn� porost	travn� p.	7	koryto vodn�ho toku p�irozen� nebo upraven�	tok p�irozen�	\N	\N
8	trval� travn� porost	travn� p.	8	koryto vodn�ho toku um�l�	tok um�l�	\N	\N
8	trval� travn� porost	travn� p.	9	vodn� n�dr� p��rodn�	n�dr� p��rodn�	\N	\N
8	trval� travn� porost	travn� p.	10	vodn� n�dr� um�l�	n�dr� um�l�	\N	\N
8	trval� travn� porost	travn� p.	11	zamok�en� plocha	zamok�en� pl.	\N	\N
8	trval� travn� porost	travn� p.	12	spole�n� dv�r	spole�n� dv�r	\N	\N
8	trval� travn� porost	travn� p.	13	zbo�eni�t�	zbo�eni�t�	\N	\N
8	trval� travn� porost	travn� p.	14	dr�ha	dr�ha	\N	\N
8	trval� travn� porost	travn� p.	15	d�lnice	d�lnice	\N	\N
8	trval� travn� porost	travn� p.	16	silnice	silnice	\N	\N
8	trval� travn� porost	travn� p.	17	ostatn� komunikace	ostat.komunikace	\N	\N
8	trval� travn� porost	travn� p.	18	ostatn� dopravn� plocha	ost.dopravn� pl.	\N	\N
8	trval� travn� porost	travn� p.	19	zele�	zele�	\N	\N
8	trval� travn� porost	travn� p.	20	sportovi�t� a rekrea�n� plocha	sport.a rekr.pl.	\N	\N
8	trval� travn� porost	travn� p.	21	h�bitov, urnov� h�j	h�bitov-urn.h�j	\N	\N
8	trval� travn� porost	travn� p.	22	kulturn� a osv�tov� plocha	kult.a osv�t.pl.	\N	\N
8	trval� travn� porost	travn� p.	23	manipula�n� plocha	manipula�n� pl.	\N	\N
8	trval� travn� porost	travn� p.	24	dob�vac� prostor	dob�vac� prost.	\N	\N
8	trval� travn� porost	travn� p.	25	skl�dka	skl�dka	\N	\N
8	trval� travn� porost	travn� p.	26	jin� plocha	jin� plocha	\N	\N
8	trval� travn� porost	travn� p.	27	neplodn� p�da	neplodn� p�da	\N	\N
8	trval� travn� porost	travn� p.	28	vodn� plocha, na kter� je budova	vod.pl.s budovou	\N	\N
8	trval� travn� porost	travn� p.	29	fotovoltaick� elektr�rna	foto. elektr�rna	\N	\N
10	lesn� pozemek	lesn� poz	1	sklen�k, pa�eni�t�	sklen�k-pa�eni�.	\N	\N
10	lesn� pozemek	lesn� poz	2	�kolka	�kolka	\N	\N
10	lesn� pozemek	lesn� poz	3	plant� d�evin	plant� d�evin	\N	\N
10	lesn� pozemek	lesn� poz	4	les jin� ne� hospod��sk�	les(ne hospod��)	\N	\N
10	lesn� pozemek	lesn� poz	5	lesn� pozemek, na kter�m je budova	les s budovou	\N	\N
10	lesn� pozemek	lesn� poz	6	rybn�k	rybn�k	\N	\N
10	lesn� pozemek	lesn� poz	7	koryto vodn�ho toku p�irozen� nebo upraven�	tok p�irozen�	\N	\N
10	lesn� pozemek	lesn� poz	8	koryto vodn�ho toku um�l�	tok um�l�	\N	\N
10	lesn� pozemek	lesn� poz	9	vodn� n�dr� p��rodn�	n�dr� p��rodn�	\N	\N
10	lesn� pozemek	lesn� poz	10	vodn� n�dr� um�l�	n�dr� um�l�	\N	\N
10	lesn� pozemek	lesn� poz	11	zamok�en� plocha	zamok�en� pl.	\N	\N
10	lesn� pozemek	lesn� poz	12	spole�n� dv�r	spole�n� dv�r	\N	\N
10	lesn� pozemek	lesn� poz	13	zbo�eni�t�	zbo�eni�t�	\N	\N
10	lesn� pozemek	lesn� poz	14	dr�ha	dr�ha	\N	\N
10	lesn� pozemek	lesn� poz	15	d�lnice	d�lnice	\N	\N
10	lesn� pozemek	lesn� poz	16	silnice	silnice	\N	\N
10	lesn� pozemek	lesn� poz	17	ostatn� komunikace	ostat.komunikace	\N	\N
10	lesn� pozemek	lesn� poz	18	ostatn� dopravn� plocha	ost.dopravn� pl.	\N	\N
10	lesn� pozemek	lesn� poz	19	zele�	zele�	\N	\N
10	lesn� pozemek	lesn� poz	20	sportovi�t� a rekrea�n� plocha	sport.a rekr.pl.	\N	\N
10	lesn� pozemek	lesn� poz	21	h�bitov, urnov� h�j	h�bitov-urn.h�j	\N	\N
10	lesn� pozemek	lesn� poz	22	kulturn� a osv�tov� plocha	kult.a osv�t.pl.	\N	\N
10	lesn� pozemek	lesn� poz	23	manipula�n� plocha	manipula�n� pl.	\N	\N
10	lesn� pozemek	lesn� poz	24	dob�vac� prostor	dob�vac� prost.	\N	\N
10	lesn� pozemek	lesn� poz	25	skl�dka	skl�dka	\N	\N
10	lesn� pozemek	lesn� poz	26	jin� plocha	jin� plocha	\N	\N
10	lesn� pozemek	lesn� poz	27	neplodn� p�da	neplodn� p�da	\N	\N
10	lesn� pozemek	lesn� poz	28	vodn� plocha, na kter� je budova	vod.pl.s budovou	\N	\N
10	lesn� pozemek	lesn� poz	29	fotovoltaick� elektr�rna	foto. elektr�rna	\N	\N
11	vodn� plocha	vodn� pl.	1	sklen�k, pa�eni�t�	sklen�k-pa�eni�.	\N	\N
11	vodn� plocha	vodn� pl.	2	�kolka	�kolka	\N	\N
11	vodn� plocha	vodn� pl.	3	plant� d�evin	plant� d�evin	\N	\N
11	vodn� plocha	vodn� pl.	4	les jin� ne� hospod��sk�	les(ne hospod��)	\N	\N
11	vodn� plocha	vodn� pl.	5	lesn� pozemek, na kter�m je budova	les s budovou	\N	\N
11	vodn� plocha	vodn� pl.	6	rybn�k	rybn�k	\N	\N
11	vodn� plocha	vodn� pl.	7	koryto vodn�ho toku p�irozen� nebo upraven�	tok p�irozen�	\N	\N
11	vodn� plocha	vodn� pl.	8	koryto vodn�ho toku um�l�	tok um�l�	\N	\N
11	vodn� plocha	vodn� pl.	9	vodn� n�dr� p��rodn�	n�dr� p��rodn�	\N	\N
11	vodn� plocha	vodn� pl.	10	vodn� n�dr� um�l�	n�dr� um�l�	\N	\N
11	vodn� plocha	vodn� pl.	11	zamok�en� plocha	zamok�en� pl.	\N	\N
11	vodn� plocha	vodn� pl.	12	spole�n� dv�r	spole�n� dv�r	\N	\N
11	vodn� plocha	vodn� pl.	13	zbo�eni�t�	zbo�eni�t�	\N	\N
11	vodn� plocha	vodn� pl.	14	dr�ha	dr�ha	\N	\N
11	vodn� plocha	vodn� pl.	15	d�lnice	d�lnice	\N	\N
11	vodn� plocha	vodn� pl.	16	silnice	silnice	\N	\N
11	vodn� plocha	vodn� pl.	17	ostatn� komunikace	ostat.komunikace	\N	\N
11	vodn� plocha	vodn� pl.	18	ostatn� dopravn� plocha	ost.dopravn� pl.	\N	\N
11	vodn� plocha	vodn� pl.	19	zele�	zele�	\N	\N
11	vodn� plocha	vodn� pl.	20	sportovi�t� a rekrea�n� plocha	sport.a rekr.pl.	\N	\N
11	vodn� plocha	vodn� pl.	21	h�bitov, urnov� h�j	h�bitov-urn.h�j	\N	\N
11	vodn� plocha	vodn� pl.	22	kulturn� a osv�tov� plocha	kult.a osv�t.pl.	\N	\N
11	vodn� plocha	vodn� pl.	23	manipula�n� plocha	manipula�n� pl.	\N	\N
11	vodn� plocha	vodn� pl.	24	dob�vac� prostor	dob�vac� prost.	\N	\N
11	vodn� plocha	vodn� pl.	25	skl�dka	skl�dka	\N	\N
11	vodn� plocha	vodn� pl.	26	jin� plocha	jin� plocha	\N	\N
11	vodn� plocha	vodn� pl.	27	neplodn� p�da	neplodn� p�da	\N	\N
11	vodn� plocha	vodn� pl.	28	vodn� plocha, na kter� je budova	vod.pl.s budovou	\N	\N
11	vodn� plocha	vodn� pl.	29	fotovoltaick� elektr�rna	foto. elektr�rna	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	1	sklen�k, pa�eni�t�	sklen�k-pa�eni�.	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	2	�kolka	�kolka	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	3	plant� d�evin	plant� d�evin	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	4	les jin� ne� hospod��sk�	les(ne hospod��)	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	5	lesn� pozemek, na kter�m je budova	les s budovou	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	6	rybn�k	rybn�k	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	7	koryto vodn�ho toku p�irozen� nebo upraven�	tok p�irozen�	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	8	koryto vodn�ho toku um�l�	tok um�l�	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	9	vodn� n�dr� p��rodn�	n�dr� p��rodn�	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	10	vodn� n�dr� um�l�	n�dr� um�l�	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	11	zamok�en� plocha	zamok�en� pl.	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	12	spole�n� dv�r	spole�n� dv�r	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	13	zbo�eni�t�	zbo�eni�t�	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	14	dr�ha	dr�ha	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	15	d�lnice	d�lnice	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	16	silnice	silnice	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	17	ostatn� komunikace	ostat.komunikace	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	18	ostatn� dopravn� plocha	ost.dopravn� pl.	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	19	zele�	zele�	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	20	sportovi�t� a rekrea�n� plocha	sport.a rekr.pl.	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	21	h�bitov, urnov� h�j	h�bitov-urn.h�j	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	22	kulturn� a osv�tov� plocha	kult.a osv�t.pl.	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	23	manipula�n� plocha	manipula�n� pl.	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	24	dob�vac� prostor	dob�vac� prost.	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	25	skl�dka	skl�dka	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	26	jin� plocha	jin� plocha	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	27	neplodn� p�da	neplodn� p�da	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	28	vodn� plocha, na kter� je budova	vod.pl.s budovou	\N	\N
13	zastav�n� plocha a n�dvo��	zast. pl.	29	fotovoltaick� elektr�rna	foto. elektr�rna	\N	\N
14	ostatn� plocha	ostat.pl.	1	sklen�k, pa�eni�t�	sklen�k-pa�eni�.	\N	\N
14	ostatn� plocha	ostat.pl.	2	�kolka	�kolka	\N	\N
14	ostatn� plocha	ostat.pl.	3	plant� d�evin	plant� d�evin	\N	\N
14	ostatn� plocha	ostat.pl.	4	les jin� ne� hospod��sk�	les(ne hospod��)	\N	\N
14	ostatn� plocha	ostat.pl.	5	lesn� pozemek, na kter�m je budova	les s budovou	\N	\N
14	ostatn� plocha	ostat.pl.	6	rybn�k	rybn�k	\N	\N
14	ostatn� plocha	ostat.pl.	7	koryto vodn�ho toku p�irozen� nebo upraven�	tok p�irozen�	\N	\N
14	ostatn� plocha	ostat.pl.	8	koryto vodn�ho toku um�l�	tok um�l�	\N	\N
14	ostatn� plocha	ostat.pl.	9	vodn� n�dr� p��rodn�	n�dr� p��rodn�	\N	\N
14	ostatn� plocha	ostat.pl.	10	vodn� n�dr� um�l�	n�dr� um�l�	\N	\N
14	ostatn� plocha	ostat.pl.	11	zamok�en� plocha	zamok�en� pl.	\N	\N
14	ostatn� plocha	ostat.pl.	12	spole�n� dv�r	spole�n� dv�r	\N	\N
14	ostatn� plocha	ostat.pl.	13	zbo�eni�t�	zbo�eni�t�	\N	\N
14	ostatn� plocha	ostat.pl.	14	dr�ha	dr�ha	\N	\N
14	ostatn� plocha	ostat.pl.	15	d�lnice	d�lnice	\N	\N
14	ostatn� plocha	ostat.pl.	16	silnice	silnice	\N	\N
14	ostatn� plocha	ostat.pl.	17	ostatn� komunikace	ostat.komunikace	\N	\N
14	ostatn� plocha	ostat.pl.	18	ostatn� dopravn� plocha	ost.dopravn� pl.	\N	\N
14	ostatn� plocha	ostat.pl.	19	zele�	zele�	\N	\N
14	ostatn� plocha	ostat.pl.	20	sportovi�t� a rekrea�n� plocha	sport.a rekr.pl.	\N	\N
14	ostatn� plocha	ostat.pl.	21	h�bitov, urnov� h�j	h�bitov-urn.h�j	\N	\N
14	ostatn� plocha	ostat.pl.	22	kulturn� a osv�tov� plocha	kult.a osv�t.pl.	\N	\N
14	ostatn� plocha	ostat.pl.	23	manipula�n� plocha	manipula�n� pl.	\N	\N
14	ostatn� plocha	ostat.pl.	24	dob�vac� prostor	dob�vac� prost.	\N	\N
14	ostatn� plocha	ostat.pl.	25	skl�dka	skl�dka	\N	\N
14	ostatn� plocha	ostat.pl.	26	jin� plocha	jin� plocha	\N	\N
14	ostatn� plocha	ostat.pl.	27	neplodn� p�da	neplodn� p�da	\N	\N
14	ostatn� plocha	ostat.pl.	28	vodn� plocha, na kter� je budova	vod.pl.s budovou	\N	\N
14	ostatn� plocha	ostat.pl.	29	fotovoltaick� elektr�rna	foto. elektr�rna	\N	\N
\.


--
-- PostgreSQL database dump complete
--

