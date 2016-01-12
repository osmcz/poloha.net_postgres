--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osm, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: user_preferences; Type: TABLE; Schema: osm; Owner: osm; Tablespace: 
--

CREATE TABLE user_preferences (
    user_id bigint NOT NULL,
    k character varying(255) NOT NULL,
    v character varying(255) NOT NULL
);


ALTER TABLE user_preferences OWNER TO osm;

--
-- Name: user_preferences_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm; Tablespace: 
--

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT user_preferences_pkey PRIMARY KEY (user_id, k);


--
-- Name: user_preferences_user_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY user_preferences
    ADD CONSTRAINT user_preferences_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: user_preferences; Type: ACL; Schema: osm; Owner: osm
--

REVOKE ALL ON TABLE user_preferences FROM PUBLIC;
REVOKE ALL ON TABLE user_preferences FROM osm;
GRANT ALL ON TABLE user_preferences TO osm;
GRANT SELECT ON TABLE user_preferences TO PUBLIC;


--
-- PostgreSQL database dump complete
--

