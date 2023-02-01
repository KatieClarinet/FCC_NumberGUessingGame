--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE game;
--
-- Name: game; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE game WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE game OWNER TO freecodecamp;

\connect game

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: player; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.player (
    username character varying(22),
    games_played integer,
    best_guess integer
);


ALTER TABLE public.player OWNER TO freecodecamp;

--
-- Data for Name: player; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.player VALUES ('Amy', 1, 13);
INSERT INTO public.player VALUES ('user_1675251950447', 2, 230);
INSERT INTO public.player VALUES ('user_1675251950448', 5, 370);
INSERT INTO public.player VALUES ('user_1675251975799', 2, 768);
INSERT INTO public.player VALUES ('user_1675251975800', 5, 384);
INSERT INTO public.player VALUES ('user_1675251992697', 2, 519);
INSERT INTO public.player VALUES ('user_1675251992698', 5, 41);
INSERT INTO public.player VALUES ('user_1675251997880', 2, 431);
INSERT INTO public.player VALUES ('user_1675251997881', 5, 156);
INSERT INTO public.player VALUES ('user_1675252041199', 2, 906);
INSERT INTO public.player VALUES ('user_1675252041200', 5, 366);


--
-- PostgreSQL database dump complete
--

