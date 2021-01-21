--
-- PostgreSQL database dump
--

-- Dumped from database version 10.15
-- Dumped by pg_dump version 10.15

-- Started on 2021-01-18 18:13:02

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

DROP DATABASE cacao;
--
-- TOC entry 3759 (class 1262 OID 32807)
-- Name: cacao; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE cacao WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_Ecuador.1252' LC_CTYPE = 'Spanish_Ecuador.1252';


ALTER DATABASE cacao OWNER TO postgres;

\connect cacao

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

--
-- TOC entry 1 (class 3079 OID 12924)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 3762 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- TOC entry 2 (class 3079 OID 33018)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 3763 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 226 (class 1259 OID 34136)
-- Name: analisis_sensorial_muestra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.analisis_sensorial_muestra (
    id_muestra integer NOT NULL,
    id_tipo_analisis integer NOT NULL,
    valor numeric(8,2) NOT NULL
);


ALTER TABLE public.analisis_sensorial_muestra OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 34109)
-- Name: calidad_fermentacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.calidad_fermentacion (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(200)
);


ALTER TABLE public.calidad_fermentacion OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 34107)
-- Name: calidad_fermentacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.calidad_fermentacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.calidad_fermentacion_id_seq OWNER TO postgres;

--
-- TOC entry 3764 (class 0 OID 0)
-- Dependencies: 219
-- Name: calidad_fermentacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.calidad_fermentacion_id_seq OWNED BY public.calidad_fermentacion.id;


--
-- TOC entry 204 (class 1259 OID 33941)
-- Name: caso_estudio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.caso_estudio (
    id integer NOT NULL,
    nombre character varying(500) NOT NULL,
    fecha_realizacion date,
    resumen text
);


ALTER TABLE public.caso_estudio OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 33939)
-- Name: caso_estudio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.caso_estudio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.caso_estudio_id_seq OWNER TO postgres;

--
-- TOC entry 3765 (class 0 OID 0)
-- Dependencies: 203
-- Name: caso_estudio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.caso_estudio_id_seq OWNED BY public.caso_estudio.id;


--
-- TOC entry 197 (class 1259 OID 32846)
-- Name: id_caso_estudio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_caso_estudio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_caso_estudio_seq OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 33965)
-- Name: locacion_plantacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locacion_plantacion (
    id integer NOT NULL,
    id_caso_estudio integer NOT NULL,
    id_tipo_suelo integer,
    id_tipo_bosque integer,
    altitud integer,
    precipitacion_anual_media integer,
    temperatura_anual_media numeric(8,2),
    humedad_anual_media numeric(8,2),
    ph_suelo numeric(8,2),
    cic_suelo numeric(8,2),
    mo_suelo numeric(8,2),
    velocidad_media_viento numeric(8,2),
    ubicacion public.geometry(Point,4326),
    ciudad character varying(500),
    descripcion text
);


ALTER TABLE public.locacion_plantacion OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 33963)
-- Name: locacion_plantacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locacion_plantacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locacion_plantacion_id_seq OWNER TO postgres;

--
-- TOC entry 3766 (class 0 OID 0)
-- Dependencies: 209
-- Name: locacion_plantacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locacion_plantacion_id_seq OWNED BY public.locacion_plantacion.id;


--
-- TOC entry 218 (class 1259 OID 34026)
-- Name: muestra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.muestra (
    id integer NOT NULL,
    id_localidad_plantacion integer NOT NULL,
    id_tipo_fermentador integer,
    id_tipo_secado integer,
    id_calidad_fermentacion integer,
    cantidad_mazorcas integer,
    fecha_obtencion date,
    tiempo_fermentacion numeric(8,2),
    tiempo_secado numeric(8,2),
    humedad_post_secado numeric(8,2),
    peso_promedio numeric(8,2),
    ancho numeric(8,2),
    espesor numeric(8,2),
    longitud numeric(8,2)
);


ALTER TABLE public.muestra OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 34024)
-- Name: muestra_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.muestra_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.muestra_id_seq OWNER TO postgres;

