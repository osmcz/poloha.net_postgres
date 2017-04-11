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

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = true;

--
-- Name: vmstat; Type: TABLE; Schema: public; Owner: pedro
--

CREATE TABLE vmstat (
    procs_r integer,
    procs_b integer,
    memory_swpd integer,
    memory_free integer,
    memory_buff integer,
    memory_cache integer,
    swap_si integer,
    swap_so integer,
    io_bi integer,
    io_bo integer,
    system_in integer,
    system_cs integer,
    cpu_us integer,
    cpu_sy integer,
    cpu_id integer,
    cpu_wa integer
);


ALTER TABLE vmstat OWNER TO pedro;

--
-- Name: vmstat; Type: ACL; Schema: public; Owner: pedro
--

GRANT SELECT ON TABLE vmstat TO PUBLIC;


--
-- PostgreSQL database dump complete
--

