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
-- Name: mysql_show_columns; Type: VIEW; Schema: public; Owner: pedro
--

CREATE VIEW mysql_show_columns AS
 SELECT a.column_name AS "Field",
    (a.data_type)::text AS "Type",
    a.is_nullable AS "Null",
        CASE
            WHEN (b.column_name IS NOT NULL) THEN 'PRI'::text
            ELSE NULL::text
        END AS "Key",
    a.column_default AS "Default",
    NULL::text AS "Extra",
    a.table_name
   FROM (information_schema.columns a
     LEFT JOIN information_schema.key_column_usage b ON ((((a.table_schema)::text = (b.table_schema)::text) AND ((a.table_name)::text = (b.table_name)::text))))
  ORDER BY a.ordinal_position;


ALTER TABLE mysql_show_columns OWNER TO pedro;

--
-- Name: mysql_show_columns; Type: ACL; Schema: public; Owner: pedro
--

REVOKE ALL ON TABLE mysql_show_columns FROM PUBLIC;
REVOKE ALL ON TABLE mysql_show_columns FROM pedro;
GRANT ALL ON TABLE mysql_show_columns TO pedro;
GRANT SELECT ON TABLE mysql_show_columns TO PUBLIC;


--
-- PostgreSQL database dump complete
--

