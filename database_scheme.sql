--
-- PostgreSQL database dump
--

\restrict 2c6UNBaC2hvQTPcDBOPCnFEzdikecdzsFV4JerJjQrBF2ep6S8rAVpcdc1gv75w

-- Dumped from database version 18.0
-- Dumped by pg_dump version 18.0

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
-- Name: update_demographic_percentage(); Type: FUNCTION; Schema: public; Owner: postgres
--


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: activity_statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_statistics (
    id integer NOT NULL,
    id_demographic integer,
    activity character varying(100),
    id_activity_type integer,
    population_count integer,
    measure_value double precision
);


ALTER TABLE public.activity_statistics OWNER TO postgres;

--
-- Name: activity_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_statistics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activity_statistics_id_seq OWNER TO postgres;

--
-- Name: activity_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_statistics_id_seq OWNED BY public.activity_statistics.id;


--
-- Name: activity_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.activity_type (
    id integer NOT NULL,
    activity_type character varying(20)
);


ALTER TABLE public.activity_type OWNER TO postgres;

--
-- Name: activity_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.activity_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.activity_type_id_seq OWNER TO postgres;

--
-- Name: activity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.activity_type_id_seq OWNED BY public.activity_type.id;


--
-- Name: age_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.age_category (
    id integer NOT NULL,
    age_upper_bound integer NOT NULL,
    age_group_label text NOT NULL
);


ALTER TABLE public.age_category OWNER TO postgres;

--
-- Name: age_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.age_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.age_category_id_seq OWNER TO postgres;

--
-- Name: age_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.age_category_id_seq OWNED BY public.age_category.id;


--
-- Name: data_years; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.data_years (
    id integer NOT NULL,
    year_value integer NOT NULL
);


ALTER TABLE public.data_years OWNER TO postgres;

--
-- Name: data_years_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.data_years_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.data_years_id_seq OWNER TO postgres;

--
-- Name: data_years_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.data_years_id_seq OWNED BY public.data_years.id;


--
-- Name: demographic_distribution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.demographic_distribution (
    id integer NOT NULL,
    id_year integer,
    id_gender integer,
    id_age integer,
    population_count integer,
    population_percentage double precision
);


ALTER TABLE public.demographic_distribution OWNER TO postgres;

--
-- Name: demographic_distribution_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.demographic_distribution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.demographic_distribution_id_seq OWNER TO postgres;

--
-- Name: demographic_distribution_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.demographic_distribution_id_seq OWNED BY public.demographic_distribution.id;


--
-- Name: environmental_conditions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.environmental_conditions (
    id integer NOT NULL,
    id_year integer NOT NULL,
    safe_water_access_percent double precision,
    sanitation_access_percent double precision
);


ALTER TABLE public.environmental_conditions OWNER TO postgres;

--
-- Name: environmental_conditions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.environmental_conditions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.environmental_conditions_id_seq OWNER TO postgres;

--
-- Name: environmental_conditions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.environmental_conditions_id_seq OWNED BY public.environmental_conditions.id;


--
-- Name: gender_category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gender_category (
    id integer NOT NULL,
    gender_label text NOT NULL
);


ALTER TABLE public.gender_category OWNER TO postgres;

--
-- Name: gender_category_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gender_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gender_category_id_seq OWNER TO postgres;

--
-- Name: gender_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gender_category_id_seq OWNED BY public.gender_category.id;


--
-- Name: healthcare_resources; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.healthcare_resources (
    id integer NOT NULL,
    id_year integer NOT NULL,
    doctors_per_10000 double precision,
    nurses_per_10000 double precision,
    pharmacists_per_10000 double precision
);


ALTER TABLE public.healthcare_resources OWNER TO postgres;

--
-- Name: healthcare_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.healthcare_resources_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.healthcare_resources_id_seq OWNER TO postgres;

