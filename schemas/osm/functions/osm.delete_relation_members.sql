--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = osm, pg_catalog;

--
-- Name: delete_relation_members(); Type: FUNCTION; Schema: osm; Owner: osm
--

CREATE FUNCTION delete_relation_members() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
v_version bigint;
i smallint;
BEGIN
select into v_version version from osm.current_relation_members a
	left join osm.current_relations b on a.relation_id=b.id
	where a.relation_id=old.relation_id and a.member_type=old.member_type and a.member_id=old.member_id;
select into i 1 from osm.relation_members where relation_id=old.relation_id and version=v_version and member_type=old.member_type and member_id=old.member_id;
if not found then
	perform (select osm.insert_relation(old.relation_id));
	insert into osm.relation_members (relation_id,member_type,member_id,member_role,version,sequence_id)
		values (old.relation_id,old.member_type,old.member_id,old.member_role,v_version,old.sequence_id);
end if;
return old;
END;$$;


ALTER FUNCTION osm.delete_relation_members() OWNER TO osm;

--
-- PostgreSQL database dump complete
--

