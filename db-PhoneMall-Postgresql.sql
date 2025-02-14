--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

-- Started on 2025-02-14 15:06:59

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
-- TOC entry 4994 (class 1262 OID 22361)
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
-- TOC entry 4995 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 220 (class 1259 OID 22871)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
                                   category_id integer NOT NULL,
                                   name character varying(255) NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 22870)
-- Name: categories_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.categories_category_id_seq OWNER TO postgres;

--
-- TOC entry 4997 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_category_id_seq OWNED BY public.categories.category_id;


--
-- TOC entry 222 (class 1259 OID 22885)
-- Name: os; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.os (
                           id integer NOT NULL,
                           name character varying(255) NOT NULL
);


ALTER TABLE public.os OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 22884)
-- Name: os_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.os_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.os_id_seq OWNER TO postgres;

--
-- TOC entry 4998 (class 0 OID 0)
-- Dependencies: 221
-- Name: os_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.os_id_seq OWNED BY public.os.id;


--
-- TOC entry 230 (class 1259 OID 22972)
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
                                       image_id integer NOT NULL,
                                       image_path text NOT NULL,
                                       product_id integer NOT NULL
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 22971)
-- Name: product_images_image_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_images_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_images_image_id_seq OWNER TO postgres;

--
-- TOC entry 4999 (class 0 OID 0)
-- Dependencies: 229
-- Name: product_images_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_images_image_id_seq OWNED BY public.product_images.image_id;


--
-- TOC entry 232 (class 1259 OID 22986)
-- Name: product_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_options (
                                        option_id integer NOT NULL,
                                        color character varying(50),
                                        color_price_adjustment numeric(10,2),
                                        storage_ram character varying(50),
                                        storage_price_adjustment numeric(10,2),
                                        quantity integer,
                                        final_price numeric(10,2),
                                        product_id integer NOT NULL
);


ALTER TABLE public.product_options OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 22985)
-- Name: product_options_option_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_options_option_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.product_options_option_id_seq OWNER TO postgres;

--
-- TOC entry 5000 (class 0 OID 0)
-- Dependencies: 231
-- Name: product_options_option_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_options_option_id_seq OWNED BY public.product_options.option_id;


--
-- TOC entry 226 (class 1259 OID 22928)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
                                 product_id integer NOT NULL,
                                 name character varying(255) NOT NULL,
                                 base_price numeric(10,2) NOT NULL,
                                 main_image text,
                                 created_date date DEFAULT CURRENT_DATE,
                                 warranty integer,
                                 sub_category_id integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 22927)
-- Name: products_product_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.products_product_id_seq OWNER TO postgres;

--
-- TOC entry 5001 (class 0 OID 0)
-- Dependencies: 225
-- Name: products_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_product_id_seq OWNED BY public.products.product_id;


--
-- TOC entry 236 (class 1259 OID 23021)
-- Name: purchase_order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_order_details (
                                               purchase_order_detail_id integer NOT NULL,
                                               quantity integer NOT NULL,
                                               unit_cost numeric(10,2),
                                               sub_total numeric(10,2),
                                               product_id integer NOT NULL,
                                               option_id integer,
                                               purchase_order_id integer NOT NULL
);


ALTER TABLE public.purchase_order_details OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 23020)
-- Name: purchase_order_details_purchase_order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_order_details_purchase_order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchase_order_details_purchase_order_detail_id_seq OWNER TO postgres;

--
-- TOC entry 5002 (class 0 OID 0)
-- Dependencies: 235
-- Name: purchase_order_details_purchase_order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_order_details_purchase_order_detail_id_seq OWNED BY public.purchase_order_details.purchase_order_detail_id;


--
-- TOC entry 234 (class 1259 OID 23007)
-- Name: purchase_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.purchase_orders (
                                        purchase_order_id integer NOT NULL,
                                        order_date date NOT NULL,
                                        total_cost numeric(10,2),
                                        supplier_name character varying(255),
                                        contact_info character varying(255),
                                        address text,
                                        kcid character varying(255)
);


ALTER TABLE public.purchase_orders OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 23006)
-- Name: purchase_orders_purchase_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.purchase_orders_purchase_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.purchase_orders_purchase_order_id_seq OWNER TO postgres;

