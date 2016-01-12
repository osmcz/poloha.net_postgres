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
-- Name: refresh_adresy(); Type: FUNCTION; Schema: import; Owner: import
--

CREATE FUNCTION refresh_adresy() RETURNS void
    LANGUAGE plpgsql
    AS $$declare v_rec record;
v_ruiango boolean;
v_osmgo boolean;
BEGIN
v_ruiango = false;
v_osmgo = false;
select into v_ruiango (select max(import_timestamp) from ruian.hlavicka) > (select ruian from import.datatimestamp);
select into v_osmgo (select max(created_at) from osm.changesets) > (select osm from import.datatimestamp);
-- if v_osmgo then
if true then
--	update import.datatimestamp set osm=(select max(created_at) from osm.changesets);
	drop index if exists import.osm_adresy_geom;
	drop index if exists import.osm_adresy_id;
	truncate import.osm_adresy;
	insert into import.osm_adresy (id,co,conscriptionnumber,provisionalnumber,streetnumber,housenumber,street,place,suburb,city,postcode,country,is_in,source,sourceaddr,sourceposition,refruian,refruianaddr,version,visible,alternatenumber,provisional,sourceloc,borough,uir)  
		(select id,co,conscriptionnumber,provisionalnumber,streetnumber,housenumber,street,place,suburb,city,postcode,country,is_in,source,sourceaddr,sourceposition,refruian,refruianaddr,version,visible,alternatenumber,provisional,sourceloc,borough,uir from import.osm_adresy_view);
	analyze import.osm_adresy;
	update import.osm_adresy set geom = point.way from gis.cz_point point where co='node' and id=osm_id and way is not NULL;
	update import.osm_adresy set geom = line.way from gis.cz_line line where co='way' and id=osm_id and way is not NULL;
	update import.osm_adresy set geom = polygon.way from gis.cz_polygon polygon where co='way' and id=osm_id and way is not NULL;
	update import.osm_adresy set geom=import.geom_line(id) where geom is NULL and co='way';
	update import.osm_adresy set geom=import.geom_point(id) where geom is NULL and co='node';
	update import.osm_adresy set geom=import.geom_rel(id) where geom is NULL and co='relation';
	delete from import.osm_adresy where geom is NULL;
	create index osm_adresy_geom on import.osm_adresy using gist (geom);
	create index osm_adresy_id on import.osm_adresy using btree (id);
end if;
-- if v_ruiango then
if true then
--	update import.datatimestamp set ruian=(select max(import_timestamp) from ruian.hlavicka);
	refresh materialized view import.ruian_adresy_mview with data;
	drop table if exists osmtables.adresni_misto_deleted;
	create table osmtables.adresni_misto_deleted as select * from ruian.rn_adresni_misto where deleted;
	drop table if exists osmtables.adresni_misto_timestamp;
	create table osmtables.adresni_misto_timestamp as select kod,item_timestamp from ruian.rn_adresni_misto where not deleted;
	select into v_rec import.refresh_duchove();
--	refresh MATERIALIZED VIEW ruian.rozbite_budovy_mview;
--	truncate ruian.rozbite_budovy;
--	insert into ruian.rozbite_budovy select * from ruian.rozbite_budovy_mview;
--	refresh MATERIALIZED VIEW ruian.rozbite_budovy_mview with no data;
	select into v_rec import.update_stats2();
--	select into v_rec ruian.update_dkm();
--	refresh materialized view ruian.dkm_rss_view;
end if;
END;
$$;


ALTER FUNCTION import.refresh_adresy() OWNER TO import;

--
-- PostgreSQL database dump complete
--

