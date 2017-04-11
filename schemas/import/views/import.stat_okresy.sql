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

SET search_path = import, pg_catalog;

--
-- Name: stat_okresy; Type: VIEW; Schema: import; Owner: pedro
--

CREATE VIEW stat_okresy AS
 SELECT foo.okres,
    foo.celkem,
    foo.importovano,
    round((((foo.importovano)::real / (foo.celkem)::real) * (100)::double precision)) AS procent
   FROM ( SELECT sum(stat_all.celkem) AS celkem,
            sum(stat_all.importovano) AS importovano,
            stat_all.okres
           FROM stat_all
          GROUP BY stat_all.okres) foo
  ORDER BY foo.okres;


ALTER TABLE stat_okresy OWNER TO pedro;

--
-- Name: stat_okresy; Type: ACL; Schema: import; Owner: pedro
--

GRANT SELECT ON TABLE stat_okresy TO PUBLIC;


--
-- PostgreSQL database dump complete
--

