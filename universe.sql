--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    genitive character varying(30) NOT NULL,
    meaning character varying(30) NOT NULL,
    brightest_star character varying(30)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    constellation character varying(50) NOT NULL,
    wide_in_ly integer,
    trivia text
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
    name character varying(30) NOT NULL,
    diameter_in_km numeric NOT NULL,
    surface_material character varying(100) NOT NULL,
    orbit_period_in_days numeric NOT NULL,
    trivia text,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    type character varying(30) NOT NULL,
    color character varying(50) NOT NULL,
    diameter_in_km numeric NOT NULL,
    number_of_moons integer NOT NULL,
    is_easily_observed boolean,
    star_id integer
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
    name character varying(30) NOT NULL,
    is_well_known boolean NOT NULL,
    constellation character varying(30) NOT NULL,
    description text,
    galaxy_id integer NOT NULL
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Andromedae', 'The chained maiden or princess', 'Alpheratz');
INSERT INTO public.constellation VALUES (2, 'Aquarius', 'Aquarii', 'Water-bearer', 'Beta Aquarii');
INSERT INTO public.constellation VALUES (3, 'Draco', 'Draconis', 'Dragon', 'Gamma Draconis');
INSERT INTO public.constellation VALUES (4, 'Gemini', 'Geminorum', 'Twin', 'Pollux');
INSERT INTO public.constellation VALUES (5, 'Scorpio', 'Scorpii', 'Scorpion', 'Antares');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Andromeda', 220000, 'Andromeda is the closest big galaxy to the Milky Way and is expected to collide with the Milky Way around 4.5 billion years from now.');
INSERT INTO public.galaxy VALUES (2, 'Bear Paw Galaxy', 'Lynx', 13500, 'Also known as Bear Claw Galaxy');
INSERT INTO public.galaxy VALUES (3, 'Black Eye Galaxy', 'Coma Berenices', 53800, 'Also known as Sleeping Beauty Galaxy');
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy', 'Sculptor', 144300, 'The largest Cartwheel Galaxy group, made up of four spiral galaxies.');
INSERT INTO public.galaxy VALUES (5, 'Milky Way Galaxy', 'Sagittarius', 100000, 'The galaxy containing the Sun and its Solar System, and therefore Earth');
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Virgo', 50000, 'Also known as Messier Object 104 or M104');
INSERT INTO public.galaxy VALUES (7, 'Sunflower Galaxy', 'Canes Venatici', 100000, 'Similar in appearance to a sunflower.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Dysnomia', 700, 'Believe to be water ice', 15.77, 'Dysnomia is currently the only known moon of the solar system most massive dwarf planet Eris.', 10);
INSERT INTO public.moon VALUES (3, 'Earth Moon', 3476, 'Rocky material', 295, 'The moon orbit is not a nice circle, it varies enough to make the Moon sometimes appear larger when at full Moon - a Supermoon!', 3);
INSERT INTO public.moon VALUES (4, 'Phobos', 10692, 'Fine-grained regolith', 0.32, 'It orbit Mars three times a day, and is so close to the planet surface that in some locations on Mars it cannot always be seen.', 4);
INSERT INTO public.moon VALUES (5, 'Deimos', 12.4, 'Rock rich in carbonaceous', 1.26, 'Deimos is less irregular in shape and orbits Mars every 30 hours.', 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5268.2, 'Dominated by water ice', 7.155, 'Ganymede is even bigger than Mercury, and Pluto.', 5);
INSERT INTO public.moon VALUES (7, 'Callisto', 4820.6, 'Rock and ice', 17, 'Callisto is Jupiter second largest moon and the third largest moon in our solar system.', 5);
INSERT INTO public.moon VALUES (8, 'Io', 3643.2, 'Silicates, sulfur, and sulfur dioxide', 1.77, 'Io is the most volcanically active world in our solar system.', 5);
INSERT INTO public.moon VALUES (9, 'Europa', 3121.6, 'Silicate rock', 3.5, 'Europe is Jupiter fourth largest moon. It is about 90% the size of the Earth Moon.', 5);
INSERT INTO public.moon VALUES (10, 'Titan', 5149.5, 'Organic molecules in the form of sands and liquids', 16, NULL, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', 504.2, 'Fresh, clean ice', 1.37, 'The most reflective bodies of the Solar System.', 6);
INSERT INTO public.moon VALUES (12, 'Hyperion', 270, 'Water ice with only a small amount of rock', 21, 'Hyperion may be similar to a loosely accreted pile of rubble in its physical composition.', 6);
INSERT INTO public.moon VALUES (13, 'Prometheus', 86.2, 'Probably a porous, icy body', 0.613, NULL, 6);
INSERT INTO public.moon VALUES (14, 'Pandora', 81.4, 'Fine (dust-sized) icy material', 0.62, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Phoebe', 213, 'Water ice', 551, NULL, 6);
INSERT INTO public.moon VALUES (16, 'Telesto', 24.8, 'Fine, icy material', 1.88, NULL, 6);
INSERT INTO public.moon VALUES (17, 'Miranda', 471.6, 'Mostly water ice', 1.4, NULL, 7);
INSERT INTO public.moon VALUES (18, 'Ariel', 1157.8, 'Water ice and silicate rock', 252, NULL, 7);
INSERT INTO public.moon VALUES (19, 'Umbriel', 1169.4, 'Water ice and rocky material', 4.14, NULL, 7);
INSERT INTO public.moon VALUES (20, 'Titania', 1576.8, 'Water ice and rocky material', 8.706, NULL, 7);
INSERT INTO public.moon VALUES (21, 'Oberon', 1522.8, 'Ice and rock', 13, NULL, 7);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Inner planet', 'Dark gray', 4879, 0, true, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Inner planet', 'Yellowish', 12104, 0, true, 2);
INSERT INTO public.planet VALUES (3, 'Earth', 'Inner planet', 'Blue, green', 12756, 1, NULL, 3);
INSERT INTO public.planet VALUES (4, 'Mars', 'Inner planet', 'Red', 6792, 2, true, 4);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Outer planet', 'Brown, orange', 142984, 95, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Outer planet', 'Yellowish-brown', 120536, 146, true, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Outer planet', 'Bluish-white', 51118, 28, false, 3);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Outer planet', 'Dark bluish', 49528, 16, false, 4);
INSERT INTO public.planet VALUES (9, 'Pluto', 'Dwarf planet', 'White, brownish-red', 2376, 15, false, 1);
INSERT INTO public.planet VALUES (10, 'Eris', 'Dwarf planet', 'Gray', 2326, 1, false, 2);
INSERT INTO public.planet VALUES (11, 'Ceres', 'Dwarf planet', 'Gray, bluish', 939.4, 0, false, 3);
INSERT INTO public.planet VALUES (12, 'Haumea', 'Dwarf planet', 'Gray, red', 1560, 2, false, 4);
INSERT INTO public.planet VALUES (13, 'Makemake', 'Dwarf planet', 'Reddish-brownish', 1430, 1, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', true, 'Orion', 'Betelgeuse is a red supergiant star in the constellation of Orion. It is usually the tenth-brightest star in the night sky and the second-brightest in its constellation.', 5);
INSERT INTO public.star VALUES (2, 'Rigel', true, 'Orion', 'Rigel is a blue supergiant star in the constellation of Orion.', 5);
INSERT INTO public.star VALUES (3, 'Bellatrix', true, 'Orion', 'Bellatrix is the third-brightest star in the constellation of Orion, positioned 5 degrees west of the red supergiant Betelgeuse (Alpha Orionis)', 5);
INSERT INTO public.star VALUES (4, 'Sirius', true, 'Orion', 'Sirius is the brightest star in the night sky. Sirius appears bright because of its intrinsic luminosity and its proximity to the Solar System.', 5);
INSERT INTO public.star VALUES (5, 'Alpheratz', true, 'Andromeda', 'Alpheratz is a binary star 87 light-years from Earth and is the brightest star in the constellation of Andromeda.', 1);
INSERT INTO public.star VALUES (6, 'Mirach', true, 'Andromeda', 'Mirach is a prominent star in the northern constellation of Andromeda.', 1);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 5, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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