--
-- TOC entry 5003 (class 0 OID 0)
-- Dependencies: 233
-- Name: purchase_orders_purchase_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.purchase_orders_purchase_order_id_seq OWNED BY public.purchase_orders.purchase_order_id;


--
-- TOC entry 240 (class 1259 OID 23056)
-- Name: sales_order_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_order_details (
                                            sales_order_detail_id integer NOT NULL,
                                            quantity integer NOT NULL,
                                            price numeric(10,2),
                                            sub_price numeric(10,2),
                                            product_id integer NOT NULL,
                                            option_id integer,
                                            sales_order_id integer NOT NULL
);


ALTER TABLE public.sales_order_details OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 23055)
-- Name: sales_order_details_sales_order_detail_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_order_details_sales_order_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_order_details_sales_order_detail_id_seq OWNER TO postgres;

--
-- TOC entry 5004 (class 0 OID 0)
-- Dependencies: 239
-- Name: sales_order_details_sales_order_detail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_order_details_sales_order_detail_id_seq OWNED BY public.sales_order_details.sales_order_detail_id;


--
-- TOC entry 238 (class 1259 OID 23043)
-- Name: sales_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sales_orders (
                                     sales_order_id integer NOT NULL,
                                     total_price numeric(10,2),
                                     status character varying(50),
                                     order_date date DEFAULT CURRENT_DATE,
                                     kcid character varying(255)
);


ALTER TABLE public.sales_orders OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 23042)
-- Name: sales_orders_sales_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sales_orders_sales_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sales_orders_sales_order_id_seq OWNER TO postgres;

--
-- TOC entry 5005 (class 0 OID 0)
-- Dependencies: 237
-- Name: sales_orders_sales_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sales_orders_sales_order_id_seq OWNED BY public.sales_orders.sales_order_id;


--
-- TOC entry 224 (class 1259 OID 22904)
-- Name: subcategories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.subcategories (
                                      sub_category_id integer NOT NULL,
                                      name character varying(255) NOT NULL,
                                      category_id integer NOT NULL
);


ALTER TABLE public.subcategories OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 22903)
-- Name: subcategories_sub_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.subcategories_sub_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.subcategories_sub_category_id_seq OWNER TO postgres;

--
-- TOC entry 5006 (class 0 OID 0)
-- Dependencies: 223
-- Name: subcategories_sub_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.subcategories_sub_category_id_seq OWNED BY public.subcategories.sub_category_id;


--
-- TOC entry 228 (class 1259 OID 22948)
-- Name: technical_specs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.technical_specs (
                                        technical_specs_id integer NOT NULL,
                                        screen_size character varying(50),
                                        screen_resolution character varying(100),
                                        processor character varying(100),
                                        rear_camera character varying(100),
                                        front_camera character varying(100),
                                        battery character varying(100),
                                        fast_charging boolean,
                                        water_resistance boolean,
                                        release_date date,
                                        product_id integer NOT NULL,
                                        os integer,
                                        design character varying,
                                        material character varying,
                                        weight real,
                                        battery_type character varying,
                                        network character varying,
                                        sim character varying,
                                        wifi character varying,
                                        gps character varying,
                                        nfc boolean
);


ALTER TABLE public.technical_specs OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 22947)
-- Name: technical_specs_technical_specs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.technical_specs_technical_specs_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.technical_specs_technical_specs_id_seq OWNER TO postgres;

--
-- TOC entry 5007 (class 0 OID 0)
-- Dependencies: 227
-- Name: technical_specs_technical_specs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.technical_specs_technical_specs_id_seq OWNED BY public.technical_specs.technical_specs_id;


--
-- TOC entry 217 (class 1259 OID 22694)
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
-- TOC entry 218 (class 1259 OID 22699)
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
-- TOC entry 5008 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: KC_User
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 242 (class 1259 OID 23141)
-- Name: voucher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.voucher (
                                voucher_id integer NOT NULL,
                                name character varying(255) NOT NULL,
                                discount_type character varying(50) NOT NULL,
                                discount_value numeric(10,2) NOT NULL,
                                gift character varying(255),
                                start_date date NOT NULL,
                                end_date date NOT NULL,
                                status boolean DEFAULT true,
                                product_id integer,
                                kcid character varying
);


