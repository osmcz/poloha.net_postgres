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
-- Name: index_read; Type: VIEW; Schema: public; Owner: pedro
--

CREATE VIEW index_read AS
 SELECT i.indexrelid,
    i.schemaname,
    i.relname AS tablename,
    i.indexrelname AS indexname,
    n.tablespace,
    n.indexdef,
    pg_size_pretty((((c.relpages * 8) * 1024))::numeric) AS pg_size_pretty,
    i.idx_scan,
    i.idx_tup_read,
    i.idx_tup_fetch
   FROM ((pg_stat_user_indexes i
     LEFT JOIN pg_indexes n ON (((i.schemaname = n.schemaname) AND (i.indexrelname = n.indexname))))
     LEFT JOIN pg_class c ON ((c.oid = i.indexrelid)))
  WHERE (((i.schemaname <> ALL (ARRAY['pg_catalog'::name, 'information_schema'::name])) AND (i.schemaname !~ '^pg_toast'::text)) AND (i.idx_scan = 0))
  ORDER BY c.relpages DESC;


ALTER TABLE index_read OWNER TO pedro;

--
-- Name: index_read; Type: ACL; Schema: public; Owner: pedro
--

REVOKE ALL ON TABLE index_read FROM PUBLIC;
REVOKE ALL ON TABLE index_read FROM pedro;
GRANT ALL ON TABLE index_read TO pedro;
GRANT SELECT ON TABLE index_read TO PUBLIC;


--
-- PostgreSQL database dump complete
--

