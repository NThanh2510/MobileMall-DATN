--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-01-27 11:11:24

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

DROP DATABASE "PhoneMaill";
--
-- TOC entry 4996 (class 1262 OID 21477)
-- Name: PhoneMaill

; Type: DATABASE; Schema: -; Owner: KC_User
--

CREATE DATABASE "PhoneMaill" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';


ALTER DATABASE "PhoneMaill" OWNER TO "KC_User";

--connect -reuse-previous=on "dbname='PhoneMaill'"

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 21811)
-- Name: categories; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.categories (
    categoryid integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO "KC_User";

--
-- TOC entry 219 (class 1259 OID 21810)
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
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_categoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.categories_categoryid_seq OWNED BY public.categories.categoryid;


--
-- TOC entry 230 (class 1259 OID 21870)
-- Name: product_images; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.product_images (
    imageid integer NOT NULL,
    imagepath text NOT NULL,
    productid integer
);


ALTER TABLE public.product_images OWNER TO "KC_User";

--
-- TOC entry 229 (class 1259 OID 21869)
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
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 229
-- Name: product_images_imageid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.product_images_imageid_seq OWNED BY public.product_images.imageid;


--
-- TOC entry 234 (class 1259 OID 21898)
-- Name: product_options; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.product_options (
    optionid integer NOT NULL,
    color character varying(100),
    colorpriceadjustment numeric(10,2),
    storage character varying(100),
    storagepriceadjustment numeric(10,2),
    quantity integer DEFAULT 0,
    finalprice numeric(10,2),
    productid integer
);


ALTER TABLE public.product_options OWNER TO "KC_User";

--
-- TOC entry 233 (class 1259 OID 21897)
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
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 233
-- Name: product_options_optionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.product_options_optionid_seq OWNED BY public.product_options.optionid;


--
-- TOC entry 228 (class 1259 OID 21852)
-- Name: products; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.products (
    productid integer NOT NULL,
    name character varying(255) NOT NULL,
    retailprice numeric(10,2) NOT NULL,
    createddate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    warranty integer,
    subcategoryid integer,
    promotionid integer
);


ALTER TABLE public.products OWNER TO "KC_User";

--
-- TOC entry 227 (class 1259 OID 21851)
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
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 227
-- Name: products_productid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.products_productid_seq OWNED BY public.products.productid;


--
-- TOC entry 224 (class 1259 OID 21830)
-- Name: promotion_details; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.promotion_details (
    promotiondetailid integer NOT NULL,
    name character varying(255) NOT NULL,
    discounttype character varying(50),
    discountvalue numeric(10,2),
    gift character varying(255),
    startdate date,
    enddate date,
    status boolean DEFAULT true
);


ALTER TABLE public.promotion_details OWNER TO "KC_User";

--
-- TOC entry 223 (class 1259 OID 21829)
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
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 223
-- Name: promotion_details_promotiondetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.promotion_details_promotiondetailid_seq OWNED BY public.promotion_details.promotiondetailid;


--
-- TOC entry 226 (class 1259 OID 21840)
-- Name: promotions; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.promotions (
    promotionid integer NOT NULL,
    promotiondetailid integer
);


ALTER TABLE public.promotions OWNER TO "KC_User";

--
-- TOC entry 225 (class 1259 OID 21839)
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
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 225
-- Name: promotions_promotionid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.promotions_promotionid_seq OWNED BY public.promotions.promotionid;


--
-- TOC entry 242 (class 1259 OID 21961)
-- Name: purchase_order_details; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.purchase_order_details (
    purchaseorderdetailid integer NOT NULL,
    quantity integer NOT NULL,
    unitcost numeric(10,2) NOT NULL,
    subtotal numeric(10,2),
    productid integer,
    optionid integer,
    purchaseorderid integer
);


ALTER TABLE public.purchase_order_details OWNER TO "KC_User";

--
-- TOC entry 241 (class 1259 OID 21960)
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
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 241
-- Name: purchase_order_details_purchaseorderdetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.purchase_order_details_purchaseorderdetailid_seq OWNED BY public.purchase_order_details.purchaseorderdetailid;


--
-- TOC entry 240 (class 1259 OID 21946)
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.purchase_orders (
    purchaseorderid integer NOT NULL,
    orderdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    totalcost numeric(10,2) NOT NULL,
    suppliername character varying(255),
    contactinfo character varying(255),
    kcid character varying(255)
);


ALTER TABLE public.purchase_orders OWNER TO "KC_User";

--
-- TOC entry 239 (class 1259 OID 21945)
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
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 239
-- Name: purchase_orders_purchaseorderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.purchase_orders_purchaseorderid_seq OWNED BY public.purchase_orders.purchaseorderid;


--
-- TOC entry 238 (class 1259 OID 21924)
-- Name: sales_order_details; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.sales_order_details (
    salesorderdetailid integer NOT NULL,
    quantity integer NOT NULL,
    price numeric(10,2) NOT NULL,
    productid integer,
    optionid integer,
    salesorderid integer
);


ALTER TABLE public.sales_order_details OWNER TO "KC_User";

--
-- TOC entry 237 (class 1259 OID 21923)
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
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 237
-- Name: sales_order_details_salesorderdetailid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.sales_order_details_salesorderdetailid_seq OWNED BY public.sales_order_details.salesorderdetailid;


--
-- TOC entry 236 (class 1259 OID 21911)
-- Name: sales_orders; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.sales_orders (
    salesorderid integer NOT NULL,
    totalprice numeric(10,2) NOT NULL,
    status character varying(50) NOT NULL,
    orderdate timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    kcid character varying(255)
);


ALTER TABLE public.sales_orders OWNER TO "KC_User";

--
-- TOC entry 235 (class 1259 OID 21910)
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
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 235
-- Name: sales_orders_salesorderid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.sales_orders_salesorderid_seq OWNED BY public.sales_orders.salesorderid;


--
-- TOC entry 222 (class 1259 OID 21818)
-- Name: subcategories; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.subcategories (
    subcategoryid integer NOT NULL,
    name character varying(255) NOT NULL,
    categoryid integer
);


ALTER TABLE public.subcategories OWNER TO "KC_User";

--
-- TOC entry 221 (class 1259 OID 21817)
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
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 221
-- Name: subcategories_subcategoryid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.subcategories_subcategoryid_seq OWNED BY public.subcategories.subcategoryid;


--
-- TOC entry 232 (class 1259 OID 21884)
-- Name: technical_specs; Type: TABLE; Schema: public; Owner: KC_User
--

CREATE TABLE public.technical_specs (
    id integer NOT NULL,
    screensize character varying(100),
    screenresolution character varying(100),
    processor character varying(255),
    camera character varying(255),
    battery character varying(100),
    connectivity character varying(255),
    releasedate date,
    productid integer
);


ALTER TABLE public.technical_specs OWNER TO "KC_User";

--
-- TOC entry 231 (class 1259 OID 21883)
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
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 231
-- Name: technical_specs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.technical_specs_id_seq OWNED BY public.technical_specs.id;


--
-- TOC entry 218 (class 1259 OID 21538)
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
-- TOC entry 217 (class 1259 OID 21537)
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
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 4756 (class 2604 OID 21814)
-- Name: categories categoryid; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.categories ALTER COLUMN categoryid SET DEFAULT nextval('public.categories_categoryid_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 21873)
-- Name: product_images imageid; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_images ALTER COLUMN imageid SET DEFAULT nextval('public.product_images_imageid_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 21901)
-- Name: product_options optionid; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_options ALTER COLUMN optionid SET DEFAULT nextval('public.product_options_optionid_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 21855)
-- Name: products productid; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.products ALTER COLUMN productid SET DEFAULT nextval('public.products_productid_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 21833)
-- Name: promotion_details promotiondetailid; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.promotion_details ALTER COLUMN promotiondetailid SET DEFAULT nextval('public.promotion_details_promotiondetailid_seq'::regclass);


--
-- TOC entry 4760 (class 2604 OID 21843)
-- Name: promotions promotionid; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.promotions ALTER COLUMN promotionid SET DEFAULT nextval('public.promotions_promotionid_seq'::regclass);


--
-- TOC entry 4772 (class 2604 OID 21964)
-- Name: purchase_order_details purchaseorderdetailid; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_order_details ALTER COLUMN purchaseorderdetailid SET DEFAULT nextval('public.purchase_order_details_purchaseorderdetailid_seq'::regclass);


--
-- TOC entry 4770 (class 2604 OID 21949)
-- Name: purchase_orders purchaseorderid; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_orders ALTER COLUMN purchaseorderid SET DEFAULT nextval('public.purchase_orders_purchaseorderid_seq'::regclass);


--
-- TOC entry 4769 (class 2604 OID 21927)
-- Name: sales_order_details salesorderdetailid; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_order_details ALTER COLUMN salesorderdetailid SET DEFAULT nextval('public.sales_order_details_salesorderdetailid_seq'::regclass);


--
-- TOC entry 4767 (class 2604 OID 21914)
-- Name: sales_orders salesorderid; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_orders ALTER COLUMN salesorderid SET DEFAULT nextval('public.sales_orders_salesorderid_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 21821)
-- Name: subcategories subcategoryid; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.subcategories ALTER COLUMN subcategoryid SET DEFAULT nextval('public.subcategories_subcategoryid_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 21887)
-- Name: technical_specs id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.technical_specs ALTER COLUMN id SET DEFAULT nextval('public.technical_specs_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 21550)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4968 (class 0 OID 21811)
-- Dependencies: 220
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4978 (class 0 OID 21870)
-- Dependencies: 230
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4982 (class 0 OID 21898)
-- Dependencies: 234
-- Data for Name: product_options; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4976 (class 0 OID 21852)
-- Dependencies: 228
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4972 (class 0 OID 21830)
-- Dependencies: 224
-- Data for Name: promotion_details; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4974 (class 0 OID 21840)
-- Dependencies: 226
-- Data for Name: promotions; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4990 (class 0 OID 21961)
-- Dependencies: 242
-- Data for Name: purchase_order_details; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4988 (class 0 OID 21946)
-- Dependencies: 240
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4986 (class 0 OID 21924)
-- Dependencies: 238
-- Data for Name: sales_order_details; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4984 (class 0 OID 21911)
-- Dependencies: 236
-- Data for Name: sales_orders; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4970 (class 0 OID 21818)
-- Dependencies: 222
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4980 (class 0 OID 21884)
-- Dependencies: 232
-- Data for Name: technical_specs; Type: TABLE DATA; Schema: public; Owner: KC_User
--



--
-- TOC entry 4966 (class 0 OID 21538)
-- Dependencies: 218
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: KC_User
--

INSERT INTO public.users VALUES (30, 'Nhất', 'Thanh', 'cainhatthanhwork@gmail.com', 'admin', '$2a$10$vPp5Lq1.ZseMCYvZBFt3PeZqc.uLvZJmV3wip8Kl1dnT4w.KOlDBq', 'f:3e8799f9-28c2-4cda-8d97-ba2c7e734ca7:30');


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_categoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.categories_categoryid_seq', 1, false);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 229
-- Name: product_images_imageid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.product_images_imageid_seq', 1, false);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 233
-- Name: product_options_optionid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.product_options_optionid_seq', 1, false);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 227
-- Name: products_productid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.products_productid_seq', 1, false);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 223
-- Name: promotion_details_promotiondetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.promotion_details_promotiondetailid_seq', 1, false);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 225
-- Name: promotions_promotionid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.promotions_promotionid_seq', 1, false);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 241
-- Name: purchase_order_details_purchaseorderdetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.purchase_order_details_purchaseorderdetailid_seq', 1, false);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 239
-- Name: purchase_orders_purchaseorderid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.purchase_orders_purchaseorderid_seq', 1, false);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 237
-- Name: sales_order_details_salesorderdetailid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.sales_order_details_salesorderdetailid_seq', 1, false);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 235
-- Name: sales_orders_salesorderid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.sales_orders_salesorderid_seq', 1, false);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 221
-- Name: subcategories_subcategoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.subcategories_subcategoryid_seq', 1, false);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 231
-- Name: technical_specs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.technical_specs_id_seq', 1, false);


--
-- TOC entry 5023 (class 0 OID 0)
-- Dependencies: 217
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.users_id_seq', 30, true);


--
-- TOC entry 4782 (class 2606 OID 21816)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (categoryid);


--
-- TOC entry 4792 (class 2606 OID 21877)
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (imageid);


--
-- TOC entry 4796 (class 2606 OID 21904)
-- Name: product_options product_options_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT product_options_pkey PRIMARY KEY (optionid);


--
-- TOC entry 4790 (class 2606 OID 21858)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (productid);


--
-- TOC entry 4786 (class 2606 OID 21838)
-- Name: promotion_details promotion_details_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.promotion_details
    ADD CONSTRAINT promotion_details_pkey PRIMARY KEY (promotiondetailid);


--
-- TOC entry 4788 (class 2606 OID 21845)
-- Name: promotions promotions_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_pkey PRIMARY KEY (promotionid);


--
-- TOC entry 4804 (class 2606 OID 21966)
-- Name: purchase_order_details purchase_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_pkey PRIMARY KEY (purchaseorderdetailid);


--
-- TOC entry 4802 (class 2606 OID 21954)
-- Name: purchase_orders purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (purchaseorderid);


--
-- TOC entry 4800 (class 2606 OID 21929)
-- Name: sales_order_details sales_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_pkey PRIMARY KEY (salesorderdetailid);


--
-- TOC entry 4798 (class 2606 OID 21917)
-- Name: sales_orders sales_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_pkey PRIMARY KEY (salesorderid);


--
-- TOC entry 4784 (class 2606 OID 21823)
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (subcategoryid);


--
-- TOC entry 4794 (class 2606 OID 21891)
-- Name: technical_specs technical_specs_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.technical_specs
    ADD CONSTRAINT technical_specs_pkey PRIMARY KEY (id);


--
-- TOC entry 4774 (class 2606 OID 21809)
-- Name: users unique_kcid; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_kcid UNIQUE (kcid);


--
-- TOC entry 4776 (class 2606 OID 21547)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4778 (class 2606 OID 21552)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4780 (class 2606 OID 21549)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4809 (class 2606 OID 21878)
-- Name: product_images product_images_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid) ON DELETE CASCADE;


--
-- TOC entry 4811 (class 2606 OID 21905)
-- Name: product_options product_options_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT product_options_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid) ON DELETE CASCADE;


--
-- TOC entry 4807 (class 2606 OID 21864)
-- Name: products products_promotionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_promotionid_fkey FOREIGN KEY (promotionid) REFERENCES public.promotions(promotionid) ON DELETE SET NULL;


--
-- TOC entry 4808 (class 2606 OID 21859)
-- Name: products products_subcategoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_subcategoryid_fkey FOREIGN KEY (subcategoryid) REFERENCES public.subcategories(subcategoryid) ON DELETE SET NULL;


--
-- TOC entry 4806 (class 2606 OID 21846)
-- Name: promotions promotions_promotiondetailid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.promotions
    ADD CONSTRAINT promotions_promotiondetailid_fkey FOREIGN KEY (promotiondetailid) REFERENCES public.promotion_details(promotiondetailid) ON DELETE CASCADE;


--
-- TOC entry 4817 (class 2606 OID 21972)
-- Name: purchase_order_details purchase_order_details_optionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_optionid_fkey FOREIGN KEY (optionid) REFERENCES public.product_options(optionid) ON DELETE CASCADE;


--
-- TOC entry 4818 (class 2606 OID 21967)
-- Name: purchase_order_details purchase_order_details_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid) ON DELETE CASCADE;


--
-- TOC entry 4819 (class 2606 OID 21977)
-- Name: purchase_order_details purchase_order_details_purchaseorderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_purchaseorderid_fkey FOREIGN KEY (purchaseorderid) REFERENCES public.purchase_orders(purchaseorderid) ON DELETE CASCADE;


--
-- TOC entry 4816 (class 2606 OID 21955)
-- Name: purchase_orders purchase_orders_kcid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_kcid_fkey FOREIGN KEY (kcid) REFERENCES public.users(kcid) ON DELETE CASCADE;


--
-- TOC entry 4813 (class 2606 OID 21935)
-- Name: sales_order_details sales_order_details_optionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_optionid_fkey FOREIGN KEY (optionid) REFERENCES public.product_options(optionid) ON DELETE CASCADE;


--
-- TOC entry 4814 (class 2606 OID 21930)
-- Name: sales_order_details sales_order_details_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid) ON DELETE CASCADE;


--
-- TOC entry 4815 (class 2606 OID 21940)
-- Name: sales_order_details sales_order_details_salesorderid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_salesorderid_fkey FOREIGN KEY (salesorderid) REFERENCES public.sales_orders(salesorderid) ON DELETE CASCADE;


--
-- TOC entry 4812 (class 2606 OID 21918)
-- Name: sales_orders sales_orders_kcid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_kcid_fkey FOREIGN KEY (kcid) REFERENCES public.users(kcid) ON DELETE CASCADE;


--
-- TOC entry 4805 (class 2606 OID 21824)
-- Name: subcategories subcategories_categoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_categoryid_fkey FOREIGN KEY (categoryid) REFERENCES public.categories(categoryid) ON DELETE CASCADE;


--
-- TOC entry 4810 (class 2606 OID 21892)
-- Name: technical_specs technical_specs_productid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.technical_specs
    ADD CONSTRAINT technical_specs_productid_fkey FOREIGN KEY (productid) REFERENCES public.products(productid) ON DELETE CASCADE;


-- Completed on 2025-01-27 11:11:24

--
-- PostgreSQL database dump complete
--

