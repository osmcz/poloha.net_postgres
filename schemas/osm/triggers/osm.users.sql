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

--
-- Name: users users_suspend; Type: TRIGGER; Schema: osm; Owner: osm
--

CREATE TRIGGER users_suspend BEFORE INSERT OR UPDATE ON users FOR EACH ROW EXECUTE PROCEDURE users_suspend();


--
-- Name: users; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE users TO PUBLIC;


--
-- PostgreSQL database dump complete
--