ALTER TABLE public.voucher OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 23140)
-- Name: voucher_voucher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.voucher_voucher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.voucher_voucher_id_seq OWNER TO postgres;

--
-- TOC entry 5009 (class 0 OID 0)
-- Dependencies: 241
-- Name: voucher_voucher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.voucher_voucher_id_seq OWNED BY public.voucher.voucher_id;


--
-- TOC entry 4756 (class 2604 OID 22874)
-- Name: categories category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN category_id SET DEFAULT nextval('public.categories_category_id_seq'::regclass);


--
-- TOC entry 4757 (class 2604 OID 22888)
-- Name: os id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.os ALTER COLUMN id SET DEFAULT nextval('public.os_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 22975)
-- Name: product_images image_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images ALTER COLUMN image_id SET DEFAULT nextval('public.product_images_image_id_seq'::regclass);


--
-- TOC entry 4763 (class 2604 OID 22989)
-- Name: product_options option_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_options ALTER COLUMN option_id SET DEFAULT nextval('public.product_options_option_id_seq'::regclass);


--
-- TOC entry 4759 (class 2604 OID 22931)
-- Name: products product_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN product_id SET DEFAULT nextval('public.products_product_id_seq'::regclass);


--
-- TOC entry 4765 (class 2604 OID 23024)
-- Name: purchase_order_details purchase_order_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order_details ALTER COLUMN purchase_order_detail_id SET DEFAULT nextval('public.purchase_order_details_purchase_order_detail_id_seq'::regclass);


--
-- TOC entry 4764 (class 2604 OID 23010)
-- Name: purchase_orders purchase_order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_orders ALTER COLUMN purchase_order_id SET DEFAULT nextval('public.purchase_orders_purchase_order_id_seq'::regclass);


--
-- TOC entry 4768 (class 2604 OID 23059)
-- Name: sales_order_details sales_order_detail_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_order_details ALTER COLUMN sales_order_detail_id SET DEFAULT nextval('public.sales_order_details_sales_order_detail_id_seq'::regclass);


--
-- TOC entry 4766 (class 2604 OID 23046)
-- Name: sales_orders sales_order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders ALTER COLUMN sales_order_id SET DEFAULT nextval('public.sales_orders_sales_order_id_seq'::regclass);


--
-- TOC entry 4758 (class 2604 OID 22907)
-- Name: subcategories sub_category_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories ALTER COLUMN sub_category_id SET DEFAULT nextval('public.subcategories_sub_category_id_seq'::regclass);


--
-- TOC entry 4761 (class 2604 OID 22951)
-- Name: technical_specs technical_specs_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technical_specs ALTER COLUMN technical_specs_id SET DEFAULT nextval('public.technical_specs_technical_specs_id_seq'::regclass);


--
-- TOC entry 4755 (class 2604 OID 22712)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 4769 (class 2604 OID 23144)
-- Name: voucher voucher_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voucher ALTER COLUMN voucher_id SET DEFAULT nextval('public.voucher_voucher_id_seq'::regclass);


--
-- TOC entry 4966 (class 0 OID 22871)
-- Dependencies: 220
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories VALUES (1, 'Apple');
INSERT INTO public.categories VALUES (2, 'Samsung');


--
-- TOC entry 4968 (class 0 OID 22885)
-- Dependencies: 222
-- Data for Name: os; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.os VALUES (1, 'Ios');
INSERT INTO public.os VALUES (2, 'Android');


--
-- TOC entry 4976 (class 0 OID 22972)
-- Dependencies: 230
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4978 (class 0 OID 22986)
-- Dependencies: 232
-- Data for Name: product_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.product_options VALUES (1, 'đen', 1000000.00, '256', 1000000.00, 10, 2000000.00, 1);
INSERT INTO public.product_options VALUES (2, 'trắng', 1200000.00, '256', 1000000.00, 15, 2000000.00, 1);
INSERT INTO public.product_options VALUES (3, 'đen', 1000000.00, '128', 500000.00, 10, 1500000.00, 1);
INSERT INTO public.product_options VALUES (4, 'đen', 1000000.00, '512', 2000000.00, 10, 3000000.00, 1);
INSERT INTO public.product_options VALUES (5, 'trắng', 1700000.00, '128', 500000.00, 10, 2200000.00, 1);
INSERT INTO public.product_options VALUES (6, 'Xanh', 2000000.00, '512', 5000000.00, 1, 7000000.00, 1);


--
-- TOC entry 4972 (class 0 OID 22928)
-- Dependencies: 226
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products VALUES (1, 'iPhone 15 Plus', 16000000.00, NULL, '2025-06-02', 12, 1);
INSERT INTO public.products VALUES (2, 'iPhone 15 Pro', 20000000.00, NULL, '2025-02-11', 12, 1);
INSERT INTO public.products VALUES (3, 'Iphone', 12000000.00, '', '2025-02-13', 12, 1);
INSERT INTO public.products VALUES (4, 'Iphone', 12000000.00, '', '2025-02-13', 12, 1);
INSERT INTO public.products VALUES (5, 'Iphone', 12000000.00, '', '2025-02-13', 12, 1);
INSERT INTO public.products VALUES (6, 'Iphone', 12000000.00, '', '2025-02-13', 12, 1);


--
-- TOC entry 4982 (class 0 OID 23021)
-- Dependencies: 236
-- Data for Name: purchase_order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4980 (class 0 OID 23007)
-- Dependencies: 234
-- Data for Name: purchase_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 4986 (class 0 OID 23056)
-- Dependencies: 240
-- Data for Name: sales_order_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sales_order_details VALUES (9, 2, 15000000.00, 500000.00, 1, 4, 9);
INSERT INTO public.sales_order_details VALUES (10, 1, 12000000.00, 500000.00, 2, 5, 9);
INSERT INTO public.sales_order_details VALUES (11, 2, 19000000.00, NULL, 1, 4, 10);
INSERT INTO public.sales_order_details VALUES (12, 1, 22200000.00, NULL, 2, 5, 10);


--
-- TOC entry 4984 (class 0 OID 23043)
-- Dependencies: 238
-- Data for Name: sales_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.sales_orders VALUES (9, 42000000.00, 'Đã thanh toán', '2025-02-14', 'f:db48927c-2cf8-4f23-a16a-569b17069134:50');
INSERT INTO public.sales_orders VALUES (10, 60200000.00, 'Đã thanh toán', '2025-02-14', 'f:db48927c-2cf8-4f23-a16a-569b17069134:50');


--
-- TOC entry 4970 (class 0 OID 22904)
-- Dependencies: 224
-- Data for Name: subcategories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.subcategories VALUES (1, 'iPhone 15', 1);
INSERT INTO public.subcategories VALUES (2, 'iPhone 16', 1);


--
-- TOC entry 4974 (class 0 OID 22948)
-- Dependencies: 228
-- Data for Name: technical_specs; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.technical_specs VALUES (1, '6.3', '1280x1242', 'A16', '12MP', '15MP', '3000', true, true, NULL, 3, 1, 'Add your name in the body', 'Add your name in the body', 1.5, 'Add your name in the body', NULL, 'Add your name in the body', 'Add your name in the body', 'Add your name in the body', true);
INSERT INTO public.technical_specs VALUES (2, '6.3', '1280x1242', 'A16', '12MP', '15MP', '3000', true, true, NULL, 4, 1, 'Add your name in the body', 'Add your name in the body', 1.5, 'Add your name in the body', NULL, 'Add your name in the body', 'Add your name in the body', 'Add your name in the body', true);
INSERT INTO public.technical_specs VALUES (3, '6.3', '1280x1242', 'A16', '12MP', '15MP', '3000', true, true, NULL, 5, 1, 'Add your name in the body', 'Add your name in the body', 1.5, 'Add your name in the body', NULL, 'Add your name in the body', 'Add your name in the body', 'Add your name in the body', true);
INSERT INTO public.technical_specs VALUES (4, '6.3', '1280x1242', 'A16', '12MP', '15MP', '3000', true, true, NULL, 6, 1, 'Add your name in the body', 'Add your name in the body', 1.5, 'Add your name in the body', NULL, 'Add your name in the body', 'Add your name in the body', 'Add your name in the body', true);


--
-- TOC entry 4963 (class 0 OID 22694)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: KC_User
--

INSERT INTO public.users VALUES (30, 'Nhất', 'Thanh', 'cainhatthanhwork@gmail.com', 'admin', '$2a$10$m0jPDxk5pgWHA5QavynBl.QWwSzr9haN1/lVN/qeCJtX/3yUuOUXq', 'f:3e8799f9-28c2-4cda-8d97-ba2c7e734ca7:30');
INSERT INTO public.users VALUES (50, 'Thanh', 'Thanh', 'thanhcn@co.com', 'thanhcn2020', '$2a$10$UAZND8Bn3t8la5jptHdpQO8nJCCgka2cijf35jzsAsTJoInCdlkx.', 'f:db48927c-2cf8-4f23-a16a-569b17069134:50');


--
-- TOC entry 4988 (class 0 OID 23141)
-- Dependencies: 242
-- Data for Name: voucher; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.voucher VALUES (10, 'Hè 1', 'giảm tiền', 100000.00, 'Tai nghe', '2025-02-02', '2025-03-04', true, NULL, 'f:db48927c-2cf8-4f23-a16a-569b17069134:50');
INSERT INTO public.voucher VALUES (11, 'Hè 1', 'giảm tiền', 100000.00, 'Tai nghe', '2025-02-02', '2025-03-04', true, 1, 'f:db48927c-2cf8-4f23-a16a-569b17069134:50');


--
-- TOC entry 5010 (class 0 OID 0)
-- Dependencies: 219
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 2, true);


