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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL,
    games_played integer,
    best_game integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1690543215773', NULL, NULL);
INSERT INTO public.users VALUES (2, 'user_1690543215772', NULL, NULL);
INSERT INTO public.users VALUES (3, 'user_1690543780490', NULL, NULL);
INSERT INTO public.users VALUES (4, 'user_1690543780489', NULL, NULL);
INSERT INTO public.users VALUES (5, 'user_1690543840277', NULL, NULL);
INSERT INTO public.users VALUES (6, 'user_1690543840276', NULL, NULL);
INSERT INTO public.users VALUES (8, 'user_1690545075458', NULL, NULL);
INSERT INTO public.users VALUES (9, 'user_1690545075457', NULL, NULL);
INSERT INTO public.users VALUES (7, 'd', 1, 0);
INSERT INTO public.users VALUES (11, 'user_1690547178214', 1, 0);
INSERT INTO public.users VALUES (10, 'user_1690547178215', 1, 0);
INSERT INTO public.users VALUES (12, 'l', 1, 0);
INSERT INTO public.users VALUES (14, 'user_1690547728585', 1, 771);
INSERT INTO public.users VALUES (13, 'user_1690547728586', 1, 695);
INSERT INTO public.users VALUES (16, 'user_1690547946234', 1, 244);
INSERT INTO public.users VALUES (15, 'user_1690547946235', 1, 689);
INSERT INTO public.users VALUES (18, 'user_1690548078291', 1, 34);
INSERT INTO public.users VALUES (17, 'user_1690548078292', 1, 620);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 18, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