--
-- TOC entry 3767 (class 0 OID 0)
-- Dependencies: 217
-- Name: muestra_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.muestra_id_seq OWNED BY public.muestra.id;


--
-- TOC entry 223 (class 1259 OID 34122)
-- Name: registro_fermentacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.registro_fermentacion (
    id integer NOT NULL,
    id_muestra integer NOT NULL,
    cantidad_horas_registro integer,
    ph_testa numeric(8,2),
    ph_cotiledon numeric(8,2),
    temperatura numeric(8,2)
);


ALTER TABLE public.registro_fermentacion OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 34120)
-- Name: registro_fermentacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.registro_fermentacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.registro_fermentacion_id_seq OWNER TO postgres;

--
-- TOC entry 3768 (class 0 OID 0)
-- Dependencies: 222
-- Name: registro_fermentacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.registro_fermentacion_id_seq OWNED BY public.registro_fermentacion.id;


--
-- TOC entry 225 (class 1259 OID 34130)
-- Name: tipo_analisis_sensorial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_analisis_sensorial (
    id integer NOT NULL,
    nombre character varying(50),
    descripcion character varying(200)
);


ALTER TABLE public.tipo_analisis_sensorial OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 34128)
-- Name: tipo_analisis_sensorial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_analisis_sensorial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_analisis_sensorial_id_seq OWNER TO postgres;

--
-- TOC entry 3769 (class 0 OID 0)
-- Dependencies: 224
-- Name: tipo_analisis_sensorial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_analisis_sensorial_id_seq OWNED BY public.tipo_analisis_sensorial.id;


--
-- TOC entry 206 (class 1259 OID 33949)
-- Name: tipo_bosque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_bosque (
    id integer NOT NULL,
    nombre character varying(60) NOT NULL,
    descripcion character varying(500)
);


ALTER TABLE public.tipo_bosque OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 33947)
-- Name: tipo_bosque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_bosque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_bosque_id_seq OWNER TO postgres;

--
-- TOC entry 3770 (class 0 OID 0)
-- Dependencies: 205
-- Name: tipo_bosque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_bosque_id_seq OWNED BY public.tipo_bosque.id;


--
-- TOC entry 214 (class 1259 OID 34006)
-- Name: tipo_cacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_cacao (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(300)
);


ALTER TABLE public.tipo_cacao OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 34004)
-- Name: tipo_cacao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_cacao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_cacao_id_seq OWNER TO postgres;

--
-- TOC entry 3771 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipo_cacao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_cacao_id_seq OWNED BY public.tipo_cacao.id;


--
-- TOC entry 221 (class 1259 OID 34115)
-- Name: tipo_cacao_muestra; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_cacao_muestra (
    id_muestra integer NOT NULL,
    id_tipo_cacao integer NOT NULL
);


ALTER TABLE public.tipo_cacao_muestra OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 34014)
-- Name: tipo_fermentador; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_fermentador (
    id integer NOT NULL,
    nombre character varying(30) NOT NULL,
    descripcion character varying(200),
    capacidad numeric(8,2)
);


ALTER TABLE public.tipo_fermentador OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 34012)
-- Name: tipo_fermentador_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_fermentador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_fermentador_id_seq OWNER TO postgres;

--
-- TOC entry 3772 (class 0 OID 0)
-- Dependencies: 215
-- Name: tipo_fermentador_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_fermentador_id_seq OWNED BY public.tipo_fermentador.id;


--
-- TOC entry 212 (class 1259 OID 33988)
-- Name: tipo_secado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_secado (
    id integer NOT NULL,
    nombre character varying(50),
    descripcion character varying(200)
);


ALTER TABLE public.tipo_secado OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 33986)
-- Name: tipo_secado_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_secado_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_secado_id_seq OWNER TO postgres;

--
-- TOC entry 3773 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipo_secado_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_secado_id_seq OWNED BY public.tipo_secado.id;


--
-- TOC entry 208 (class 1259 OID 33957)
-- Name: tipo_suelo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipo_suelo (
    id integer NOT NULL,
    nombre character varying(25) NOT NULL,
    descripcion character varying(200)
);


