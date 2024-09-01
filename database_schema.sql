--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2024-05-15 21:15:42

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
-- TOC entry 215 (class 1259 OID 32840)
-- Name: admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin (
    id integer NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(140) NOT NULL
);


ALTER TABLE public.admin OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 32839)
-- Name: admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_id_seq OWNER TO postgres;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 214
-- Name: admin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admin_id_seq OWNED BY public.admin.id;


--
-- TOC entry 217 (class 1259 OID 32847)
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE public.category OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 32846)
-- Name: category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.category_id_seq OWNER TO postgres;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 216
-- Name: category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.category_id_seq OWNED BY public.category.id;


--
-- TOC entry 221 (class 1259 OID 32898)
-- Name: clock_records; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clock_records (
    id integer NOT NULL,
    employee_id integer NOT NULL,
    clock_in timestamp without time zone NOT NULL,
    clock_out timestamp without time zone,
    location character varying(255),
    work_from_type character varying(50)
);


ALTER TABLE public.clock_records OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 32897)
-- Name: clock_records_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clock_records_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clock_records_id_seq OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 220
-- Name: clock_records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clock_records_id_seq OWNED BY public.clock_records.id;


--
-- TOC entry 219 (class 1259 OID 32884)
-- Name: employee; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employee (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    salary numeric(10,2) NOT NULL,
    image character varying(255),
    category_id integer
);


ALTER TABLE public.employee OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 32883)
-- Name: employee_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.employee_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employee_id_seq OWNER TO postgres;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.employee_id_seq OWNED BY public.employee.id;


--
-- TOC entry 223 (class 1259 OID 32910)
-- Name: office_locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.office_locations (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,
    address character varying(255)
);


ALTER TABLE public.office_locations OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 32909)
-- Name: office_locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.office_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.office_locations_id_seq OWNER TO postgres;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 222
-- Name: office_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.office_locations_id_seq OWNED BY public.office_locations.id;


--
-- TOC entry 3193 (class 2604 OID 32843)
-- Name: admin id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin ALTER COLUMN id SET DEFAULT nextval('public.admin_id_seq'::regclass);


