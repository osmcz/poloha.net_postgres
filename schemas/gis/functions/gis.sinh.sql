--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN2';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = gis, pg_catalog;

--
-- Name: sinh(double precision); Type: FUNCTION; Schema: gis; Owner: pedro
--

CREATE FUNCTION sinh(n double precision) RETURNS double precision
    LANGUAGE plpgsql IMMUTABLE COST 10
    AS $$
declare
BEGIN
return  (1 - power(2.7182818284, -2*n)) / (2 * power(2.7182818284, -n));
  END;
$$;


ALTER FUNCTION gis.sinh(n double precision) OWNER TO pedro;

--
-- Name: sinh(double precision); Type: ACL; Schema: gis; Owner: pedro
--

REVOKE ALL ON FUNCTION sinh(n double precision) FROM PUBLIC;
REVOKE ALL ON FUNCTION sinh(n double precision) FROM pedro;
GRANT ALL ON FUNCTION sinh(n double precision) TO pedro;
GRANT ALL ON FUNCTION sinh(n double precision) TO PUBLIC;


--
-- PostgreSQL database dump complete
--

