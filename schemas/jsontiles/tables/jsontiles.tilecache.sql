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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: tilecache; Type: TABLE; Schema: jsontiles; Owner: pedro; Tablespace: 
--

CREATE TABLE tilecache (
    z smallint NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL,
    created timestamp with time zone DEFAULT now(),
    tile json,
    times_read integer DEFAULT 0
);


ALTER TABLE tilecache OWNER TO pedro;

--
-- Name: tilecache_pkey; Type: CONSTRAINT; Schema: jsontiles; Owner: pedro; Tablespace: 
--

ALTER TABLE ONLY tilecache
    ADD CONSTRAINT tilecache_pkey PRIMARY KEY (z, x, y);


--
-- Name: tilecache; Type: ACL; Schema: jsontiles; Owner: pedro
--

REVOKE ALL ON TABLE tilecache FROM PUBLIC;
REVOKE ALL ON TABLE tilecache FROM pedro;
GRANT ALL ON TABLE tilecache TO pedro;
GRANT SELECT ON TABLE tilecache TO PUBLIC;
GRANT ALL ON TABLE tilecache TO mapnik;


--
-- PostgreSQL database dump complete
--

