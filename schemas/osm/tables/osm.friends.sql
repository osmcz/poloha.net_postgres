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
-- Name: friends; Type: TABLE; Schema: osm; Owner: osm
--

CREATE TABLE friends (
    id bigint NOT NULL,
    user_id bigint NOT NULL,
    friend_user_id bigint NOT NULL
);


ALTER TABLE friends OWNER TO osm;

--
-- Name: friends_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE friends_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE friends_id_seq OWNER TO osm;

--
-- Name: friends_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE friends_id_seq OWNED BY friends.id;


--
-- Name: friends id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY friends ALTER COLUMN id SET DEFAULT nextval('friends_id_seq'::regclass);


--
-- Name: friends friends_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY (id);


--
-- Name: friends_user_id_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX friends_user_id_idx ON friends USING btree (user_id);


--
-- Name: user_id_idx; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX user_id_idx ON friends USING btree (friend_user_id);


--
-- Name: friends friends_friend_user_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_friend_user_id_fkey FOREIGN KEY (friend_user_id) REFERENCES users(id);


--
-- Name: friends friends_user_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: friends; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE friends TO PUBLIC;


--
-- PostgreSQL database dump complete
--

