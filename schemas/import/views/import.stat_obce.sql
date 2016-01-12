--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = import, pg_catalog;

--
-- Name: stat_obce; Type: VIEW; Schema: import; Owner: pedro
--

CREATE VIEW stat_obce AS
 SELECT foo.okres,
    foo.obec,
    foo.celkem,
    foo.importovano,
    round((((foo.importovano)::real / (foo.celkem)::real) * (100)::double precision)) AS procent
   FROM ( SELECT sum(stat_all.celkem) AS celkem,
            sum(stat_all.importovano) AS importovano,
            stat_all.obec,
            stat_all.okres
           FROM stat_all
          GROUP BY stat_all.obec, stat_all.okres) foo
  WHERE (foo.celkem > (4999)::numeric)
  ORDER BY foo.okres, foo.obec;


ALTER TABLE stat_obce OWNER TO pedro;

--
-- Name: stat_obce; Type: ACL; Schema: import; Owner: pedro
--

REVOKE ALL ON TABLE stat_obce FROM PUBLIC;
REVOKE ALL ON TABLE stat_obce FROM pedro;
GRANT ALL ON TABLE stat_obce TO pedro;
GRANT SELECT ON TABLE stat_obce TO PUBLIC;


--
-- PostgreSQL database dump complete
--

