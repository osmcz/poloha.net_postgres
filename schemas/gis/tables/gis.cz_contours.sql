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

SET search_path = gis, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cz_contours; Type: TABLE; Schema: gis; Owner: mapnik
--

CREATE TABLE cz_contours (
    height real,
    way public.geometry
);


ALTER TABLE cz_contours OWNER TO mapnik;

--
-- Name: cz_contours_way; Type: INDEX; Schema: gis; Owner: mapnik
--

CREATE INDEX cz_contours_way ON cz_contours USING gist (way);


--
-- Name: cz_contours; Type: ACL; Schema: gis; Owner: mapnik
--

GRANT SELECT ON TABLE cz_contours TO PUBLIC;


--
-- PostgreSQL database dump complete
--