--
-- TOC entry 3194 (class 2604 OID 32850)
-- Name: category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category ALTER COLUMN id SET DEFAULT nextval('public.category_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 32901)
-- Name: clock_records id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clock_records ALTER COLUMN id SET DEFAULT nextval('public.clock_records_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 32887)
-- Name: employee id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee ALTER COLUMN id SET DEFAULT nextval('public.employee_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 32913)
-- Name: office_locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_locations ALTER COLUMN id SET DEFAULT nextval('public.office_locations_id_seq'::regclass);


--
-- TOC entry 3353 (class 0 OID 32840)
-- Dependencies: 215
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.admin (id, email, password) VALUES (3, 'admin2@gmail.com', '$2b$10$uRYp5SVe5x3Ti5OvJtaXa.0oBgq3gar9.PqC15h9MZjE4.bECp0qy');
INSERT INTO public.admin (id, email, password) VALUES (5, 'admin1@gmail.com', '$2b$10$.b7Ab/c3HgKJYhd/aQS5nueklJbYJnXKIR87G00AnJz6YTTItAVVC');
INSERT INTO public.admin (id, email, password) VALUES (1, 'admin@gmail.com', '$2b$10$qegkrTOpEnpzFmN5dxifROfO2TJAxKz3xFln7X11LIKCGs17nD9De');


--
-- TOC entry 3355 (class 0 OID 32847)
-- Dependencies: 217
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.category (id, name) VALUES (1, 'IT');
INSERT INTO public.category (id, name) VALUES (9, 'HR');
INSERT INTO public.category (id, name) VALUES (10, 'Designer');
INSERT INTO public.category (id, name) VALUES (11, 'Manager');
INSERT INTO public.category (id, name) VALUES (12, 'HOD');
INSERT INTO public.category (id, name) VALUES (14, 'Animatior');
INSERT INTO public.category (id, name) VALUES (15, 'Designer');
INSERT INTO public.category (id, name) VALUES (16, 'Script Writer');
INSERT INTO public.category (id, name) VALUES (17, 'Web Designer');
INSERT INTO public.category (id, name) VALUES (18, 'Sales Team');
INSERT INTO public.category (id, name) VALUES (19, 'App Dev');
INSERT INTO public.category (id, name) VALUES (20, 'Supervisor');
INSERT INTO public.category (id, name) VALUES (21, 'Script Writer');
INSERT INTO public.category (id, name) VALUES (22, 'Blog Writer');
INSERT INTO public.category (id, name) VALUES (23, 'Social Media Manager');


--
-- TOC entry 3359 (class 0 OID 32898)
-- Dependencies: 221
-- Data for Name: clock_records; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (41, 1, '2024-05-10 16:31:16.450227', '2024-05-10 16:31:20.940552', '', 'office');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (56, 8, '2024-05-10 18:59:56.084987', '2024-05-10 18:59:57.292474', NULL, 'office');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (57, 8, '2024-05-10 19:05:02.652784', '2024-05-10 19:05:04.642593', NULL, 'home');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (58, 8, '2024-05-10 19:06:43.116945', '2024-05-10 19:06:47.306504', NULL, 'Office');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (16, 1, '2024-05-04 11:53:28.138724', '2024-05-04 11:58:14.129853', NULL, 'office');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (40, 7, '2024-05-08 15:51:01.484204', '2024-05-08 15:51:10.371497', NULL, 'office');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (32, 8, '2024-05-05 23:27:33.991099', '2024-05-05 23:27:34.912017', '', 'office');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (33, 8, '2024-05-06 00:37:11.27528', '2024-05-06 00:37:13.869628', '', 'office');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (54, 7, '2024-05-10 18:56:36.8194', '2024-05-10 18:56:42.062523', NULL, 'home');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (35, 1, '2024-05-06 13:12:06.876901', '2024-05-06 13:12:09.73074', '', 'office');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (36, 1, '2024-05-07 08:48:42.187232', '2024-05-07 08:48:43.416327', '', 'office');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (39, 1, '2024-05-08 12:18:51.77811', '2024-05-08 12:18:54.712723', '', 'office');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (61, 1, '2024-05-11 16:05:57.747672', '2024-05-11 16:06:02.337345', NULL, 'Office');
INSERT INTO public.clock_records (id, employee_id, clock_in, clock_out, location, work_from_type) VALUES (62, 1, '2024-05-14 11:43:39.499172', '2024-05-14 11:44:24.904526', NULL, 'Office');


--
-- TOC entry 3357 (class 0 OID 32884)
-- Dependencies: 219
-- Data for Name: employee; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employee (id, name, email, password, address, salary, image, category_id) VALUES (1, 'Shubham Sahu', 'as4242173@gmail.com', '$2b$10$WUsP5prYyy1UYXOGP2iEPeySz0KiFb2U1SyoOVfcDQY0o5ht3Ttvi', '642, Samdariya Green City', 10000.00, 'image_1714386729091.jpg', 17);
INSERT INTO public.employee (id, name, email, password, address, salary, image, category_id) VALUES (7, 'Yuvraj Lodhi', 'yuvraj@gmail.com', '$2b$10$R8k/nDK9IfPRGx3OtP.ywOtEXn5i4lZ8Oj3GFfUSYRGd13XBkO/Vy', '56, Wirte Town', 20000.00, 'image_1714503454639.jpg', 14);
INSERT INTO public.employee (id, name, email, password, address, salary, image, category_id) VALUES (8, 'Kirti Dubey', 'kirti@gmail.com', '$2b$10$dYxY/l7LIoPw.BIny89nOOTznSvFFIBDj/BzoU7LweD82nNHg03ce', 'Samdariya Green City', 20000.00, 'image_1714808711692.png', 19);


--
-- TOC entry 3361 (class 0 OID 32910)
-- Dependencies: 223
-- Data for Name: office_locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.office_locations (id, name, latitude, longitude, address) VALUES (2, 'Branch 2', 23.2016602, 79.9153398, 'Samdariya Green City');
INSERT INTO public.office_locations (id, name, latitude, longitude, address) VALUES (1, 'Branch 1', 23.1998341, 79.8788018, 'Global Engineering College');


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 214
-- Name: admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admin_id_seq', 6, true);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 216
-- Name: category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.category_id_seq', 23, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 220
-- Name: clock_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clock_records_id_seq', 62, true);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 218
-- Name: employee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.employee_id_seq', 8, true);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 222
-- Name: office_locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.office_locations_id_seq', 2, true);


--
-- TOC entry 3199 (class 2606 OID 32845)
-- Name: admin admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 32854)
-- Name: category category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pkey PRIMARY KEY (id);


--
-- TOC entry 3205 (class 2606 OID 32903)
-- Name: clock_records clock_records_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clock_records
    ADD CONSTRAINT clock_records_pkey PRIMARY KEY (id);


--
-- TOC entry 3203 (class 2606 OID 32891)
-- Name: employee employee_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 32915)
-- Name: office_locations office_locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.office_locations
    ADD CONSTRAINT office_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 32892)
-- Name: employee employee_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employee
    ADD CONSTRAINT employee_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- TOC entry 3209 (class 2606 OID 32904)
-- Name: clock_records fk_employee; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clock_records
    ADD CONSTRAINT fk_employee FOREIGN KEY (employee_id) REFERENCES public.employee(id);


-- Completed on 2024-05-15 21:15:43

--
-- PostgreSQL database dump complete
--

