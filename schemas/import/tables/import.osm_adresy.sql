--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: osm_adresy; Type: TABLE; Schema: import; Owner: import0; Tablespace: 
--

CREATE TABLE osm_adresy (
    id bigint NOT NULL,
    co co NOT NULL,
    conscriptionnumber text,
    provisionalnumber text,
    streetnumber text,
    housenumber text,
    street text,
    place text,
    suburb text,
    city text,
    postcode text,
    country text,
    is_in text,
    source text,
    sourceaddr text,
    sourceposition text,
    refruian text,
    refruianaddr text,
    version bigint,
    visible boolean,
    geom public.geometry,
    alternatenumber text,
    provisional text,
    sourceloc text,
    borough text,
    uir text
);


ALTER TABLE osm_adresy OWNER TO import0;

--
-- Name: osm_adresy_pkey; Type: CONSTRAINT; Schema: import; Owner: import0; Tablespace: 
--

ALTER TABLE ONLY osm_adresy
    ADD CONSTRAINT osm_adresy_pkey PRIMARY KEY (id, co);


--
-- Name: osm_adresy_geom; Type: INDEX; Schema: import; Owner: import0; Tablespace: 
--

CREATE INDEX osm_adresy_geom ON osm_adresy USING gist (geom);


--
-- Name: osm_adresy_id; Type: INDEX; Schema: import; Owner: import0; Tablespace: 
--

CREATE INDEX osm_adresy_id ON osm_adresy USING btree (id);


--
-- Name: osm_adresy; Type: ACL; Schema: import; Owner: import0
--

REVOKE ALL ON TABLE osm_adresy FROM PUBLIC;
REVOKE ALL ON TABLE osm_adresy FROM import0;
GRANT ALL ON TABLE osm_adresy TO import0;
GRANT SELECT ON TABLE osm_adresy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

