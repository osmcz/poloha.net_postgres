--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

--
-- Name: tablesizes; Type: VIEW; Schema: public; Owner: pedro
--

CREATE VIEW tablesizes AS
 SELECT (((n.nspname)::text || '.'::text) || (c.relname)::text) AS tablename,
    pg_relation_size((c.oid)::regclass) AS size,
    pg_size_pretty(pg_relation_size((c.oid)::regclass)) AS hsize
   FROM (pg_class c
     LEFT JOIN pg_namespace n ON ((n.oid = c.relnamespace)))
  WHERE (n.nspname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name]))
  ORDER BY pg_relation_size((c.oid)::regclass);


ALTER TABLE tablesizes OWNER TO pedro;

--
-- Name: tablesizes; Type: ACL; Schema: public; Owner: pedro
--

REVOKE ALL ON TABLE tablesizes FROM PUBLIC;
REVOKE ALL ON TABLE tablesizes FROM pedro;
GRANT ALL ON TABLE tablesizes TO pedro;
GRANT SELECT ON TABLE tablesizes TO PUBLIC;


--
-- PostgreSQL database dump complete
--