ALTER TABLE public.tipo_suelo OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 33955)
-- Name: tipo_suelo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipo_suelo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipo_suelo_id_seq OWNER TO postgres;

--
-- TOC entry 3774 (class 0 OID 0)
-- Dependencies: 207
-- Name: tipo_suelo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipo_suelo_id_seq OWNED BY public.tipo_suelo.id;


--
-- TOC entry 3562 (class 2604 OID 34112)
-- Name: calidad_fermentacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calidad_fermentacion ALTER COLUMN id SET DEFAULT nextval('public.calidad_fermentacion_id_seq'::regclass);


--
-- TOC entry 3554 (class 2604 OID 33944)
-- Name: caso_estudio id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caso_estudio ALTER COLUMN id SET DEFAULT nextval('public.caso_estudio_id_seq'::regclass);


--
-- TOC entry 3557 (class 2604 OID 33968)
-- Name: locacion_plantacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacion_plantacion ALTER COLUMN id SET DEFAULT nextval('public.locacion_plantacion_id_seq'::regclass);


--
-- TOC entry 3561 (class 2604 OID 34029)
-- Name: muestra id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.muestra ALTER COLUMN id SET DEFAULT nextval('public.muestra_id_seq'::regclass);


--
-- TOC entry 3563 (class 2604 OID 34125)
-- Name: registro_fermentacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_fermentacion ALTER COLUMN id SET DEFAULT nextval('public.registro_fermentacion_id_seq'::regclass);


--
-- TOC entry 3564 (class 2604 OID 34133)
-- Name: tipo_analisis_sensorial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_analisis_sensorial ALTER COLUMN id SET DEFAULT nextval('public.tipo_analisis_sensorial_id_seq'::regclass);


--
-- TOC entry 3555 (class 2604 OID 33952)
-- Name: tipo_bosque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_bosque ALTER COLUMN id SET DEFAULT nextval('public.tipo_bosque_id_seq'::regclass);


--
-- TOC entry 3559 (class 2604 OID 34009)
-- Name: tipo_cacao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cacao ALTER COLUMN id SET DEFAULT nextval('public.tipo_cacao_id_seq'::regclass);


--
-- TOC entry 3560 (class 2604 OID 34017)
-- Name: tipo_fermentador id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_fermentador ALTER COLUMN id SET DEFAULT nextval('public.tipo_fermentador_id_seq'::regclass);


--
-- TOC entry 3558 (class 2604 OID 33991)
-- Name: tipo_secado id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_secado ALTER COLUMN id SET DEFAULT nextval('public.tipo_secado_id_seq'::regclass);


--
-- TOC entry 3556 (class 2604 OID 33960)
-- Name: tipo_suelo id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_suelo ALTER COLUMN id SET DEFAULT nextval('public.tipo_suelo_id_seq'::regclass);


--
-- TOC entry 3753 (class 0 OID 34136)
-- Dependencies: 226
-- Data for Name: analisis_sensorial_muestra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.analisis_sensorial_muestra VALUES (25, 11, 6.17);
INSERT INTO public.analisis_sensorial_muestra VALUES (25, 16, 6.08);
INSERT INTO public.analisis_sensorial_muestra VALUES (25, 15, 5.08);
INSERT INTO public.analisis_sensorial_muestra VALUES (25, 17, 4.92);
INSERT INTO public.analisis_sensorial_muestra VALUES (25, 10, 12.00);
INSERT INTO public.analisis_sensorial_muestra VALUES (26, 11, 5.83);
INSERT INTO public.analisis_sensorial_muestra VALUES (26, 16, 5.75);
INSERT INTO public.analisis_sensorial_muestra VALUES (26, 15, 5.92);
INSERT INTO public.analisis_sensorial_muestra VALUES (26, 17, 5.58);
INSERT INTO public.analisis_sensorial_muestra VALUES (26, 10, 11.83);


--
-- TOC entry 3747 (class 0 OID 34109)
-- Dependencies: 220
-- Data for Name: calidad_fermentacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.calidad_fermentacion VALUES (1, 'Buena', NULL);
INSERT INTO public.calidad_fermentacion VALUES (2, 'Media', NULL);
INSERT INTO public.calidad_fermentacion VALUES (3, 'Total', NULL);


