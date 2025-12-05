--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.22
-- Dumped by pg_dump version 9.6.22

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

ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS producer_id_fk;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_token_unique;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_email_unique;
DROP TABLE IF EXISTS public.users;
SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: users; Type: TABLE; Schema: public; Owner: kaja9241_openproduct
--

CREATE TABLE public.users (
    id text NOT NULL,
    provider text DEFAULT 'email'::text NOT NULL,
    provider_id text DEFAULT ''::text NOT NULL,
    email text NOT NULL,
    firstname text NOT NULL,
    lastname text NOT NULL,
    role text DEFAULT 'USER'::text NOT NULL,
    verified boolean DEFAULT false NOT NULL,
    receive_email boolean DEFAULT true NOT NULL,
    password text,
    token text,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    producer_id integer
);


ALTER TABLE public.users OWNER TO kaja9241_openproduct;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kaja9241_openproduct
--

COPY public.users (id, provider, provider_id, email, firstname, lastname, role, verified, receive_email, password, token, created_at, updated_at, producer_id) FROM stdin;
296b778c-d0ef-41f0-9434-c3b37847f20b	email		colorant14@ntymail.com	coralie	leray	USER	t	t	$argon2id$v=19$m=19456,t=2,p=1$krzF4JnDxpPbGLx9vB/Xjw$0+jFOe9SCDkjcYcOnMD9/IKzNMD2DWxmy36YqR1V2Ag	57726656-6be5-4717-a61c-cdc563a9161f	2025-10-31 10:36:44.866+01	2025-10-31 10:36:44.866+01	2405
d6573c95-c288-4cb4-b29d-18f99ca20e4e	email		myriam.roux@wanadoo.fr	Myriam	ROUX	USER	t	t	$argon2id$v=19$m=19456,t=2,p=1$mdeVTupgXyEr8oeXsAGljg$SPe7D+rQQHc8rs2KcM3RvnM7wki89fitHzWJLNkzm7w	deef7ce2-8d22-467a-8557-bf7d14b69e7f	2025-11-02 10:05:52.495+01	2025-11-02 10:05:52.495+01	2580
4036a8ef-fe76-477b-b211-89722ccd030e	email		contact@heroncendre.com	Simon	Descarpentries	USER	t	t	$argon2id$v=19$m=19456,t=2,p=1$GUvVUVg9uHodKM6+glYKOg$je5xWD0sS9+lCgJJ1zVDeK1W24FINvNs65pLBm7MkTc	19ab773d-b116-43b6-9746-20f87c62aa98	2025-11-06 10:51:34.975+01	2025-11-06 10:51:34.975+01	\N
82266a7c-c430-43b8-bc3f-776b688f9862	email		laurent.bigot11@orange.fr	Laurent	Bigot	USER	t	t	$argon2id$v=19$m=19456,t=2,p=1$Ofe0/ZrKBuTN+Vww/jXYWg$c0C9yDNyZ6P43aWDovH+NC4WmYuvqDw5NfYxwshizkE	27425bf0-f1eb-41b7-a861-91ccac7bb25a	2025-11-10 14:12:08.369+01	2025-11-10 14:12:08.369+01	\N
58c2fef9-e880-4791-8d23-13b373757a6a	email		lesptitesplantes@orange.fr	Françoise	Caneiro	USER	t	t	$argon2id$v=19$m=19456,t=2,p=1$J2OvlK6FEwZ4zlPRzZvjvQ$l8tNOmpt1M2T0gQYWYG/DJoMqejjah5YYa+Sy+KAI7Y	f4103031-a75b-4ba9-964f-ca3bec812ece	2025-10-26 18:53:19.008+01	2025-10-26 18:53:19.008+01	\N
a153a547-32ce-4255-9b69-977472bbe421	email		contact@aleyria.fr	William	JEANCOLAS	USER	t	t	$argon2id$v=19$m=19456,t=2,p=1$IkR63sV89FsdZeY2Mzz1WA$2SWFl8sfFz0DAxZH5wfWg1kjWY54n2nZsJuwsA7jsl0	926399f7-5bd3-499b-8b52-28b9a83cfb1e	2025-10-27 13:21:34.2+01	2025-10-27 13:21:34.2+01	\N
2cf2819f-9c1d-44a9-83bd-61fe28741b0b	email		le.potager.de.ceignes@gmail.com	Samuel	BERNARD	USER	t	t	$argon2id$v=19$m=19456,t=2,p=1$OFAFhwz/ijor6awbCO+Qyg$JlZ+TBCpG8gcIPgDsYVVmy6/p0oTaucvhexvXoA9okg	029c2bca-2bed-4d9b-a8ff-00e7089a088e	2025-10-27 23:01:21.455+01	2025-10-27 23:01:21.455+01	\N
710feaed-edb0-4fcb-af7c-ecaa5f32df84	email		philippe@dromeadhere.tv	Philippe	Couvreur	USER	t	t	$argon2id$v=19$m=19456,t=2,p=1$9x8M1C9b7VSP27mw3wFXWA$AbkPjxInPVRBPnltPuhd+ip1L77eG4A5JzMrgNZOfgU	2add68ee-ca4b-4d81-a624-8039c3dbdbf3	2025-11-11 11:13:02.839+01	2025-11-11 11:13:02.839+01	\N
2a817780-6f29-4ac3-a633-343517840384	email		contact@openhomesystem.com	Albéric	de la Crochais	ADMIN	t	t	$argon2id$v=19$m=19456,t=2,p=1$ycRtDe7kX85I95eMzDBp/A$JyAwZt+fu9UYI2Yn/u0IrpDHJ2iyXhQd58oQyzbr/7s	2bb655e1-346b-4530-b6cf-5099f30f70c0	2025-10-22 20:15:38.02+02	2025-10-22 20:15:38.02+02	11960
77935c80-80cf-4850-9841-0963185d19f1	email		thierrybonnamour@laposte.net	Thierry	Bonnamour	USER	t	t	$argon2id$v=19$m=19456,t=2,p=1$wcBv+GhGF4YxTdaQVtZC8A$u8HKq13TxFP3ZB1MtIjRhwbMebAhdfozB3RQ0UQgV0o	b18d0449-273a-4846-8754-c17b1d5f734d	2025-11-21 13:40:38.42+01	2025-11-21 13:40:38.42+01	\N
\.


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_token_unique; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_token_unique UNIQUE (token);


--
-- Name: users producer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT producer_id_fk FOREIGN KEY (producer_id) REFERENCES public.producers(id);


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: kaja9241_openproduct
--

GRANT ALL ON TABLE public.users TO kaja9241_svelte;


--
-- PostgreSQL database dump complete
--