--
-- Name: healthcare_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.healthcare_resources_id_seq OWNED BY public.healthcare_resources.id;


--
-- Name: sickness; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sickness (
    id integer NOT NULL,
    sickness_label text NOT NULL,
    id_parent_sickness integer
);


ALTER TABLE public.sickness OWNER TO postgres;

--
-- Name: sickness_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sickness_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sickness_id_seq OWNER TO postgres;

--
-- Name: sickness_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sickness_id_seq OWNED BY public.sickness.id;


--
-- Name: sickness_statistics; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sickness_statistics (
    id integer NOT NULL,
    id_demographic integer,
    id_sickness integer,
    count_cases integer,
    count_deaths integer
);


ALTER TABLE public.sickness_statistics OWNER TO postgres;

--
-- Name: sickness_statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sickness_statistics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sickness_statistics_id_seq OWNER TO postgres;

--
-- Name: sickness_statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sickness_statistics_id_seq OWNED BY public.sickness_statistics.id;


--
-- Name: total_population; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.total_population (
    id integer NOT NULL,
    id_year integer,
    population_total bigint NOT NULL
);


ALTER TABLE public.total_population OWNER TO postgres;

--
-- Name: total_population_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.total_population_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.total_population_id_seq OWNER TO postgres;

--
-- Name: total_population_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.total_population_id_seq OWNED BY public.total_population.id;


--
-- Name: activity_statistics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_statistics ALTER COLUMN id SET DEFAULT nextval('public.activity_statistics_id_seq'::regclass);


--
-- Name: activity_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_type ALTER COLUMN id SET DEFAULT nextval('public.activity_type_id_seq'::regclass);


--
-- Name: age_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.age_category ALTER COLUMN id SET DEFAULT nextval('public.age_category_id_seq'::regclass);


--
-- Name: data_years id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_years ALTER COLUMN id SET DEFAULT nextval('public.data_years_id_seq'::regclass);


--
-- Name: demographic_distribution id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demographic_distribution ALTER COLUMN id SET DEFAULT nextval('public.demographic_distribution_id_seq'::regclass);


--
-- Name: environmental_conditions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.environmental_conditions ALTER COLUMN id SET DEFAULT nextval('public.environmental_conditions_id_seq'::regclass);


--
-- Name: gender_category id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender_category ALTER COLUMN id SET DEFAULT nextval('public.gender_category_id_seq'::regclass);


--
-- Name: healthcare_resources id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.healthcare_resources ALTER COLUMN id SET DEFAULT nextval('public.healthcare_resources_id_seq'::regclass);


--
-- Name: sickness id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sickness ALTER COLUMN id SET DEFAULT nextval('public.sickness_id_seq'::regclass);


--
-- Name: sickness_statistics id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sickness_statistics ALTER COLUMN id SET DEFAULT nextval('public.sickness_statistics_id_seq'::regclass);


--
-- Name: total_population id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.total_population ALTER COLUMN id SET DEFAULT nextval('public.total_population_id_seq'::regclass);


--
-- Name: activity_statistics activity_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_statistics
    ADD CONSTRAINT activity_statistics_pkey PRIMARY KEY (id);


--
-- Name: activity_type activity_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_type
    ADD CONSTRAINT activity_type_pkey PRIMARY KEY (id);


--
-- Name: age_category age_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.age_category
    ADD CONSTRAINT age_category_pkey PRIMARY KEY (id);


--
-- Name: data_years data_years_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.data_years
    ADD CONSTRAINT data_years_pkey PRIMARY KEY (id);


--
-- Name: demographic_distribution demographic_distribution_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demographic_distribution
    ADD CONSTRAINT demographic_distribution_pkey PRIMARY KEY (id);


--
-- Name: environmental_conditions environmental_conditions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.environmental_conditions
    ADD CONSTRAINT environmental_conditions_pkey PRIMARY KEY (id);


