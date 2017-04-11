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
-- Name: osm_adresy_view; Type: VIEW; Schema: import; Owner: import
--

CREATE VIEW osm_adresy_view AS
 SELECT foo3.id,
    (foo3.co)::co AS co,
    foo3.conscriptionnumber,
    foo3.provisionalnumber,
    foo3.streetnumber,
    foo3.housenumber,
    foo3.street,
    foo3.place,
    foo3.suburb,
    foo3.city,
    foo3.postcode,
    foo3.country,
    foo3.is_in,
    foo3.source,
    foo3.sourceaddr,
    foo3.sourceposition,
    foo3.refruian,
    foo3.refruianaddr,
        CASE
            WHEN (foo3.co = 'node'::text) THEN nodes.version
            WHEN (foo3.co = 'way'::text) THEN ways.version
            WHEN (foo3.co = 'relation'::text) THEN relations.version
            ELSE NULL::bigint
        END AS version,
        CASE
            WHEN (foo3.co = 'node'::text) THEN nodes.visible
            WHEN (foo3.co = 'way'::text) THEN ways.visible
            WHEN (foo3.co = 'relation'::text) THEN relations.visible
            ELSE NULL::boolean
        END AS visible,
    foo3.alternatenumber,
    foo3.provisional,
    foo3.sourceloc,
    foo3.borough,
    foo3.uir
   FROM (((( SELECT foo2.id,
            foo2.co,
            max((foo2.conscriptionnumber)::text) AS conscriptionnumber,
            max((foo2.provisionalnumber)::text) AS provisionalnumber,
            max((foo2.streetnumber)::text) AS streetnumber,
            max((foo2.housenumber)::text) AS housenumber,
            max((foo2.street)::text) AS street,
            max((foo2.place)::text) AS place,
            max((foo2.suburb)::text) AS suburb,
            max((foo2.city)::text) AS city,
            max((foo2.postcode)::text) AS postcode,
            max((foo2.country)::text) AS country,
            max((foo2.is_in)::text) AS is_in,
            max((foo2.source)::text) AS source,
            max((foo2.sourceaddr)::text) AS sourceaddr,
            max((foo2.sourceposition)::text) AS sourceposition,
            max((foo2.refruian)::text) AS refruian,
            max((foo2.refruianaddr)::text) AS refruianaddr,
            max((foo2.alternatenumber)::text) AS alternatenumber,
            max((foo2.provisional)::text) AS provisional,
            max((foo2.sourceloc)::text) AS sourceloc,
            max((foo2.borough)::text) AS borough,
            max((foo2.uir)::text) AS uir
           FROM ( SELECT foo1.id,
                    foo1.co,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:conscriptionnumber'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS conscriptionnumber,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:provisionalnumber'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS provisionalnumber,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:streetnumber'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS streetnumber,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:housenumber'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS housenumber,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:street'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS street,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:place'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS place,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:suburb'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS suburb,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:city'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS city,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:postcode'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS postcode,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:country'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS country,
                        CASE
                            WHEN ((foo1.k)::text = 'is_in'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS is_in,
                        CASE
                            WHEN ((foo1.k)::text = 'source'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS source,
                        CASE
                            WHEN ((foo1.k)::text = 'source:addr'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS sourceaddr,
                        CASE
                            WHEN ((foo1.k)::text = 'source:position'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS sourceposition,
                        CASE
                            WHEN ((foo1.k)::text = 'ref:ruian'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS refruian,
                        CASE
                            WHEN ((foo1.k)::text = 'ref:ruian:addr'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS refruianaddr,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:alternatenumber'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS alternatenumber,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:provisional'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS provisional,
                        CASE
                            WHEN ((foo1.k)::text = 'source:loc'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS sourceloc,
                        CASE
                            WHEN ((foo1.k)::text = 'addr:borough'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS borough,
                        CASE
                            WHEN ((foo1.k)::text = 'uir_adr:ADRESA_KOD'::text) THEN foo1.v
                            ELSE NULL::character varying
                        END AS uir
                   FROM ( SELECT 'way'::text AS co,
                            current_way_tags.way_id AS id,
                            current_way_tags.k,
                            current_way_tags.v
                           FROM osm.current_way_tags
                          WHERE ((current_way_tags.k)::text IN ( SELECT itags_osmadresy.tag
                                   FROM osmtables.itags_osmadresy))
                        UNION
                         SELECT 'node'::text AS co,
                            current_node_tags.node_id AS id,
                            current_node_tags.k,
                            current_node_tags.v
                           FROM osm.current_node_tags
                          WHERE ((current_node_tags.k)::text IN ( SELECT itags_osmadresy.tag
                                   FROM osmtables.itags_osmadresy))
                        UNION
                         SELECT 'relation'::text AS co,
                            current_relation_tags.relation_id AS id,
                            current_relation_tags.k,
                            current_relation_tags.v
                           FROM osm.current_relation_tags
                          WHERE ((current_relation_tags.k)::text IN ( SELECT itags_osmadresy.tag
                                   FROM osmtables.itags_osmadresy))) foo1) foo2
          GROUP BY foo2.id, foo2.co) foo3
     LEFT JOIN osm.current_nodes nodes ON (((foo3.id = nodes.id) AND (foo3.co = 'node'::text))))
     LEFT JOIN osm.current_ways ways ON (((foo3.id = ways.id) AND (foo3.co = 'way'::text))))
     LEFT JOIN osm.current_relations relations ON (((foo3.id = relations.id) AND (foo3.co = 'relation'::text))))
  WHERE ((foo3.conscriptionnumber IS NOT NULL) OR (foo3.provisionalnumber IS NOT NULL) OR (foo3.streetnumber IS NOT NULL) OR (foo3.housenumber IS NOT NULL) OR (foo3.street IS NOT NULL) OR (foo3.refruianaddr IS NOT NULL) OR (foo3.refruian IS NOT NULL));


ALTER TABLE osm_adresy_view OWNER TO import;

--
-- Name: osm_adresy_view; Type: ACL; Schema: import; Owner: import
--

GRANT SELECT ON TABLE osm_adresy_view TO PUBLIC;


--
-- PostgreSQL database dump complete
--

