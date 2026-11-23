--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer,
    orbital_period_years integer NOT NULL,
    is_periodic boolean NOT NULL
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    description text NOT NULL,
    galaxy_type character varying(40) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    distance_from_earth numeric(12,2),
    has_active_nucleus boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    planet_id integer NOT NULL,
    diameter_km integer NOT NULL,
    orbital_distance_km numeric(12,2),
    description text,
    is_tidally_locked boolean NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    star_id integer NOT NULL,
    planet_type character varying(40) NOT NULL,
    orbital_period_days integer NOT NULL,
    mass_earth numeric(10,4),
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(20) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    mass_solar numeric(10,3),
    is_main_sequence boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 1, 76, true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 1, 2533, true);
INSERT INTO public.comet VALUES (3, 'Swift-Tuttle', 1, 133, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our barred spiral home galaxy.', 'Spiral', 13600, 0.00, false);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest major spiral galaxy to the Milky Way.', 'Spiral', 10000, 2537000.00, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Member of the Local Group with active star formation.', 'Spiral', 12000, 2730000.00, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Bright galaxy with a prominent bulge and dust lane.', 'Lenticular', 13250, 29350000.00, true);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 'Grand-design spiral interacting with NGC 5195.', 'Spiral', 400, 23160000.00, true);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Peculiar galaxy powered by a supermassive black hole.', 'Elliptical', 13270, 13050000.00, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 3474, 384400.00, 'Earth''s only natural satellite.', true);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, 9376.00, 'Inner and larger moon of Mars.', true);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, 23463.00, 'Smaller outer moon of Mars.', true);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, 421700.00, 'Most volcanically active body in the Solar System.', true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, 671034.00, 'Icy crust concealing a subsurface ocean.', true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, 1070412.00, 'Largest moon in the Solar System.', true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, 1882709.00, 'Heavily cratered outer Galilean moon.', true);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167, 181366.00, 'Irregular inner moon of Jupiter.', true);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 140, 11460000.00, 'Largest irregular moon of Jupiter.', false);
INSERT INTO public.moon VALUES (10, 'Titan', 6, 5149, 1221870.00, 'Dense atmosphere and liquid methane lakes.', true);
INSERT INTO public.moon VALUES (11, 'Enceladus', 6, 504, 237948.00, 'Cryovolcanic plumes from a southern ocean.', true);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 396, 185539.00, 'Features the giant Herschel crater.', true);
INSERT INTO public.moon VALUES (13, 'Rhea', 6, 1527, 527108.00, 'Second-largest moon of Saturn.', true);
INSERT INTO public.moon VALUES (14, 'Iapetus', 6, 1469, 3560820.00, 'Two-tone coloration and equatorial ridge.', true);
INSERT INTO public.moon VALUES (15, 'Dione', 6, 1123, 377396.00, 'Icy moon with bright ice cliffs.', true);
INSERT INTO public.moon VALUES (16, 'Tethys', 6, 1062, 294619.00, 'Home to the Odysseus impact crater.', true);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 1577, 435910.00, 'Largest moon of Uranus.', true);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 1523, 583520.00, 'Outermost major moon of Uranus.', true);
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 472, 129390.00, 'Extreme canyons and varied terrain.', true);
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, 354759.00, 'Retrograde orbit; likely a captured Kuiper belt object.', true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 'Terrestrial', 88, 0.0553, false, true);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 'Terrestrial', 225, 0.8150, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 'Terrestrial', 365, 1.0000, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 'Terrestrial', 687, 0.1070, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 'Gas Giant', 4333, 317.8000, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 'Gas Giant', 10759, 95.1600, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 'Ice Giant', 30687, 14.5400, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 'Ice Giant', 60190, 17.1500, false, true);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 'Exoplanet', 11, 1.0700, false, true);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri c', 2, 'Super-Earth', 1928, 7.0000, false, true);
INSERT INTO public.planet VALUES (11, 'Alpheratz I', 4, 'Gas Giant', 410, 620.0000, false, true);
INSERT INTO public.planet VALUES (12, 'Mirach Prime', 5, 'Rocky', 540, 2.4000, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 4600, 1.000, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5.5Ve', 4850, 0.122, true);
INSERT INTO public.star VALUES (3, 'Sirius A', 1, 'A1V', 242, 2.063, true);
INSERT INTO public.star VALUES (4, 'Alpheratz', 2, 'B8IVp', 60, 3.800, false);
INSERT INTO public.star VALUES (5, 'Mirach', 2, 'M0III', 4000, 3.500, false);
INSERT INTO public.star VALUES (6, 'M33-X7 Star', 3, 'O7III', 4, 70.000, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: comet comet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

