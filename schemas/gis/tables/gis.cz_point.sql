--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = gis, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cz_point; Type: TABLE; Schema: gis; Owner: mapnik; Tablespace: 
--

CREATE TABLE cz_point (
    osm_id bigint,
    emergency text,
    landmark text,
    office text,
    traffic_calming text,
    information text,
    access text,
    "addr:housename" text,
    "addr:housenumber" text,
    "addr:interpolation" text,
    admin_level text,
    aerialway text,
    aeroway text,
    amenity text,
    area text,
    barrier text,
    bicycle text,
    brand text,
    bridge text,
    boundary text,
    building text,
    "building:type" text,
    capital text,
    construction text,
    covered text,
    culvert text,
    cutting text,
    denomination text,
    disused text,
    ele text,
    embankment text,
    foot text,
    footway text,
    "generator:source" text,
    harbour text,
    highway text,
    historic text,
    horse text,
    intermittent text,
    junction text,
    landuse text,
    layer text,
    leisure text,
    lock text,
    man_made text,
    military text,
    motorcar text,
    name text,
    "natural" text,
    oneway text,
    operator text,
    poi text,
    population text,
    power text,
    power_source text,
    place text,
    railway text,
    ref text,
    religion text,
    route text,
    service text,
    shop text,
    sport text,
    surface text,
    toll text,
    tourism text,
    "tower:type" text,
    tunnel text,
    water text,
    waterway text,
    wetland text,
    width text,
    wood text,
    z_order integer,
    osm_user text,
    osm_uid text,
    osm_version text,
    osm_timestamp text,
    way public.geometry(Point,900913)
)
WITH (autovacuum_vacuum_scale_factor=0.01, autovacuum_analyze_scale_factor=0.01);


ALTER TABLE cz_point OWNER TO mapnik;

--
-- Name: cz_point_index; Type: INDEX; Schema: gis; Owner: mapnik; Tablespace: 
--

CREATE INDEX cz_point_index ON cz_point USING gist (way);


--
-- Name: cz_point_pkey; Type: INDEX; Schema: gis; Owner: mapnik; Tablespace: 
--

CREATE INDEX cz_point_pkey ON cz_point USING btree (osm_id);


--
-- Name: cz_point_place; Type: INDEX; Schema: gis; Owner: mapnik; Tablespace: 
--

CREATE INDEX cz_point_place ON cz_point USING btree (((place IS NOT NULL)));


--
-- Name: cz_point; Type: ACL; Schema: gis; Owner: mapnik
--

REVOKE ALL ON TABLE cz_point FROM PUBLIC;
REVOKE ALL ON TABLE cz_point FROM mapnik;
GRANT ALL ON TABLE cz_point TO mapnik;
GRANT SELECT ON TABLE cz_point TO PUBLIC;


--
-- PostgreSQL database dump complete
--

