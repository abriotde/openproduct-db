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

ALTER TABLE IF EXISTS ONLY public.sessions DROP CONSTRAINT IF EXISTS sessions_user_id_users_id_fk;
ALTER TABLE IF EXISTS ONLY public.producers DROP CONSTRAINT IF EXISTS producers_user_id_fkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS producer_id_fk;
ALTER TABLE IF EXISTS ONLY public.producers_products DROP CONSTRAINT IF EXISTS producer_id_fk;
ALTER TABLE IF EXISTS ONLY public.producers_products DROP CONSTRAINT IF EXISTS "porduct_id_FK";
DROP INDEX IF EXISTS public.producers_products_product_id_idx;
DROP INDEX IF EXISTS public.idx_relationships_parent;
DROP INDEX IF EXISTS public.idx_relationships_child;
DROP INDEX IF EXISTS public.idx_products_name;
DROP INDEX IF EXISTS public.idx_products_is_collection;
DROP INDEX IF EXISTS public.idx_products_hierarchy_level;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_token_unique;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_pkey;
ALTER TABLE IF EXISTS ONLY public.users DROP CONSTRAINT IF EXISTS users_email_unique;
ALTER TABLE IF EXISTS ONLY public.stats_day DROP CONSTRAINT IF EXISTS stats_day_pk;
ALTER TABLE IF EXISTS ONLY public.sessions DROP CONSTRAINT IF EXISTS sessions_pkey;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_unique;
ALTER TABLE IF EXISTS ONLY public.products DROP CONSTRAINT IF EXISTS products_pkey;
ALTER TABLE IF EXISTS ONLY public.product_relationships DROP CONSTRAINT IF EXISTS product_relationships_pkey;
ALTER TABLE IF EXISTS ONLY public.product_relationships DROP CONSTRAINT IF EXISTS product_relationships_parent_id_child_id_key;
ALTER TABLE IF EXISTS ONLY public.producers DROP CONSTRAINT IF EXISTS producers_unique_siret;
ALTER TABLE IF EXISTS ONLY public.producers DROP CONSTRAINT IF EXISTS producers_unique_phone;
ALTER TABLE IF EXISTS ONLY public.producers DROP CONSTRAINT IF EXISTS producers_unique_coord;
ALTER TABLE IF EXISTS ONLY public.producers DROP CONSTRAINT IF EXISTS producers_unique_adress;
ALTER TABLE IF EXISTS ONLY public.producers_products DROP CONSTRAINT IF EXISTS producers_products_unique;
ALTER TABLE IF EXISTS ONLY public.producers DROP CONSTRAINT IF EXISTS producers_pkey;
ALTER TABLE IF EXISTS public.producers ALTER COLUMN id DROP DEFAULT;
DROP TABLE IF EXISTS public.users;
DROP TABLE IF EXISTS public.stats_day;
DROP TABLE IF EXISTS public.sessions;
DROP TABLE IF EXISTS public.products;
DROP TABLE IF EXISTS public.product_relationships;
DROP TABLE IF EXISTS public.producers_products;
DROP SEQUENCE IF EXISTS public.producers_id_seq;
DROP TABLE IF EXISTS public.producers;
DROP FUNCTION IF EXISTS public.update_products_used();
DROP FUNCTION IF EXISTS public.search_products_with_children(search_term character varying);
DROP FUNCTION IF EXISTS public.get_all_descendants(product_id integer);
DROP FUNCTION IF EXISTS public.get_all_ancestors(product_id integer);
DROP FUNCTION IF EXISTS public.check_path_exists(from_id integer, to_id integer);
DROP FUNCTION IF EXISTS public.check_hierarchy_before_insert();
DROP TYPE IF EXISTS public.enumwebsitestatus;
DROP TYPE IF EXISTS public.enumstatus;
DROP TYPE IF EXISTS public.enumproducerstatus;
DROP EXTENSION IF EXISTS plpgsql;
DROP SCHEMA IF EXISTS public;
--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: enumproducerstatus; Type: TYPE; Schema: public; Owner: kaja9241_openproduct
--

CREATE TYPE public.enumproducerstatus AS ENUM (
    'actif',
    'hs',
    'to-check',
    'unknown',
    'hors-sujet',
    'non-interesse'
);


