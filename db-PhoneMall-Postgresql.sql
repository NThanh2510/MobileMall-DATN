--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-28 18:48:23

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE "PhoneMall";
--
-- TOC entry 4996 (class 1262 OID 22361)
-- Name: PhoneMall; Type: DATABASE; Schema: -; Owner: KC_User
--

CREATE DATABASE "PhoneMall" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "PhoneMall" OWNER TO "KC_User";

\connect "PhoneMall"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 22632)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 22633)
-- Name: categories; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.categories (
    category_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO "KC_User";

--
-- TOC entry 218 (class 1259 OID 22636)
-- Name: categories_categoryid_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.categories_categoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_categoryid_seq OWNER TO "KC_User";

--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_categoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.categories_categoryid_seq OWNED BY public.categories.category_id;


--
-- TOC entry 219 (class 1259 OID 22637)
-- Name: product_images; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.product_images (
    image_id integer NOT NULL,
    image_path text NOT NULL,
    product_id integer
);


ALTER TABLE public.product_images OWNER TO "KC_User";

--
-- TOC entry 220 (class 1259 OID 22642)
-- Name: product_images_imageid_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.product_images_imageid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_images_imageid_seq OWNER TO "KC_User";

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_images_imageid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.product_images_imageid_seq OWNED BY public.product_images.image_id;


--
-- TOC entry 221 (class 1259 OID 22643)
-- Name: product_options; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.product_options (
    option_id integer NOT NULL,
    color character varying(100),
    color_price_adjustment numeric(10,2),
    storage character varying(100),
    storage_price_adjustment numeric(10,2),
    quantity integer DEFAULT 0,
    final_price numeric(10,2),
    product_id integer
);


ALTER TABLE public.product_options OWNER TO "KC_User";

--
-- TOC entry 222 (class 1259 OID 22647)
-- Name: product_options_optionid_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.product_options_optionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_options_optionid_seq OWNER TO "KC_User";

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_options_optionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.product_options_optionid_seq OWNED BY public.product_options.option_id;


--
-- TOC entry 223 (class 1259 OID 22648)
-- Name: products; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.products (
    product_id integer NOT NULL,
    name character varying(255) NOT NULL,
    retail_price numeric(10,2) NOT NULL,
    created_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    warranty integer,
    sub_category_id integer,
    promotion_id integer
);


ALTER TABLE public.products OWNER TO "KC_User";

--
-- TOC entry 224 (class 1259 OID 22652)
-- Name: products_productid_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.products_productid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_productid_seq OWNER TO "KC_User";

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 224
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.product_id;


--
-- TOC entry 225 (class 1259 OID 22653)
-- Name: promotion_details; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.promotion_details (
    promotion_detail_id integer NOT NULL,
    name character varying(255) NOT NULL,
    discount_type character varying(50),
    discount_value numeric(10,2),
    gift character varying(255),
    start_date date,
    end_date date,
    status boolean DEFAULT true
);


ALTER TABLE public.promotion_details OWNER TO "KC_User";

--
-- TOC entry 226 (class 1259 OID 22659)
-- Name: promotion_details_promotiondetailid_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.promotion_details_promotiondetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotion_details_promotiondetailid_seq OWNER TO "KC_User";

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 226
-- Name: promotion_details_promotiondetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.promotion_details_promotiondetailid_seq OWNED BY public.promotion_details.promotion_detail_id;


--
-- TOC entry 227 (class 1259 OID 22660)
-- Name: promotions; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.promotions (
    promotion_id integer NOT NULL,
    promotiondetail_id integer
);


ALTER TABLE public.promotions OWNER TO "KC_User";

--
-- TOC entry 228 (class 1259 OID 22663)
-- Name: promotions_promotionid_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.promotions_promotionid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.promotions_promotionid_seq OWNER TO "KC_User";

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 228
-- Name: promotions_promotionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.promotions_promotionid_seq OWNED BY public.promotions.promotion_id;


--
-- TOC entry 229 (class 1259 OID 22664)
-- Name: purchase_order_details; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.purchase_order_details (
    purchase_order_detail_id integer NOT NULL,
    quantity integer NOT NULL,
    unit_cost numeric(10,2) NOT NULL,
    sub_total numeric(10,2),
    product_id integer,
    option_id integer,
    purchase_order_id integer
);


ALTER TABLE public.purchase_order_details OWNER TO "KC_User";

--
-- TOC entry 230 (class 1259 OID 22667)
-- Name: purchase_order_details_purchaseorderdetailid_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.purchase_order_details_purchaseorderdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchase_order_details_purchaseorderdetailid_seq OWNER TO "KC_User";

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 230
-- Name: purchase_order_details_purchaseorderdetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.purchase_order_details_purchaseorderdetailid_seq OWNED BY public.purchase_order_details.purchase_order_detail_id;


--
-- TOC entry 231 (class 1259 OID 22668)
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.purchase_orders (
    purchase_order_id integer NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    total_cost numeric(10,2) NOT NULL,
    supplier_name character varying(255),
    contact_info character varying(255),
    kcid character varying(255)
);


ALTER TABLE public.purchase_orders OWNER TO "KC_User";

--
-- TOC entry 232 (class 1259 OID 22674)
-- Name: purchase_orders_purchaseorderid_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.purchase_orders_purchaseorderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchase_orders_purchaseorderid_seq OWNER TO "KC_User";

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 232
-- Name: purchase_orders_purchaseorderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.purchase_orders_purchaseorderid_seq OWNED BY public.purchase_orders.purchase_order_id;


--
-- TOC entry 233 (class 1259 OID 22675)
-- Name: sales_order_details; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.sales_order_details (
    sales_order_detail_id integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    product_id integer,
    option_id integer,
    sales_order_id integer
);


ALTER TABLE public.sales_order_details OWNER TO "KC_User";

--
-- TOC entry 234 (class 1259 OID 22678)
-- Name: sales_order_details_salesorderdetailid_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.sales_order_details_salesorderdetailid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_order_details_salesorderdetailid_seq OWNER TO "KC_User";

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 234
-- Name: sales_order_details_salesorderdetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.sales_order_details_salesorderdetailid_seq OWNED BY public.sales_order_details.sales_order_detail_id;


--
-- TOC entry 235 (class 1259 OID 22679)
-- Name: sales_orders; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.sales_orders (
    sales_order_id integer NOT NULL,
    total_price numeric(10,2) NOT NULL,
    status character varying(50) NOT NULL,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    kcid character varying(255)
);


ALTER TABLE public.sales_orders OWNER TO "KC_User";

--
-- TOC entry 236 (class 1259 OID 22683)
-- Name: sales_orders_salesorderid_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.sales_orders_salesorderid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_orders_salesorderid_seq OWNER TO "KC_User";

--
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 236
-- Name: sales_orders_salesorderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.sales_orders_salesorderid_seq OWNED BY public.sales_orders.sales_order_id;


--
-- TOC entry 237 (class 1259 OID 22684)
-- Name: subcategories; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.subcategories (
    sub_category_id integer NOT NULL,
    name character varying(255) NOT NULL,
    category_id integer
);


ALTER TABLE public.subcategories OWNER TO "KC_User";

--
-- TOC entry 238 (class 1259 OID 22687)
-- Name: subcategories_subcategoryid_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.subcategories_subcategoryid_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subcategories_subcategoryid_seq OWNER TO "KC_User";

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 238
-- Name: subcategories_subcategoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.subcategories_subcategoryid_seq OWNED BY public.subcategories.sub_category_id;


--
-- TOC entry 239 (class 1259 OID 22688)
-- Name: technical_specs; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.technical_specs (
    id integer NOT NULL,
    screen_size character varying(100),
    screen_resolution character varying(100),
    processor character varying(255),
    camera character varying(255),
    battery character varying(100),
    connectivity character varying(255),
    release_date date,
    product_id integer
);


ALTER TABLE public.technical_specs OWNER TO "KC_User";

--
-- TOC entry 240 (class 1259 OID 22693)
-- Name: technical_specs_id_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.technical_specs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.technical_specs_id_seq OWNER TO "KC_User";

--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 240
-- Name: technical_specs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.technical_specs_id_seq OWNED BY public.technical_specs.id;


--
-- TOC entry 241 (class 1259 OID 22694)
-- Name: users; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    email character varying(100) NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    kcid character varying(255)
);


