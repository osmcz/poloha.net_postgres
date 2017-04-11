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
-- Name: setseq(); Type: FUNCTION; Schema: osm; Owner: pedro
--

CREATE FUNCTION setseq() RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
perform setval('osm.acls_id_seq', (select max(id) from osm.acls)); 
perform setval('osm.changesets_id_seq', (select max(id) from osm.changesets)); 
perform setval('osm.client_applications_id_seq', (select max(id) from osm.client_applications)); 
perform setval('osm.current_nodes_id_seq', (select max(id) from osm.current_nodes)); 
perform setval('osm.current_relations_id_seq', (select max(id) from osm.current_relations)); 
perform setval('osm.current_ways_id_seq', (select max(id) from osm.current_ways)); 
perform setval('osm.diary_comments_id_seq', (select max(id) from osm.diary_comments)); 
perform setval('osm.diary_entries_id_seq', (select max(id) from osm.diary_entries)); 
perform setval('osm.friends_id_seq', (select max(id) from osm.friends)); 
perform setval('osm.gpx_file_tags_id_seq', (select max(id) from osm.gpx_file_tags)); 
perform setval('osm.gpx_files_id_seq', (select max(id) from osm.gpx_files)); 
perform setval('osm.messages_id_seq', (select max(id) from osm.messages)); 
perform setval('osm.oauth_nonces_id_seq', (select max(id) from osm.oauth_nonces)); 
perform setval('osm.oauth_tokens_id_seq', (select max(id) from osm.oauth_tokens)); 
perform setval('osm.redactions_id_seq', (select max(id) from osm.redactions)); 
perform setval('osm.user_blocks_id_seq', (select max(id) from osm.user_blocks)); 
perform setval('osm.user_roles_id_seq', (select max(id) from osm.user_roles)); 
perform setval('osm.user_tokens_id_seq', (select max(id) from osm.user_tokens)); 
perform setval('osm.users_id_seq', (select max(id) from osm.users));
end;
$$;


ALTER FUNCTION osm.setseq() OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