ALTER TYPE public.enumproducerstatus OWNER TO kaja9241_openproduct;

--
-- Name: enumstatus; Type: TYPE; Schema: public; Owner: kaja9241_openproduct
--

CREATE TYPE public.enumstatus AS ENUM (
    'ok',
    'ko',
    'unknown'
);


ALTER TYPE public.enumstatus OWNER TO kaja9241_openproduct;

--
-- Name: enumwebsitestatus; Type: TYPE; Schema: public; Owner: kaja9241_openproduct
--

CREATE TYPE public.enumwebsitestatus AS ENUM (
    'ok',
    'ko',
    '400',
    '500',
    'ConnectionError',
    'unknown'
);


ALTER TYPE public.enumwebsitestatus OWNER TO kaja9241_openproduct;

--
-- Name: check_hierarchy_before_insert(); Type: FUNCTION; Schema: public; Owner: kaja9241_openproduct
--

CREATE FUNCTION public.check_hierarchy_before_insert() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
    parent_level INT;
    child_level INT;
BEGIN
    -- Récupérer les niveaux hiérarchiques
    SELECT hierarchy_level INTO parent_level FROM products WHERE id = NEW.parent_id;
    SELECT hierarchy_level INTO child_level FROM products WHERE id = NEW.child_id;
    
    -- Vérifier que le niveau de l'enfant est supérieur au parent
    IF child_level <= parent_level THEN
        RAISE EXCEPTION 'Le niveau hiérarchique de l''enfant (%) doit être supérieur au parent (%)', 
            child_level, parent_level;
    END IF;
    
    -- Vérifier qu'il n'y a pas de cycle
    IF check_path_exists(NEW.child_id, NEW.parent_id) THEN
        RAISE EXCEPTION 'Cycle détecté : le produit % est déjà un ancêtre de %', 
            NEW.child_id, NEW.parent_id;
    END IF;
    
    RETURN NEW;
END;
$$;


ALTER FUNCTION public.check_hierarchy_before_insert() OWNER TO kaja9241_openproduct;

--
-- Name: check_path_exists(integer, integer); Type: FUNCTION; Schema: public; Owner: kaja9241_openproduct
--

CREATE FUNCTION public.check_path_exists(from_id integer, to_id integer) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
DECLARE
    path_count INT;
BEGIN
    WITH RECURSIVE path AS (
        SELECT child_id as node
        FROM product_relationships
        WHERE parent_id = from_id
        
        UNION
        
        SELECT pr.child_id
        FROM product_relationships pr
        INNER JOIN path p ON pr.parent_id = p.node
    )
    SELECT COUNT(*) INTO path_count FROM path WHERE node = to_id;
    
    RETURN path_count > 0;
END;
$$;


ALTER FUNCTION public.check_path_exists(from_id integer, to_id integer) OWNER TO kaja9241_openproduct;

--
-- Name: get_all_ancestors(integer); Type: FUNCTION; Schema: public; Owner: kaja9241_openproduct
--