--
-- TOC entry 5011 (class 0 OID 0)
-- Dependencies: 221
-- Name: os_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.os_id_seq', 2, true);


--
-- TOC entry 5012 (class 0 OID 0)
-- Dependencies: 229
-- Name: product_images_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_images_image_id_seq', 1, false);


--
-- TOC entry 5013 (class 0 OID 0)
-- Dependencies: 231
-- Name: product_options_option_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_options_option_id_seq', 7, true);


--
-- TOC entry 5014 (class 0 OID 0)
-- Dependencies: 225
-- Name: products_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_product_id_seq', 7, true);


--
-- TOC entry 5015 (class 0 OID 0)
-- Dependencies: 235
-- Name: purchase_order_details_purchase_order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_order_details_purchase_order_detail_id_seq', 1, false);


--
-- TOC entry 5016 (class 0 OID 0)
-- Dependencies: 233
-- Name: purchase_orders_purchase_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.purchase_orders_purchase_order_id_seq', 1, false);


--
-- TOC entry 5017 (class 0 OID 0)
-- Dependencies: 239
-- Name: sales_order_details_sales_order_detail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_order_details_sales_order_detail_id_seq', 12, true);


--
-- TOC entry 5018 (class 0 OID 0)
-- Dependencies: 237
-- Name: sales_orders_sales_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sales_orders_sales_order_id_seq', 10, true);


