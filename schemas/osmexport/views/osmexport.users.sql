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

SET search_path = osmexport, pg_catalog;

--
-- Name: users; Type: VIEW; Schema: osmexport; Owner: pedro
--

CREATE VIEW users AS
 SELECT users.email,
    users.id,
    users.pass_crypt,
    users.creation_time,
    users.display_name,
    users.data_public,
    users.description,
    users.home_lat,
    users.home_lon,
    users.home_zoom,
    users.nearby,
    users.pass_salt,
    users.image_file_name,
    users.email_valid,
    users.new_email,
    users.creation_ip,
    users.languages,
    users.status,
    users.terms_agreed,
    users.consider_pd,
    users.auth_uid AS openid_url,
    users.preferred_editor,
    users.terms_seen,
    users.description_format,
    users.image_fingerprint,
    users.changesets_count,
    users.traces_count,
    users.diary_entries_count,
    users.image_use_gravatar,
    users.image_content_type
   FROM osm.users;


ALTER TABLE users OWNER TO pedro;

--
-- Name: users; Type: ACL; Schema: osmexport; Owner: pedro
--

GRANT SELECT ON TABLE users TO PUBLIC;
GRANT SELECT ON TABLE users TO osmexport;


--
-- PostgreSQL database dump complete
--

