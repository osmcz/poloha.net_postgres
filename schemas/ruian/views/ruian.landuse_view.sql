--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = ruian, pg_catalog;

--
-- Name: landuse_view; Type: VIEW; Schema: ruian; Owner: pedro
--

CREATE VIEW landuse_view AS
 SELECT l.kod,
    l.hranice,
    z.nazev,
    (OPERATOR(public.%#) z.tagy) AS keys
   FROM (landuse l
     LEFT JOIN ( SELECT DISTINCT ON (zpusoby_vyuziti_parcel.kod) zpusoby_vyuziti_parcel.kod,
            zpusoby_vyuziti_parcel.druh_pozemku_kod,
            zpusoby_vyuziti_parcel.zpusob_vyu_poz_kod,
            zpusoby_vyuziti_parcel.nazev,
            zpusoby_vyuziti_parcel.tagy,
            zpusoby_vyuziti_parcel.color,
            zpusoby_vyuziti_parcel.opacity,
            zpusoby_vyuziti_parcel.usable
           FROM osmtables.zpusoby_vyuziti_parcel) z ON ((l.kod = z.kod)));


ALTER TABLE landuse_view OWNER TO pedro;

--
-- Name: landuse_view; Type: ACL; Schema: ruian; Owner: pedro
--

REVOKE ALL ON TABLE landuse_view FROM PUBLIC;
REVOKE ALL ON TABLE landuse_view FROM pedro;
GRANT ALL ON TABLE landuse_view TO pedro;
GRANT SELECT ON TABLE landuse_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