--
-- TOC entry 5019 (class 0 OID 0)
-- Dependencies: 223
-- Name: subcategories_sub_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.subcategories_sub_category_id_seq', 2, true);


--
-- TOC entry 5020 (class 0 OID 0)
-- Dependencies: 227
-- Name: technical_specs_technical_specs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.technical_specs_technical_specs_id_seq', 4, true);


--
-- TOC entry 5021 (class 0 OID 0)
-- Dependencies: 218
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: KC_User
--

SELECT pg_catalog.setval('public.users_id_seq', 50, true);


--
-- TOC entry 5022 (class 0 OID 0)
-- Dependencies: 241
-- Name: voucher_voucher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.voucher_voucher_id_seq', 11, true);


--
-- TOC entry 4780 (class 2606 OID 22876)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (category_id);


--
-- TOC entry 4782 (class 2606 OID 22890)
-- Name: os os_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.os
    ADD CONSTRAINT os_pkey PRIMARY KEY (id);


--
-- TOC entry 4790 (class 2606 OID 22979)
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (image_id);


--
-- TOC entry 4792 (class 2606 OID 22991)
-- Name: product_options product_options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT product_options_pkey PRIMARY KEY (option_id);


--
-- TOC entry 4786 (class 2606 OID 22936)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (product_id);


--
-- TOC entry 4796 (class 2606 OID 23026)
-- Name: purchase_order_details purchase_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_pkey PRIMARY KEY (purchase_order_detail_id);


--
-- TOC entry 4794 (class 2606 OID 23014)
-- Name: purchase_orders purchase_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_pkey PRIMARY KEY (purchase_order_id);