ALTER TABLE public.users OWNER TO "KC_User";

--
-- TOC entry 242 (class 1259 OID 22699)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: KC_User
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO "KC_User";

--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 242
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4755 (class 2604 OID 22700)
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_categoryid_seq'::regclass);


--
-- TOC entry 4756 (class 2604 OID 22701)
-- Name: product_images image_id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_images ALTER COLUMN image_id SET DEFAULT nextval('public.product_images_imageid_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 22702)
-- Name: product_options option_id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_options ALTER COLUMN option_id SET DEFAULT nextval('public.product_options_optionid_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 22703)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 22704)
-- Name: promotion_details promotion_detail_id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.promotion_details ALTER COLUMN promotion_detail_id SET DEFAULT nextval('public.promotion_details_promotiondetailid_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 22705)
-- Name: promotions promotion_id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.promotions ALTER COLUMN promotion_id SET DEFAULT nextval('public.promotions_promotionid_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 22706)
-- Name: purchase_order_details purchase_order_detail_id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_order_details ALTER COLUMN purchase_order_detail_id SET DEFAULT nextval('public.purchase_order_details_purchaseorderdetailid_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 22707)
-- Name: purchase_orders purchase_order_id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_orders ALTER COLUMN purchase_order_id SET DEFAULT nextval('public.purchase_orders_purchaseorderid_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 22708)
-- Name: sales_order_details sales_order_detail_id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_order_details ALTER COLUMN sales_order_detail_id SET DEFAULT nextval('public.sales_order_details_salesorderdetailid_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 22709)
-- Name: sales_orders sales_order_id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_orders ALTER COLUMN sales_order_id SET DEFAULT nextval('public.sales_orders_salesorderid_seq'::regclass);


--
-- TOC entry 4770 (class 2604 OID 22710)
-- Name: subcategories sub_category_id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.subcategories ALTER COLUMN sub_category_id SET DEFAULT nextval('public.subcategories_subcategoryid_seq'::regclass);


--
-- TOC entry 4771 (class 2604 OID 22711)
-- Name: technical_specs id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.technical_specs ALTER COLUMN id SET DEFAULT nextval('public.technical_specs_id_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 22712)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4965 (class 0 OID 22633)
-- Dependencies: 217
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4967 (class 0 OID 22637)
-- Dependencies: 219
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4969 (class 0 OID 22643)
-- Dependencies: 221
-- Data for Name: product_options; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4971 (class 0 OID 22648)
-- Dependencies: 223
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4973 (class 0 OID 22653)
-- Dependencies: 225
-- Data for Name: promotion_details; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4975 (class 0 OID 22660)
-- Dependencies: 227
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4977 (class 0 OID 22664)
-- Dependencies: 229
-- Data for Name: purchase_order_details; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4979 (class 0 OID 22668)
-- Dependencies: 231
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4981 (class 0 OID 22675)
-- Dependencies: 233
-- Data for Name: sales_order_details; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4983 (class 0 OID 22679)
-- Dependencies: 235
-- Data for Name: sales_orders; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4985 (class 0 OID 22684)
-- Dependencies: 237
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4987 (class 0 OID 22688)
-- Dependencies: 239
-- Data for Name: technical_specs; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4989 (class 0 OID 22694)
-- Dependencies: 241
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: KC_User
--

INSERT INTO public.users VALUES (30, 'Nhất', 'Thanh', 'cainhatthanhwork@gmail.com', 'admin', '$2a$10$vPp5Lq1.ZseMCYvZBFt3PeZqc.uLvZJmV3wip8Kl1dnT4w.KOlDBq', 'f:3e8799f9-28c2-4cda-8d97-ba2c7e734ca7:30');


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 218
-- Name: categories_categoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.categories_categoryid_seq', 1, false);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 220
-- Name: product_images_imageid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.product_images_imageid_seq', 1, false);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 222
-- Name: product_options_optionid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.product_options_optionid_seq', 1, false);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 224
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.products_productid_seq', 1, false);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 226
-- Name: promotion_details_promotiondetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.promotion_details_promotiondetailid_seq', 1, false);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 228
-- Name: promotions_promotionid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.promotions_promotionid_seq', 1, false);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 230
-- Name: purchase_order_details_purchaseorderdetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.purchase_order_details_purchaseorderdetailid_seq', 1, false);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 232
-- Name: purchase_orders_purchaseorderid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.purchase_orders_purchaseorderid_seq', 1, false);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 234
-- Name: sales_order_details_salesorderdetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.sales_order_details_salesorderdetailid_seq', 1, false);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 236
-- Name: sales_orders_salesorderid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.sales_orders_salesorderid_seq', 1, false);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 238
-- Name: subcategories_subcategoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.subcategories_subcategoryid_seq', 1, false);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 240
-- Name: technical_specs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.technical_specs_id_seq', 1, false);


--
-- TOC entry 5024 (class 0 OID 0)
-- Dependencies: 242
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.users_id_seq', 30, true);


--
-- TOC entry 4774 (class 2606 OID 22714)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 4776 (class 2606 OID 22716)
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (image_id);


--
-- TOC entry 4778 (class 2606 OID 22718)
-- Name: product_options product_options_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT product_options_pkey PRIMARY KEY (option_id);


--
-- TOC entry 4780 (class 2606 OID 22720)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4782 (class 2606 OID 22722)
-- Name: promotion_details promotion_details_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.promotion_details
    ADD CONSTRAINT promotion_details_pkey PRIMARY KEY (promotion_detail_id);


--
-- TOC entry 4784 (class 2606 OID 22724)
-- Name: promotions promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_pkey PRIMARY KEY (promotion_id);


--
-- TOC entry 4786 (class 2606 OID 22726)
-- Name: purchase_order_details purchase_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_pkey PRIMARY KEY (purchase_order_detail_id);


--
-- TOC entry 4788 (class 2606 OID 22728)
-- Name: purchase_orders purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (purchase_order_id);


--
-- TOC entry 4790 (class 2606 OID 22730)
-- Name: sales_order_details sales_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_pkey PRIMARY KEY (sales_order_detail_id);


--
-- TOC entry 4792 (class 2606 OID 22732)
-- Name: sales_orders sales_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_pkey PRIMARY KEY (sales_order_id);


--
-- TOC entry 4794 (class 2606 OID 22734)
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (sub_category_id);


--
-- TOC entry 4796 (class 2606 OID 22736)
-- Name: technical_specs technical_specs_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.technical_specs
    ADD CONSTRAINT technical_specs_pkey PRIMARY KEY (id);


--
-- TOC entry 4798 (class 2606 OID 22738)
-- Name: users unique_kcid; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_kcid UNIQUE (kcid);


--
-- TOC entry 4800 (class 2606 OID 22740)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4802 (class 2606 OID 22742)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4804 (class 2606 OID 22744)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4805 (class 2606 OID 22745)
-- Name: product_images product_images_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_productid_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 4806 (class 2606 OID 22750)
-- Name: product_options product_options_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT product_options_productid_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 4807 (class 2606 OID 22755)
-- Name: products products_promotionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_promotionid_fkey FOREIGN KEY (promotion_id) REFERENCES public.promotions(promotion_id) ON DELETE SET NULL;


--
-- TOC entry 4808 (class 2606 OID 22760)
-- Name: products products_subcategoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_subcategoryid_fkey FOREIGN KEY (sub_category_id) REFERENCES public.subcategories(sub_category_id) ON DELETE SET NULL;


--
-- TOC entry 4809 (class 2606 OID 22765)
-- Name: promotions promotions_promotiondetailid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_promotiondetailid_fkey FOREIGN KEY (promotiondetail_id) REFERENCES public.promotion_details(promotion_detail_id) ON DELETE CASCADE;


--
-- TOC entry 4810 (class 2606 OID 22770)
-- Name: purchase_order_details purchase_order_details_optionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_optionid_fkey FOREIGN KEY (option_id) REFERENCES public.product_options(option_id) ON DELETE CASCADE;


--
-- TOC entry 4811 (class 2606 OID 22775)
-- Name: purchase_order_details purchase_order_details_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_productid_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 4812 (class 2606 OID 22780)
-- Name: purchase_order_details purchase_order_details_purchaseorderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_purchaseorderid_fkey FOREIGN KEY (purchase_order_id) REFERENCES public.purchase_orders(purchase_order_id) ON DELETE CASCADE;


--
-- TOC entry 4813 (class 2606 OID 22785)
-- Name: purchase_orders purchase_orders_kcid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_kcid_fkey FOREIGN KEY (kcid) REFERENCES public.users(kcid) ON DELETE CASCADE;


--
-- TOC entry 4814 (class 2606 OID 22790)
-- Name: sales_order_details sales_order_details_optionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_optionid_fkey FOREIGN KEY (option_id) REFERENCES public.product_options(option_id) ON DELETE CASCADE;


--
-- TOC entry 4815 (class 2606 OID 22795)
-- Name: sales_order_details sales_order_details_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_productid_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 4816 (class 2606 OID 22800)
-- Name: sales_order_details sales_order_details_salesorderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_salesorderid_fkey FOREIGN KEY (sales_order_id) REFERENCES public.sales_orders(sales_order_id) ON DELETE CASCADE;


--
-- TOC entry 4817 (class 2606 OID 22805)
-- Name: sales_orders sales_orders_kcid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_kcid_fkey FOREIGN KEY (kcid) REFERENCES public.users(kcid) ON DELETE CASCADE;


--
-- TOC entry 4818 (class 2606 OID 22810)
-- Name: subcategories subcategories_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_categoryid_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id) ON DELETE CASCADE;


--
-- TOC entry 4819 (class 2606 OID 22815)
-- Name: technical_specs technical_specs_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.technical_specs
    ADD CONSTRAINT technical_specs_productid_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-01-28 18:48:23

--
-- PostgreSQL database dump complete
--

