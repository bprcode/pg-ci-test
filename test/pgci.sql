--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

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
-- Name: fruits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fruits (
    id integer NOT NULL,
    name text,
    flavor text
);


ALTER TABLE public.fruits OWNER TO postgres;

--
-- Name: fruits_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.fruits ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.fruits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: nutrition_info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.nutrition_info (
    fruit_id integer NOT NULL,
    calories integer,
    protein integer,
    carbs integer,
    fat integer
);


ALTER TABLE public.nutrition_info OWNER TO postgres;

--
-- Data for Name: fruits; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fruits (id, name, flavor) FROM stdin;
5	apple	crunchy
25	banana	sweet
26	lime	sour
31	orange	citrussy
32	mango	squishy
\.


--
-- Data for Name: nutrition_info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.nutrition_info (fruit_id, calories, protein, carbs, fat) FROM stdin;
5	100	2	8	3
25	100	2	8	3
26	100	2	8	3
\.


--
-- Name: fruits_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.fruits_id_seq', 32, true);


--
-- Name: fruits fruits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fruits
    ADD CONSTRAINT fruits_pkey PRIMARY KEY (id);


--
-- Name: nutrition_info nutrition_info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutrition_info
    ADD CONSTRAINT nutrition_info_pkey PRIMARY KEY (fruit_id);


--
-- Name: nutrition_info nutrition_info_fruit_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.nutrition_info
    ADD CONSTRAINT nutrition_info_fruit_id_fkey FOREIGN KEY (fruit_id) REFERENCES public.fruits(id);


--
-- PostgreSQL database dump complete
--