--
-- Name: gender_category gender_category_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gender_category
    ADD CONSTRAINT gender_category_pkey PRIMARY KEY (id);


--
-- Name: healthcare_resources healthcare_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.healthcare_resources
    ADD CONSTRAINT healthcare_resources_pkey PRIMARY KEY (id);


--
-- Name: sickness sickness_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sickness
    ADD CONSTRAINT sickness_pkey PRIMARY KEY (id);


--
-- Name: sickness_statistics sickness_statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sickness_statistics
    ADD CONSTRAINT sickness_statistics_pkey PRIMARY KEY (id);


--
-- Name: total_population total_population_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.total_population
    ADD CONSTRAINT total_population_pkey PRIMARY KEY (id);


--
-- Name: sickness_statistics unique_sickness_demographic; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sickness_statistics
    ADD CONSTRAINT unique_sickness_demographic UNIQUE (id_demographic, id_sickness);


--
-- Name: demographic_distribution trg_update_demographic_percentage; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER trg_update_demographic_percentage BEFORE INSERT OR UPDATE ON public.demographic_distribution FOR EACH ROW EXECUTE FUNCTION public.update_demographic_percentage();


--
-- Name: activity_statistics activity_statistics_id_activity_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_statistics
    ADD CONSTRAINT activity_statistics_id_activity_type_fkey FOREIGN KEY (id_activity_type) REFERENCES public.activity_type(id);


--
-- Name: activity_statistics activity_statistics_id_demographic_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.activity_statistics
    ADD CONSTRAINT activity_statistics_id_demographic_fkey FOREIGN KEY (id_demographic) REFERENCES public.demographic_distribution(id);


--
-- Name: demographic_distribution demographic_distribution_id_age_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demographic_distribution
    ADD CONSTRAINT demographic_distribution_id_age_fkey FOREIGN KEY (id_age) REFERENCES public.age_category(id);


--
-- Name: demographic_distribution demographic_distribution_id_gender_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demographic_distribution
    ADD CONSTRAINT demographic_distribution_id_gender_fkey FOREIGN KEY (id_gender) REFERENCES public.gender_category(id);


--
-- Name: demographic_distribution demographic_distribution_id_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.demographic_distribution
    ADD CONSTRAINT demographic_distribution_id_year_fkey FOREIGN KEY (id_year) REFERENCES public.data_years(id);


--
-- Name: environmental_conditions environmental_conditions_id_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.environmental_conditions
    ADD CONSTRAINT environmental_conditions_id_year_fkey FOREIGN KEY (id_year) REFERENCES public.data_years(id);


--
-- Name: healthcare_resources healthcare_resources_id_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.healthcare_resources
    ADD CONSTRAINT healthcare_resources_id_year_fkey FOREIGN KEY (id_year) REFERENCES public.data_years(id);


--
-- Name: sickness sickness_id_parent_sickness_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sickness
    ADD CONSTRAINT sickness_id_parent_sickness_fkey FOREIGN KEY (id_parent_sickness) REFERENCES public.sickness(id);


--
-- Name: sickness_statistics sickness_statistics_id_demographic_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sickness_statistics
    ADD CONSTRAINT sickness_statistics_id_demographic_fkey FOREIGN KEY (id_demographic) REFERENCES public.demographic_distribution(id);


--
-- Name: sickness_statistics sickness_statistics_id_sickness_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sickness_statistics
    ADD CONSTRAINT sickness_statistics_id_sickness_fkey FOREIGN KEY (id_sickness) REFERENCES public.sickness(id);


--
-- Name: total_population total_population_id_year_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.total_population
    ADD CONSTRAINT total_population_id_year_fkey FOREIGN KEY (id_year) REFERENCES public.data_years(id);


--
-- PostgreSQL database dump complete
--

\unrestrict 2c6UNBaC2hvQTPcDBOPCnFEzdikecdzsFV4JerJjQrBF2ep6S8rAVpcdc1gv75w