--
-- TOC entry 4800 (class 2606 OID 23061)
-- Name: sales_order_details sales_order_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_pkey PRIMARY KEY (sales_order_detail_id);


--
-- TOC entry 4798 (class 2606 OID 23049)
-- Name: sales_orders sales_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_pkey PRIMARY KEY (sales_order_id);


--
-- TOC entry 4784 (class 2606 OID 22909)
-- Name: subcategories subcategories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_pkey PRIMARY KEY (sub_category_id);


--
-- TOC entry 4788 (class 2606 OID 22955)
-- Name: technical_specs technical_specs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technical_specs
    ADD CONSTRAINT technical_specs_pkey PRIMARY KEY (technical_specs_id);


--
-- TOC entry 4772 (class 2606 OID 22738)
-- Name: users unique_kcid; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_kcid UNIQUE (kcid);


--
-- TOC entry 4774 (class 2606 OID 22740)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4776 (class 2606 OID 22742)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4778 (class 2606 OID 22744)
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: KC_User
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- TOC entry 4802 (class 2606 OID 23149)
-- Name: voucher voucher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voucher
    ADD CONSTRAINT voucher_pkey PRIMARY KEY (voucher_id);


--
-- TOC entry 4807 (class 2606 OID 22980)
-- Name: product_images product_images_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4808 (class 2606 OID 22992)
-- Name: product_options product_options_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_options
    ADD CONSTRAINT product_options_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4804 (class 2606 OID 22937)
-- Name: products products_sub_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_sub_category_id_fkey FOREIGN KEY (sub_category_id) REFERENCES public.subcategories(sub_category_id);


--
-- TOC entry 4810 (class 2606 OID 23032)
-- Name: purchase_order_details purchase_order_details_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.product_options(option_id);


--
-- TOC entry 4811 (class 2606 OID 23027)
-- Name: purchase_order_details purchase_order_details_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4812 (class 2606 OID 23037)
-- Name: purchase_order_details purchase_order_details_purchase_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_order_details
    ADD CONSTRAINT purchase_order_details_purchase_order_id_fkey FOREIGN KEY (purchase_order_id) REFERENCES public.purchase_orders(purchase_order_id);


--
-- TOC entry 4809 (class 2606 OID 23015)
-- Name: purchase_orders purchase_orders_kcid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.purchase_orders
    ADD CONSTRAINT purchase_orders_kcid_fkey FOREIGN KEY (kcid) REFERENCES public.users(kcid);


--
-- TOC entry 4814 (class 2606 OID 23067)
-- Name: sales_order_details sales_order_details_option_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_option_id_fkey FOREIGN KEY (option_id) REFERENCES public.product_options(option_id);


--
-- TOC entry 4815 (class 2606 OID 23062)
-- Name: sales_order_details sales_order_details_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4816 (class 2606 OID 23072)
-- Name: sales_order_details sales_order_details_sales_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_order_details
    ADD CONSTRAINT sales_order_details_sales_order_id_fkey FOREIGN KEY (sales_order_id) REFERENCES public.sales_orders(sales_order_id);


--
-- TOC entry 4813 (class 2606 OID 23050)
-- Name: sales_orders sales_orders_kcid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sales_orders
    ADD CONSTRAINT sales_orders_kcid_fkey FOREIGN KEY (kcid) REFERENCES public.users(kcid);


--
-- TOC entry 4803 (class 2606 OID 22910)
-- Name: subcategories subcategories_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.subcategories
    ADD CONSTRAINT subcategories_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(category_id);


--
-- TOC entry 4805 (class 2606 OID 22961)
-- Name: technical_specs technical_specs_os_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technical_specs
    ADD CONSTRAINT technical_specs_os_fkey FOREIGN KEY (os) REFERENCES public.os(id);


--
-- TOC entry 4806 (class 2606 OID 22956)
-- Name: technical_specs technical_specs_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.technical_specs
    ADD CONSTRAINT technical_specs_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id);


--
-- TOC entry 4817 (class 2606 OID 23150)
-- Name: voucher voucher_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.voucher
    ADD CONSTRAINT voucher_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(product_id) ON DELETE CASCADE;


--
-- TOC entry 4996 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2025-02-14 15:06:59

--
-- PostgreSQL database dump complete
--