--
-- TOC entry 3731 (class 0 OID 33941)
-- Dependencies: 204
-- Data for Name: caso_estudio; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.caso_estudio VALUES (34, 'Efecto de la temperatura y tiempo de tostado en los caracteres sensoriales y en las propiedades químicas de granos de cacao (Theobroma cacao L.) procedente de Uchiza, San Martín – Perú para la obtención de NIBS', '2016-10-10', 'Se estudiaron las variedades de cacao (Theobroma cacao L.) CCN-51 e ICS-6,
procedentes del distrito de Uchiza, provincia de Tocache, departamento de San Martín,
en Perú. Se efectuó el tratamiento térmico de tostado a las temperaturas de 120 y 130 °C
por 40 y 50 minutos, los nibs de cacao (granos de cacao tostados y pelados) fueron
evaluados sensorialmente por seis jueces entrenados. ');
INSERT INTO public.caso_estudio VALUES (35, 'Efecto de la temperatura y tiempo de tostado en los caracteres sensoriales y en las propiedades químicas de granos de cacao (Theobroma cacao L.) procedente de Uchiza, San Martín – Perú para la obtención de NIBS', '2016-10-10', 'Se estudiaron las variedades de cacao (Theobroma cacao L.) CCN-51 e ICS-6,
procedentes del distrito de Uchiza, provincia de Tocache, departamento de San Martín,
en Perú. Se efectuó el tratamiento térmico de tostado a las temperaturas de 120 y 130 °C
por 40 y 50 minutos, los nibs de cacao (granos de cacao tostados y pelados) fueron
evaluados sensorialmente por seis jueces entrenados. ');


--
-- TOC entry 3737 (class 0 OID 33965)
-- Dependencies: 210
-- Data for Name: locacion_plantacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locacion_plantacion VALUES (12, 35, 1, 1, 542, 0, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, '0101000020E6100000AEF199EC9FDF53C01762F5471806ECBF', ' Distrito de Uchiza, provincia de Tocache, departamento de San Martín, en Perú', '');


--
-- TOC entry 3745 (class 0 OID 34026)
-- Dependencies: 218
-- Data for Name: muestra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.muestra VALUES (25, 12, 1, 1, 1, 2, '2016-10-10', 6.00, 0.00, 8.00, 1.40, 12.32, 8.19, 21.96);
INSERT INTO public.muestra VALUES (26, 12, 1, 1, 1, 2, '2016-10-10', 5.00, 0.00, 8.00, 1.60, 12.79, 8.24, 22.45);
INSERT INTO public.muestra VALUES (27, 12, 1, 1, 1, 2, NULL, NULL, NULL, NULL, 1.29, 13.80, 9.78, 24.97);
INSERT INTO public.muestra VALUES (28, 12, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1.87, 12.82, 9.32, 23.39);


--
-- TOC entry 3750 (class 0 OID 34122)
-- Dependencies: 223
-- Data for Name: registro_fermentacion; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3552 (class 0 OID 33323)
-- Dependencies: 199
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3752 (class 0 OID 34130)
-- Dependencies: 225
-- Data for Name: tipo_analisis_sensorial; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_analisis_sensorial VALUES (10, 'Cacao', NULL);
INSERT INTO public.tipo_analisis_sensorial VALUES (11, 'Floral', NULL);
INSERT INTO public.tipo_analisis_sensorial VALUES (12, 'Frutal', NULL);
INSERT INTO public.tipo_analisis_sensorial VALUES (13, 'Nuez', NULL);
INSERT INTO public.tipo_analisis_sensorial VALUES (14, 'Caramelo', NULL);
INSERT INTO public.tipo_analisis_sensorial VALUES (15, 'Amargor', NULL);
INSERT INTO public.tipo_analisis_sensorial VALUES (16, 'Acidez', NULL);
INSERT INTO public.tipo_analisis_sensorial VALUES (17, 'Astringencia', NULL);
INSERT INTO public.tipo_analisis_sensorial VALUES (18, 'Verde', NULL);


--
-- TOC entry 3733 (class 0 OID 33949)
-- Dependencies: 206
-- Data for Name: tipo_bosque; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_bosque VALUES (1, 'Bosques húmedos tropicales y subtropicales de frondosas', 'Es un tipo de bioma que agrupa los ecosistemas de bosque de clima tropical o subtropical húmedo y algunos climas templados, situado mayormente en la zona intertropical, y caracterizado por una formación vegetal arbórea alta y densa, de varios estratos, predominantemente perennifolia y de hoja ancha (de frondosas o latifoliado), de clima cálido (a excepción de los montanos que son fríos y templados) con variaciones térmicas de menos de 5 °C y lluvioso y nuboso durante todo o casi todo el año.');
INSERT INTO public.tipo_bosque VALUES (2, 'Bosques secos tropicales y subtropicales de frondosas', 'Es el ecosistema de semidensa o densa vegetación arbolada, que alterna climas estacionales lluviosos breves con climas secos más prolongados. Se encuentra en latitudes tropicales y subtropicales, y ocupa una extensión total de 11,5 millones de km².');
INSERT INTO public.tipo_bosque VALUES (3, 'Bosques tropicales y subtropicales de coníferas.', 'Constituyen un bioma forestal terrestre que se presenta en zonas altas y bajas de clima subtropical semi-húmedo con una estación seca larga y escasas precipitaciones donde la vegetación predominante son los bosques subtropicales de pino y bosques mixtos (formados por coníferas y frondosas).');
INSERT INTO public.tipo_bosque VALUES (4, 'Bosques templados de frondosas y mixtos.', 'Es uno de los catorce biomas en los que el WWF clasifica las ecorregiones terrestres, incluyen los bosques caducifolios, bosques laurifolios y bosques mixtos. Son bosques templados (de clima templado) mayormente dominados por angiospermas y que poseen gran variabilidad de temperatura y precipitaciones.');
INSERT INTO public.tipo_bosque VALUES (5, 'Bosques templados de coníferas.', 'Es un bioma terrestre correspondiente a bosques de coníferas de latitudes medias de clima templado o subalpino, vegetación perennifolia, con veranos cálidos, inviernos fríos y pluviosidad suficiente en donde predominan los árboles gimnospermos o coníferas. Por lo general son de altitud (bosque subalpino).');
INSERT INTO public.tipo_bosque VALUES (6, 'Bosques boreales/Taiga.', 'Es un bioma caracterizado por sus formaciones boscosas de coníferas, siendo una de las mayores masas forestales del planeta. En Canadá se emplea «bosque boreal» para designar la zona sur del ecosistema, mientras que «taiga» se usa para la zona más próxima a la línea de vegetación ártica. En otros países se emplea «taiga» para referirse a los bosques boreales rusos y bosque de coníferas para los demás países.');
INSERT INTO public.tipo_bosque VALUES (7, 'Bosques y matorrales mediterráneos.', 'Es un bioma de bosques y matorrales que se desarrolla en regiones con clima mediterráneo, caracterizado por inviernos templados, veranos secos, otoños cálidos y primaveras con abundantes precipitaciones, además de frecuentes incendios forestales a los cuales la vegetación está adaptada. Está representado por comunidades vegetales similares adaptadas para soportar el verano árido.');
INSERT INTO public.tipo_bosque VALUES (8, 'Manglar', 'Es un área biótica o bioma formada por árboles muy tolerantes a las sales existentes en la zona intermareal cercana a la desembocadura de cursos de agua dulce en latitudes tropicales y subtropicales. Así, entre las áreas con manglares se incluyen estuarios y zonas costeras. Tienen una gran diversidad biológica con alta productividad y en ellas se encuentran muchas especies, tanto de aves como de peces, crustáceos, moluscos y otras.');


--
-- TOC entry 3741 (class 0 OID 34006)
-- Dependencies: 214
-- Data for Name: tipo_cacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_cacao VALUES (1, 'Forastero', NULL);
INSERT INTO public.tipo_cacao VALUES (2, 'Trinitario', NULL);
INSERT INTO public.tipo_cacao VALUES (3, 'Criollo', NULL);


--
-- TOC entry 3748 (class 0 OID 34115)
-- Dependencies: 221
-- Data for Name: tipo_cacao_muestra; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_cacao_muestra VALUES (25, 1);
INSERT INTO public.tipo_cacao_muestra VALUES (26, 1);


--
-- TOC entry 3743 (class 0 OID 34014)
-- Dependencies: 216
-- Data for Name: tipo_fermentador; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_fermentador VALUES (1, 'Saco de yute', NULL, NULL);
INSERT INTO public.tipo_fermentador VALUES (2, 'Rotor de madera', NULL, NULL);
INSERT INTO public.tipo_fermentador VALUES (3, 'Rumo o monton', NULL, NULL);
INSERT INTO public.tipo_fermentador VALUES (4, 'Caja de madera', NULL, NULL);
INSERT INTO public.tipo_fermentador VALUES (5, 'Balde plastico', NULL, NULL);


--
-- TOC entry 3739 (class 0 OID 33988)
-- Dependencies: 212
-- Data for Name: tipo_secado; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_secado VALUES (1, 'Secado natural en tendal de madera', NULL);
INSERT INTO public.tipo_secado VALUES (2, 'Secado natural en tendal de plastico', NULL);
INSERT INTO public.tipo_secado VALUES (3, 'Secado natural en tendal de cemento', NULL);
INSERT INTO public.tipo_secado VALUES (4, 'Secado con secadora de cacao rectangular', NULL);
INSERT INTO public.tipo_secado VALUES (5, 'Secado con secadora de cacao cilindrica vertical', NULL);
INSERT INTO public.tipo_secado VALUES (6, 'Secado por calentamiento', NULL);
INSERT INTO public.tipo_secado VALUES (7, 'Secado por combustion', NULL);
INSERT INTO public.tipo_secado VALUES (8, 'Secado por ventilacion', NULL);
INSERT INTO public.tipo_secado VALUES (9, 'Secado por circulación natural', NULL);
INSERT INTO public.tipo_secado VALUES (10, 'Secado por circulación forzada', NULL);


--
-- TOC entry 3735 (class 0 OID 33957)
-- Dependencies: 208
-- Data for Name: tipo_suelo; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tipo_suelo VALUES (1, 'Suelos arenosos', 'Incapaces de retener el agua, son escasos en materia orgánica y por lo tanto poco fértiles.');
INSERT INTO public.tipo_suelo VALUES (2, 'Suelos calizos', 'Abundan en minerales calcáreos y por lo tanto en sales, lo cual les confiere dureza, aridez y color blanquecino.');
INSERT INTO public.tipo_suelo VALUES (3, 'Suelos humíferos', 'De tierra negra, en ellos abunda la materia orgánica en descomposición y retienen muy bien el agua, siendo muy fértiles.');
INSERT INTO public.tipo_suelo VALUES (4, 'Suelos arcillosos', 'Compuestos por finos granos amarillentos que retienen muy bien el agua, por lo que suelen inundarse con facilidad.');
INSERT INTO public.tipo_suelo VALUES (5, 'Suelos pedregosos', 'Compuestos por rocas de distintos tamaños, son muy porosos y no retienen en nada el agua.');
INSERT INTO public.tipo_suelo VALUES (6, 'Suelos mixtos', 'Suelos mezclados, por lo general entre arenosos y arcillosos.');


--
-- TOC entry 3775 (class 0 OID 0)
-- Dependencies: 219
-- Name: calidad_fermentacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.calidad_fermentacion_id_seq', 3, true);


--
-- TOC entry 3776 (class 0 OID 0)
-- Dependencies: 203
-- Name: caso_estudio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.caso_estudio_id_seq', 35, true);


--
-- TOC entry 3777 (class 0 OID 0)
-- Dependencies: 197
-- Name: id_caso_estudio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_caso_estudio_seq', 4, true);


--
-- TOC entry 3778 (class 0 OID 0)
-- Dependencies: 209
-- Name: locacion_plantacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locacion_plantacion_id_seq', 12, true);


--
-- TOC entry 3779 (class 0 OID 0)
-- Dependencies: 217
-- Name: muestra_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.muestra_id_seq', 28, true);


--
-- TOC entry 3780 (class 0 OID 0)
-- Dependencies: 222
-- Name: registro_fermentacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.registro_fermentacion_id_seq', 1, false);


--
-- TOC entry 3781 (class 0 OID 0)
-- Dependencies: 224
-- Name: tipo_analisis_sensorial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_analisis_sensorial_id_seq', 18, true);


--
-- TOC entry 3782 (class 0 OID 0)
-- Dependencies: 205
-- Name: tipo_bosque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_bosque_id_seq', 8, true);


--
-- TOC entry 3783 (class 0 OID 0)
-- Dependencies: 213
-- Name: tipo_cacao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_cacao_id_seq', 3, true);


--
-- TOC entry 3784 (class 0 OID 0)
-- Dependencies: 215
-- Name: tipo_fermentador_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_fermentador_id_seq', 5, true);


--
-- TOC entry 3785 (class 0 OID 0)
-- Dependencies: 211
-- Name: tipo_secado_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_secado_id_seq', 10, true);


--
-- TOC entry 3786 (class 0 OID 0)
-- Dependencies: 207
-- Name: tipo_suelo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipo_suelo_id_seq', 6, true);


--
-- TOC entry 3590 (class 2606 OID 34140)
-- Name: analisis_sensorial_muestra analisis_sensorial_muestra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analisis_sensorial_muestra
    ADD CONSTRAINT analisis_sensorial_muestra_pkey PRIMARY KEY (id_tipo_analisis, id_muestra);


--
-- TOC entry 3582 (class 2606 OID 34114)
-- Name: calidad_fermentacion calidad_fermentacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.calidad_fermentacion
    ADD CONSTRAINT calidad_fermentacion_pkey PRIMARY KEY (id);


--
-- TOC entry 3566 (class 2606 OID 33946)
-- Name: caso_estudio caso_estudio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.caso_estudio
    ADD CONSTRAINT caso_estudio_pkey PRIMARY KEY (id);


--
-- TOC entry 3572 (class 2606 OID 33973)
-- Name: locacion_plantacion locacion_plantacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacion_plantacion
    ADD CONSTRAINT locacion_plantacion_pkey PRIMARY KEY (id);


--
-- TOC entry 3580 (class 2606 OID 34031)
-- Name: muestra muestra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.muestra
    ADD CONSTRAINT muestra_pkey PRIMARY KEY (id);


--
-- TOC entry 3586 (class 2606 OID 34127)
-- Name: registro_fermentacion registro_fermentacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_fermentacion
    ADD CONSTRAINT registro_fermentacion_pkey PRIMARY KEY (id);


--
-- TOC entry 3588 (class 2606 OID 34135)
-- Name: tipo_analisis_sensorial tipo_analisis_sensorial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_analisis_sensorial
    ADD CONSTRAINT tipo_analisis_sensorial_pkey PRIMARY KEY (id);


--
-- TOC entry 3568 (class 2606 OID 33954)
-- Name: tipo_bosque tipo_bosque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_bosque
    ADD CONSTRAINT tipo_bosque_pkey PRIMARY KEY (id);


--
-- TOC entry 3584 (class 2606 OID 34119)
-- Name: tipo_cacao_muestra tipo_cacao_muestra_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cacao_muestra
    ADD CONSTRAINT tipo_cacao_muestra_pkey PRIMARY KEY (id_muestra, id_tipo_cacao);


--
-- TOC entry 3576 (class 2606 OID 34011)
-- Name: tipo_cacao tipo_cacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cacao
    ADD CONSTRAINT tipo_cacao_pkey PRIMARY KEY (id);


--
-- TOC entry 3578 (class 2606 OID 34022)
-- Name: tipo_fermentador tipo_fermentador_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_fermentador
    ADD CONSTRAINT tipo_fermentador_pkey PRIMARY KEY (id);


--
-- TOC entry 3574 (class 2606 OID 33993)
-- Name: tipo_secado tipo_secado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_secado
    ADD CONSTRAINT tipo_secado_pkey PRIMARY KEY (id);


--
-- TOC entry 3570 (class 2606 OID 33962)
-- Name: tipo_suelo tipo_suelo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_suelo
    ADD CONSTRAINT tipo_suelo_pkey PRIMARY KEY (id);


--
-- TOC entry 3597 (class 2606 OID 34167)
-- Name: muestra calidad_fermantacion_muestra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.muestra
    ADD CONSTRAINT calidad_fermantacion_muestra_fkey FOREIGN KEY (id_calidad_fermentacion) REFERENCES public.calidad_fermentacion(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3591 (class 2606 OID 33978)
-- Name: locacion_plantacion id_caso_estudio_foreign_key; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacion_plantacion
    ADD CONSTRAINT id_caso_estudio_foreign_key FOREIGN KEY (id_caso_estudio) REFERENCES public.caso_estudio(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 3594 (class 2606 OID 34151)
-- Name: muestra localidad_plantacion_muestra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.muestra
    ADD CONSTRAINT localidad_plantacion_muestra_fkey FOREIGN KEY (id_localidad_plantacion) REFERENCES public.locacion_plantacion(id) ON UPDATE CASCADE;


--
-- TOC entry 3601 (class 2606 OID 34141)
-- Name: analisis_sensorial_muestra muestra_analisis_sensorial_muestra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analisis_sensorial_muestra
    ADD CONSTRAINT muestra_analisis_sensorial_muestra_fkey FOREIGN KEY (id_muestra) REFERENCES public.muestra(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3600 (class 2606 OID 34172)
-- Name: registro_fermentacion muestra_registro_fermentacion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.registro_fermentacion
    ADD CONSTRAINT muestra_registro_fermentacion_fkey FOREIGN KEY (id_muestra) REFERENCES public.muestra(id);


--
-- TOC entry 3599 (class 2606 OID 34182)
-- Name: tipo_cacao_muestra muestra_tipo_tipo_cacao_muestra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cacao_muestra
    ADD CONSTRAINT muestra_tipo_tipo_cacao_muestra_fkey FOREIGN KEY (id_muestra) REFERENCES public.muestra(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3602 (class 2606 OID 34146)
-- Name: analisis_sensorial_muestra tipo_analisis_sensorial_analisis_sensorial_muestra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.analisis_sensorial_muestra
    ADD CONSTRAINT tipo_analisis_sensorial_analisis_sensorial_muestra_fkey FOREIGN KEY (id_tipo_analisis) REFERENCES public.tipo_analisis_sensorial(id);


--
-- TOC entry 3592 (class 2606 OID 33994)
-- Name: locacion_plantacion tipo_bosque_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacion_plantacion
    ADD CONSTRAINT tipo_bosque_fkey FOREIGN KEY (id_tipo_bosque) REFERENCES public.tipo_bosque(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3598 (class 2606 OID 34177)
-- Name: tipo_cacao_muestra tipo_cacao_tipo_cacao_muestra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipo_cacao_muestra
    ADD CONSTRAINT tipo_cacao_tipo_cacao_muestra_fkey FOREIGN KEY (id_tipo_cacao) REFERENCES public.tipo_cacao(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3595 (class 2606 OID 34157)
-- Name: muestra tipo_fermentador_muestra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.muestra
    ADD CONSTRAINT tipo_fermentador_muestra_fkey FOREIGN KEY (id_tipo_fermentador) REFERENCES public.tipo_fermentador(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3596 (class 2606 OID 34162)
-- Name: muestra tipo_secado_muestra_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.muestra
    ADD CONSTRAINT tipo_secado_muestra_fkey FOREIGN KEY (id_tipo_secado) REFERENCES public.tipo_secado(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3593 (class 2606 OID 33999)
-- Name: locacion_plantacion tipo_suelo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locacion_plantacion
    ADD CONSTRAINT tipo_suelo_fkey FOREIGN KEY (id_tipo_suelo) REFERENCES public.tipo_suelo(id);


--
-- TOC entry 3761 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2021-01-18 18:13:08

--
-- PostgreSQL database dump complete
--

