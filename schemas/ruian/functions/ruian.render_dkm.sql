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
-- Name: render_dkm(); Type: FUNCTION; Schema: ruian; Owner: pedro
--

CREATE FUNCTION render_dkm() RETURNS void
    LANGUAGE plpgsql COST 1
    AS $$
DECLARE
BEGIN
perform ruian.render_ruian(ruian.renderbox(ku.hranice)) from ruian.dkm dkm
inner join ruian.rn_katastralni_uzemi ku on dkm.kod=ku.kod
where dkm.new and not ku.deleted;
update ruian.dkm set new=false where new;
return;
END;
$$;


ALTER FUNCTION ruian.render_dkm() OWNER TO pedro;

--
-- PostgreSQL database dump complete
--

