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
-- Name: cz_polygon; Type: TABLE; Schema: gis; Owner: mapnik; Tablespace: 
--

CREATE TABLE cz_polygon (
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
    construction text,
    covered text,
    culvert text,
    cutting text,
    denomination text,
    disused text,
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
    tracktype text,
    tunnel text,
    water text,
    waterway text,
    wetland text,
    width text,
    wood text,
    z_order integer,
    way_area real,
    lcn_ref text,
    rcn_ref text,
    ncn_ref text,
    lcn text,
    rcn text,
    ncn text,
    lwn_ref text,
    rwn_ref text,
    nwn_ref text,
    lwn text,
    rwn text,
    nwn text,
    route_pref_color text,
    route_name text,
    osm_user text,
    osm_uid text,
    osm_version text,
    osm_timestamp text,
    kct_yellow text,
    kct_red text,
    kct_green text,
    kct_blue text,
    complete text,
    abandoned text,
    marked_trail text,
    marked_trail_yellow text,
    marked_trail_red text,
    marked_trail_green text,
    marked_trail_blue text,
    colour text,
    network text,
    iwn text,
    "osmc:symbol" text,
    way public.geometry(Geometry,900913)
)
WITH (autovacuum_vacuum_scale_factor='0.02', autovacuum_analyze_scale_factor='0.02');


ALTER TABLE cz_polygon OWNER TO mapnik;

--
-- Name: cz_polygon_index; Type: INDEX; Schema: gis; Owner: mapnik; Tablespace: 
--

CREATE INDEX cz_polygon_index ON cz_polygon USING gist (way);


--
-- Name: cz_polygon_pkey; Type: INDEX; Schema: gis; Owner: mapnik; Tablespace: 
--

CREATE INDEX cz_polygon_pkey ON cz_polygon USING btree (osm_id);


--
-- Name: cz_polygon; Type: ACL; Schema: gis; Owner: mapnik
--

REVOKE ALL ON TABLE cz_polygon FROM PUBLIC;
REVOKE ALL ON TABLE cz_polygon FROM mapnik;
GRANT ALL ON TABLE cz_polygon TO mapnik;
GRANT SELECT ON TABLE cz_polygon TO PUBLIC;


--
-- PostgreSQL database dump complete
--

