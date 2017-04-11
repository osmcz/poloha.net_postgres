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

SET search_path = osm, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gps_points; Type: TABLE; Schema: osm; Owner: osm
--

CREATE TABLE gps_points (
    altitude double precision,
    trackid integer NOT NULL,
    latitude integer NOT NULL,
    longitude integer NOT NULL,
    gpx_id bigint NOT NULL,
    "timestamp" timestamp without time zone,
    tile bigint
);


ALTER TABLE gps_points OWNER TO osm;

--
-- Name: points_gpxid_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX points_gpxid_idx ON gps_points USING btree (gpx_id);


--
-- Name: points_tile_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX points_tile_idx ON gps_points USING btree (tile);


--
-- Name: gps_points gps_points_gpx_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY gps_points
    ADD CONSTRAINT gps_points_gpx_id_fkey FOREIGN KEY (gpx_id) REFERENCES gpx_files(id);


--
-- Name: gps_points; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE gps_points TO PUBLIC;


--
-- PostgreSQL database dump complete
--