CREATE FUNCTION public.get_all_ancestors(product_id integer) RETURNS TABLE(ancestor_id integer, name text, depth integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE ancestors AS (
        SELECT parent_id as asc_product_id, 1 as depth
        FROM product_relationships
        WHERE child_id = product_id
        
        UNION ALL

        SELECT pr.parent_id, a.depth + 1
        FROM product_relationships pr
        INNER JOIN ancestors a ON pr.child_id = a.asc_product_id
    )
    SELECT DISTINCT a.asc_product_id as ancestor_id, p.name, MIN(a.depth) as depth
    FROM ancestors a
    inner join products p on p.id =a.asc_product_id
    GROUP BY ancestor_id, p.name
    ORDER BY depth, ancestor_id;
END;
$$;


ALTER FUNCTION public.get_all_ancestors(product_id integer) OWNER TO kaja9241_openproduct;

--
-- Name: get_all_descendants(integer); Type: FUNCTION; Schema: public; Owner: kaja9241_openproduct
--

CREATE FUNCTION public.get_all_descendants(product_id integer) RETURNS TABLE(descendant_id integer, name text, depth integer)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    WITH RECURSIVE descendants AS (
        SELECT child_id as desc_product_id, 1 as deep
        FROM product_relationships
        WHERE parent_id = product_id
        UNION ALL
        SELECT pr.child_id, d.deep + 1
        FROM product_relationships pr
        INNER JOIN descendants d ON pr.parent_id = d.desc_product_id
        WHERE pr.child_id != product_id
    )
    SELECT desc_product_id, p.name, MIN(deep) as depth
    FROM descendants d
    inner join products p on p.id =d.desc_product_id
    GROUP BY desc_product_id, p.name
    ORDER BY depth, p.name;
END;
$$;


ALTER FUNCTION public.get_all_descendants(product_id integer) OWNER TO kaja9241_openproduct;

--
-- Name: search_products_with_children(character varying); Type: FUNCTION; Schema: public; Owner: kaja9241_openproduct
--

CREATE FUNCTION public.search_products_with_children(search_term character varying) RETURNS TABLE(id integer, name character varying, description text, is_collection boolean, hierarchy_level integer, price numeric, is_direct_match boolean)
    LANGUAGE plpgsql
    AS $$
BEGIN
    RETURN QUERY
    WITH matching_products AS (
        SELECT p.id
        FROM products p
        WHERE p.name ILIKE '%' || search_term || '%'
    )
    SELECT DISTINCT
        p.id,
        p.name,
        p.description,
        p.is_collection,
        p.hierarchy_level,
        p.price,
        CASE WHEN p.id IN (SELECT id FROM matching_products) THEN TRUE ELSE FALSE END as is_direct_match
    FROM products p
    WHERE p.id IN (SELECT id FROM matching_products)
       OR p.id IN (
           SELECT descendant_id 
           FROM matching_products mp
           CROSS JOIN LATERAL get_all_descendants(mp.id)
       )
    ORDER BY is_direct_match DESC, p.hierarchy_level, p.name;
END;
$$;


ALTER FUNCTION public.search_products_with_children(search_term character varying) OWNER TO kaja9241_openproduct;

--
-- Name: update_products_used(); Type: FUNCTION; Schema: public; Owner: kaja9241_openproduct
--

CREATE FUNCTION public.update_products_used() RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    affected_rows INTEGER;
    iteration INTEGER := 0;
    max_iterations INTEGER := 100; -- Protection contre les boucles infinies
BEGIN
    -- Étape 1: Initialiser tous les produits à used = false
    UPDATE products SET used = false;
    RAISE NOTICE 'Étape 1: Tous les produits initialisés à used = false';

    -- Étape 2: Marquer comme used = true les produits liés à un producteur
    UPDATE products
    SET used = true
    WHERE id IN (
        SELECT DISTINCT product_id
        FROM producers_products
    );
    
    GET DIAGNOSTICS affected_rows = ROW_COUNT;
    RAISE NOTICE 'Étape 2: % produits marqués comme utilisés (liés à des producteurs)', affected_rows;

    -- Étape 3: Marquer récursivement tous les parents
    -- On continue tant qu'on trouve de nouveaux parents à marquer
    LOOP
        iteration := iteration + 1;
        
        -- Marquer les parents des produits déjà marqués comme used
        UPDATE products
        SET used = true
        WHERE id IN (
            SELECT DISTINCT pr.parent_id
            FROM product_relationships pr
            INNER JOIN products p ON pr.child_id = p.id
            WHERE p.used = true
              AND pr.parent_id IS NOT NULL
        )
        AND used = false; -- Seulement les produits pas encore marqués
        
        GET DIAGNOSTICS affected_rows = ROW_COUNT;
        RAISE NOTICE 'Étape 3 - Itération %: % parents marqués comme utilisés', iteration, affected_rows;
        
        -- Si aucun nouveau produit n'a été marqué, on arrête
        EXIT WHEN affected_rows = 0;
        
        -- Protection contre les boucles infinies
        IF iteration >= max_iterations THEN
            RAISE WARNING 'Nombre maximum d''itérations atteint (%)', max_iterations;
            EXIT;
        END IF;
    END LOOP;

    RAISE NOTICE 'Fonction terminée après % itérations', iteration;
END;
$$;


ALTER FUNCTION public.update_products_used() OWNER TO kaja9241_openproduct;

--
-- Name: FUNCTION update_products_used(); Type: COMMENT; Schema: public; Owner: kaja9241_openproduct
--

COMMENT ON FUNCTION public.update_products_used() IS 'Initialise used à false pour tous les produits, puis marque comme used = true les produits liés à un producteur et tous leurs parents de manière récursive';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: producers; Type: TABLE; Schema: public; Owner: kaja9241_openproduct
--

CREATE TABLE public.producers (
    id integer NOT NULL,
    user_id text,
    company_name text NOT NULL,
    firstname text,
    lastname text,
    short_description text,
    description text,
    post_code integer DEFAULT 0 NOT NULL,
    city text,
    address text,
    category text,
    phone_number_1 text,
    phone_number_2 text,
    siret_number text,
    website_1 text,
    website_2 text,
    website_3 text,
    created_at timestamp with time zone DEFAULT now(),
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    latitude real DEFAULT 0.0 NOT NULL,
    longitude real DEFAULT 0.0 NOT NULL,
    email character varying,
    moderation_note text,
    siret_status public.enumstatus,
    website_status public.enumwebsitestatus,
    company_infos text,
    opening_hours character varying(1024),
    send_email public.enumstatus,
    closed_at timestamp with time zone,
    status public.enumproducerstatus DEFAULT 'actif'::public.enumproducerstatus NOT NULL,
    token text DEFAULT md5((random())::text),
    has_send_mail boolean DEFAULT false,
    sourcekey character varying,
    imageurl character varying,
    tag integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.producers OWNER TO kaja9241_openproduct;

--
-- Name: producers_id_seq; Type: SEQUENCE; Schema: public; Owner: kaja9241_openproduct
--

CREATE SEQUENCE public.producers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producers_id_seq OWNER TO kaja9241_openproduct;

--
-- Name: producers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: kaja9241_openproduct
--

ALTER SEQUENCE public.producers_id_seq OWNED BY public.producers.id;


--
-- Name: producers_products; Type: TABLE; Schema: public; Owner: kaja9241_openproduct
--

CREATE TABLE public.producers_products (
    product_id integer,
    producer_id integer
);


ALTER TABLE public.producers_products OWNER TO kaja9241_openproduct;

--
-- Name: product_relationships; Type: TABLE; Schema: public; Owner: kaja9241_openproduct
--

CREATE TABLE public.product_relationships (
    id integer NOT NULL,
    parent_id integer NOT NULL,
    child_id integer NOT NULL,
    relationship_type character varying(50) DEFAULT 'variant'::character varying,
    created_at timestamp without time zone DEFAULT now(),
    CONSTRAINT product_relationships_check CHECK ((parent_id <> child_id))
);


ALTER TABLE public.product_relationships OWNER TO kaja9241_openproduct;

--
-- Name: products; Type: TABLE; Schema: public; Owner: kaja9241_openproduct
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text NOT NULL,
    description text,
    is_collection boolean DEFAULT false,
    hierarchy_level integer DEFAULT 0 NOT NULL,
    price numeric(10,2),
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now(),
    used boolean DEFAULT false NOT NULL
);


ALTER TABLE public.products OWNER TO kaja9241_openproduct;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: kaja9241_openproduct
--

CREATE TABLE public.sessions (
    id text NOT NULL,
    user_id text NOT NULL,
    expires_at timestamp with time zone NOT NULL
);


ALTER TABLE public.sessions OWNER TO kaja9241_openproduct;

--
-- Name: stats_day; Type: TABLE; Schema: public; Owner: kaja9241_openproduct
--

CREATE TABLE public.stats_day (
    date date NOT NULL,
    website_uniq_visit integer
);


ALTER TABLE public.stats_day OWNER TO kaja9241_openproduct;

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
-- Name: producers id; Type: DEFAULT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.producers ALTER COLUMN id SET DEFAULT nextval('public.producers_id_seq'::regclass);


--
-- Name: producers producers_pkey; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.producers
    ADD CONSTRAINT producers_pkey PRIMARY KEY (id);


--
-- Name: producers_products producers_products_unique; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.producers_products
    ADD CONSTRAINT producers_products_unique UNIQUE (product_id, producer_id);


--
-- Name: producers producers_unique_adress; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.producers
    ADD CONSTRAINT producers_unique_adress UNIQUE (post_code, city, address);


--
-- Name: producers producers_unique_coord; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.producers
    ADD CONSTRAINT producers_unique_coord UNIQUE (latitude, longitude);


--
-- Name: producers producers_unique_phone; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.producers
    ADD CONSTRAINT producers_unique_phone UNIQUE (phone_number_1);


--
-- Name: producers producers_unique_siret; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.producers
    ADD CONSTRAINT producers_unique_siret UNIQUE (siret_number);


--
-- Name: product_relationships product_relationships_parent_id_child_id_key; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.product_relationships
    ADD CONSTRAINT product_relationships_parent_id_child_id_key UNIQUE (parent_id, child_id);


--
-- Name: product_relationships product_relationships_pkey; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.product_relationships
    ADD CONSTRAINT product_relationships_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: products products_unique; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_unique UNIQUE (name);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: stats_day stats_day_pk; Type: CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.stats_day
    ADD CONSTRAINT stats_day_pk PRIMARY KEY (date);


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
-- Name: idx_products_hierarchy_level; Type: INDEX; Schema: public; Owner: kaja9241_openproduct
--

CREATE INDEX idx_products_hierarchy_level ON public.products USING btree (hierarchy_level);


--
-- Name: idx_products_is_collection; Type: INDEX; Schema: public; Owner: kaja9241_openproduct
--

CREATE INDEX idx_products_is_collection ON public.products USING btree (is_collection);


--
-- Name: idx_products_name; Type: INDEX; Schema: public; Owner: kaja9241_openproduct
--

CREATE INDEX idx_products_name ON public.products USING gin (to_tsvector('french'::regconfig, name));


--
-- Name: idx_relationships_child; Type: INDEX; Schema: public; Owner: kaja9241_openproduct
--

CREATE INDEX idx_relationships_child ON public.product_relationships USING btree (child_id);


--
-- Name: idx_relationships_parent; Type: INDEX; Schema: public; Owner: kaja9241_openproduct
--

CREATE INDEX idx_relationships_parent ON public.product_relationships USING btree (parent_id);


--
-- Name: producers_products_product_id_idx; Type: INDEX; Schema: public; Owner: kaja9241_openproduct
--

CREATE UNIQUE INDEX producers_products_product_id_idx ON public.producers_products USING btree (product_id, producer_id);


--
-- Name: producers_products porduct_id_FK; Type: FK CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.producers_products
    ADD CONSTRAINT "porduct_id_FK" FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: producers_products producer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.producers_products
    ADD CONSTRAINT producer_id_fk FOREIGN KEY (producer_id) REFERENCES public.producers(id);


--
-- Name: users producer_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT producer_id_fk FOREIGN KEY (producer_id) REFERENCES public.producers(id);


--
-- Name: producers producers_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.producers
    ADD CONSTRAINT producers_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: sessions sessions_user_id_users_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: kaja9241_openproduct
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_user_id_users_id_fk FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: TABLE producers; Type: ACL; Schema: public; Owner: kaja9241_openproduct
--

GRANT ALL ON TABLE public.producers TO kaja9241_svelte;


--
-- Name: TABLE producers_products; Type: ACL; Schema: public; Owner: kaja9241_openproduct
--

GRANT ALL ON TABLE public.producers_products TO kaja9241_svelte;


--
-- Name: TABLE product_relationships; Type: ACL; Schema: public; Owner: kaja9241_openproduct
--

GRANT ALL ON TABLE public.product_relationships TO kaja9241_svelte;


--
-- Name: TABLE products; Type: ACL; Schema: public; Owner: kaja9241_openproduct
--

GRANT ALL ON TABLE public.products TO kaja9241_svelte;


--
-- Name: TABLE sessions; Type: ACL; Schema: public; Owner: kaja9241_openproduct
--

GRANT ALL ON TABLE public.sessions TO kaja9241_svelte;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: kaja9241_openproduct
--

GRANT ALL ON TABLE public.users TO kaja9241_svelte;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: kaja9241
--

ALTER DEFAULT PRIVILEGES FOR ROLE kaja9241 IN SCHEMA public REVOKE ALL ON TABLES  FROM kaja9241;
ALTER DEFAULT PRIVILEGES FOR ROLE kaja9241 IN SCHEMA public GRANT SELECT,INSERT,REFERENCES,DELETE,TRIGGER,UPDATE ON TABLES  TO kaja9241_openproduct;


--
-- PostgreSQL database dump complete
--

