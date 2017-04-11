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
-- Name: user_blocks; Type: TABLE; Schema: osm; Owner: osm
--

CREATE TABLE user_blocks (
    id integer NOT NULL,
    user_id bigint NOT NULL,
    creator_id bigint NOT NULL,
    reason text NOT NULL,
    ends_at timestamp without time zone NOT NULL,
    needs_view boolean DEFAULT false NOT NULL,
    revoker_id bigint,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    reason_format format_enum DEFAULT 'markdown'::format_enum NOT NULL
);


ALTER TABLE user_blocks OWNER TO osm;

--
-- Name: user_blocks_id_seq; Type: SEQUENCE; Schema: osm; Owner: osm
--

CREATE SEQUENCE user_blocks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_blocks_id_seq OWNER TO osm;

--
-- Name: user_blocks_id_seq; Type: SEQUENCE OWNED BY; Schema: osm; Owner: osm
--

ALTER SEQUENCE user_blocks_id_seq OWNED BY user_blocks.id;


--
-- Name: user_blocks id; Type: DEFAULT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY user_blocks ALTER COLUMN id SET DEFAULT nextval('user_blocks_id_seq'::regclass);


--
-- Name: user_blocks user_blocks_pkey; Type: CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY user_blocks
    ADD CONSTRAINT user_blocks_pkey PRIMARY KEY (id);


--
-- Name: index_user_blocks_on_user_id; Type: INDEX; Schema: osm; Owner: osm
--

CREATE INDEX index_user_blocks_on_user_id ON user_blocks USING btree (user_id);


--
-- Name: user_blocks user_blocks_moderator_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY user_blocks
    ADD CONSTRAINT user_blocks_moderator_id_fkey FOREIGN KEY (creator_id) REFERENCES users(id);


--
-- Name: user_blocks user_blocks_revoker_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY user_blocks
    ADD CONSTRAINT user_blocks_revoker_id_fkey FOREIGN KEY (revoker_id) REFERENCES users(id);


--
-- Name: user_blocks user_blocks_user_id_fkey; Type: FK CONSTRAINT; Schema: osm; Owner: osm
--

ALTER TABLE ONLY user_blocks
    ADD CONSTRAINT user_blocks_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: user_blocks; Type: ACL; Schema: osm; Owner: osm
--

GRANT SELECT ON TABLE user_blocks TO PUBLIC;


--
-- PostgreSQL database dump complete
--

