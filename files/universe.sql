--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text,
    diameter_ligth_years integer,
    age_million_years integer NOT NULL,
    distance_earth_ligth_years integer,
    number_of_stars numeric NOT NULL,
    solar_mass_estimate numeric,
    galaxy_type text NOT NULL,
    is_eye_visible boolean,
    contains_life boolean
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
-- Name: image; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.image (
    image_id integer NOT NULL,
    name character varying(50) NOT NULL,
    url_image text NOT NULL,
    credits character varying(80) NOT NULL,
    size_kb numeric,
    is_free_image boolean,
    is_hd_image boolean,
    galaxy_id integer,
    star_id integer,
    planet_id integer,
    moon_id integer
);


ALTER TABLE public.image OWNER TO freecodecamp;

--
-- Name: image_image_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.image_image_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.image_image_id_seq OWNER TO freecodecamp;

--
-- Name: image_image_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.image_image_id_seq OWNED BY public.image.image_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    radius_km integer NOT NULL,
    distance_host_km integer NOT NULL,
    mass_trillion_tm numeric NOT NULL,
    orbit_type character varying(50) NOT NULL,
    surface_description text NOT NULL,
    is_real boolean,
    has_water boolean,
    planet_id integer
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
    name character varying(50) NOT NULL,
    radius_km integer NOT NULL,
    orbital_period integer NOT NULL,
    gravity numeric,
    mass_trillion_tm numeric NOT NULL,
    mean_temperature_celsius numeric,
    inhabitants text,
    has_life boolean,
    is_real boolean,
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
    name character varying(50) NOT NULL,
    radius_km integer NOT NULL,
    age_million_years integer NOT NULL,
    discovered_before_christ boolean,
    spectral_class character varying(50) NOT NULL,
    solar_mass_estimate numeric,
    description text,
    is_eye_visible boolean,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: image image_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image ALTER COLUMN image_id SET DEFAULT nextval('public.image_image_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Is a barred spiral galaxy and is the nearest major galaxy to the Milky Way, where the Solar System resides.It was originally named the Andromeda Nebula and is cataloged as Messier 31, M31, and NGC 224', 152000, 10000, 2537000, 10000000000000, 8000000000, 'spiral', true, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'The Milky Way is a barred spiral galaxy that includes the Solar System, The term Milky Way is a translation of the Latin via lactea.From Earth, the Milky Way appears as a band because its disk-shaped structure is viewed from within. ', 180000, 13200, 25000, 400000000000, 4000000000, 'barred spiral', true, true);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Is a spiral galaxy in the constellation Triangulum. It is catalogued as Messier 33. The Triangulum Galaxy is the third-largest member of the Local Group of galaxies, behind the Andromeda Galaxy and the Milky Way.', 60000, 8000, 3000000, 100000000000, 600000000, 'spiral', false, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Also known as Messier Object 104: M104 or NGC 4594 is a peculiar galaxy of unclear classification in the constellation borders of Virgo and Corvus,It has a bright nucleus, an unusually large central bulge, and a prominent dust lane in its outer disk give it the appearance of a hat. ', 50000, 90000, 28000000, 100000000000, 8000000000, 'lenticular', false, false);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Is a satellite galaxy of the Milky Way, is classified as a Magellanic spiral. It contains a stellar bar that is geometrically off center, suggesting that it was a barred dwarf spiral galaxy before its spiral arms were disrupted, likely by tidal interactions from the Small Magellanic Cloud and the Milky Way''s gravity.', 14000, 2000, 163000, 10000000000, 700000000, 'irregular', false, false);
INSERT INTO public.galaxy VALUES (6, 'Alpha Centaurus', 'Centaurus A also known as NGC 5128 or Caldwell 77 is a galaxy in the constellation of Centaurus. It was discovered in 1826 by Scottish astronomer James Dunlop from his home in Parramatta, in New South Wales, Australia. The center of the galaxy contains a supermassive black hole with a mass of 55 million solar masses', 120000, 12000, 13000000, 100000000000, 6000000000, 'elliptical', false, false);
INSERT INTO public.galaxy VALUES (7, 'Cigar', 'Messier 82 also known as NGC 3034, Cigar Galaxy is a starburst galaxy in the constellation Ursa Major.It is the second-largest member of the M81 Group. It is about five times more luminous than the Milky Way and its central region is about one hundred times more luminous.', 37000, 9500, 12000000, 100000000000, 1000000000, 'irregular', false, false);


--
-- Data for Name: image; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.image VALUES (1, 'andromeda_8272', 'https://starwalk.space/gallery/images/Andromeda.jpg', 'Mark Simpson', 8024, true, true, 1, NULL, NULL, NULL);
INSERT INTO public.image VALUES (2, 'milkyway_1232', 'https://starwalk.space/gallery/images/MilkyWay.jpg', 'Homer Simpson', 9024, true, true, 2, NULL, NULL, NULL);
INSERT INTO public.image VALUES (3, 'triangle_galaxy', 'https://nasa.gov/gallery/images/Triangle.jpg', 'Sthepen Atkins', 16512, true, true, 3, NULL, NULL, NULL);
INSERT INTO public.image VALUES (4, 'sun_photo2023', 'https://nasa.gov/gallery/images/Sun2023.jpg', 'Nasa', 8512, true, true, NULL, 2, NULL, NULL);
INSERT INTO public.image VALUES (5, 'earth_2520', 'https://nasa.gov/gallery/images/Earth.jpg', 'Nasa', 8512, true, true, NULL, NULL, 1, NULL);
INSERT INTO public.image VALUES (6, 'moon_2576', 'https://hubble/gallery/Moon.jpg', 'Hubble', 3072, false, true, NULL, NULL, NULL, 1);
INSERT INTO public.image VALUES (7, 'deimos_1233', 'https://hubble/gallery/Deimos.jpg', 'Nasa', 5072, false, true, NULL, NULL, NULL, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1737, 384400, 11695.98, 'Circular', 'Rocky, with impact craters and mostly silicate rocks and minerals', true, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 11, 9377, 1198.94, 'Circular', 'Irregular shape, covered in regolith. Primarily composed of carbonaceous rock', true, false, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 6, 23463, 1853.58, 'Circular', 'Irregular shape, heavily cratered surface. Rich in water ice and carbon-rich dust', true, false, 2);
INSERT INTO public.moon VALUES (4, 'AhIo', 1821, 421700, 14245.52, 'Spherical', 'Volcanically active with sulfur plains and mountains. Primarily composed of silicate rock', false, true, 4);
INSERT INTO public.moon VALUES (5, 'Aafriks', 1561, 671034, 7648.60, 'Spherical', 'Ice-covered surface with linear cracks and ridges. Mostly water ice with subsurface ocean', false, false, 4);
INSERT INTO public.moon VALUES (6, 'Minusmoon', 2634, 1070412, 2604.99, 'Spherical', 'Heavily cratered surface with ancient impact features. Mostly water ice and silicate rocks', false, false, 5);
INSERT INTO public.moon VALUES (7, 'Trianglebig', 1200, 5000, 3566.98, 'Circular', 'Rocky and heavily cratered surface. Silicate rocks and metal-rich minerals', false, true, 6);
INSERT INTO public.moon VALUES (8, 'Trymoon', 900, 4200, 2140.19, 'Circular', 'Smooth icy surface with few features. Water ice and some ammonia compounds', false, false, 6);
INSERT INTO public.moon VALUES (9, 'Trycho', 1900, 7200, 4993.77, 'Spherical', 'Water ice and some ammonia compounds', false, false, 6);
INSERT INTO public.moon VALUES (10, 'HexAnglemoon', 1500, 5800, 4280.38, 'Circular', 'Surface covered in dark volcanic plains. Basaltic rocks and sulfur compounds', false, false, 7);
INSERT INTO public.moon VALUES (11, 'HexBatmoon', 2500, 7800, 7133.96, 'Spherical', 'Surface covered in dark volcanic plains.', false, true, 7);
INSERT INTO public.moon VALUES (12, 'HexCrymoon', 3500, 9800, 10700.94, 'Irregular', 'Basaltic rocks and sulfur compounds', false, false, 7);
INSERT INTO public.moon VALUES (13, 'HexDoublemoon', 6500, 1800, 4280.38, 'Irregular', 'Surface covered in dark volcanic plains.', false, false, 7);
INSERT INTO public.moon VALUES (14, 'HexExtramoon', 500, 800, 7133.96, 'Irregular', 'Surface covered in dark volcanic plains. Basaltic rocks and sulfur compounds', false, true, 7);
INSERT INTO public.moon VALUES (15, 'HexFastmoon', 800, 900, 10700.94, 'Irregular', 'Surface covered in dark volcanic plains.', false, false, 7);
INSERT INTO public.moon VALUES (16, 'Topmoon', 4500, 18000, 12524.15, 'Circular', 'Icy surface with large crater impacts', false, true, 8);
INSERT INTO public.moon VALUES (17, 'Botmoon', 3800, 15000, 9633.96, 'Circular', 'Rugged surface with mountains and valleys', false, false, 9);
INSERT INTO public.moon VALUES (18, 'Majoris', 2000, 8500, 2853.58, 'Irregular', 'Smooth surface with impact craters', false, false, 10);
INSERT INTO public.moon VALUES (19, 'Minoris', 1600, 7200, 1712.15, 'Circular', 'Icy plains with scattered boulders', false, true, 11);
INSERT INTO public.moon VALUES (20, 'Cuartus', 3500, 15000, 8670.56, 'Irregular', 'Mountainous terrain with ice caps. Water ice and organic compounds', false, false, 13);
INSERT INTO public.moon VALUES (21, 'Primus', 2900, 13000, 6743.77, 'Circular', 'Water ice and silicate rocks. Icy surface with long, winding canyons', false, true, 14);
INSERT INTO public.moon VALUES (22, 'Cigaria', 3200, 12000, 7321.81, 'Circular', 'Water ice and ammonia compounds', false, false, 15);
INSERT INTO public.moon VALUES (23, 'Cigarrete', 2600, 22000, 9248.60, 'Irregular', 'Icy surface with cryovolcanoes', false, false, 16);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 6371, 365, 1, 65100.6, 15, 'Earthlings, animals, plants, marien creatures', true, true, 2);
INSERT INTO public.planet VALUES (2, 'Mars', 3389, 687, 0.38, 75814.2, -65, 'Martians, humans', true, true, 2);
INSERT INTO public.planet VALUES (3, 'Venus', 6052, 225, 0.91, 52963.2, 467, '', false, true, 2);
INSERT INTO public.planet VALUES (4, 'Andro A', 5500, 10000, 0.5, 33102, -40, 'Andromedans', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Andro A--', 4200, 12000, 0.6, 40825.8, -15, '', false, false, 1);
INSERT INTO public.planet VALUES (6, 'Triangulus', 4000, 200, 0.4, 28688.4, -10, 'Triangulites', true, false, 3);
INSERT INTO public.planet VALUES (7, 'Hexagonus', 4800, 180, 0.5, 34205.4, -5, 'Hexalites', true, false, 3);
INSERT INTO public.planet VALUES (8, 'Hat Top', 6200, 300, 0.6, 43032.6, -20, '', false, false, 4);
INSERT INTO public.planet VALUES (9, 'Hat Bottom', 5800, 320, 0.5, 37515.6, -25, '', false, false, 4);
INSERT INTO public.planet VALUES (10, 'LMC Major', 7800, 250, 0.7, 49653, -15, 'Magellans', true, false, 5);
INSERT INTO public.planet VALUES (11, 'LMC Minor', 6200, 270, 0.6, 41929.2, -20, '', false, false, 5);
INSERT INTO public.planet VALUES (12, 'LMC Interstellaria', 8200, 230, 0.8, 54066.6, -10, 'Interstellars', true, false, 5);
INSERT INTO public.planet VALUES (13, 'Centauria Prime', 9000, 500, 0.9, 66204, 25, 'Centaurians', true, false, 6);
INSERT INTO public.planet VALUES (14, 'Centauria Secundus', 8500, 480, 0.8, 60687, 20, '', false, false, 6);
INSERT INTO public.planet VALUES (15, 'Cigaria Major', 6500, 280, 0.6, 45239.4, -20, '', false, false, 7);
INSERT INTO public.planet VALUES (16, 'Cigaria Minor', 5800, 300, 0.5, 38619, -25, 'Cigarians', true, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Andromeda A', 2000000, 400, true, 'K0III', 10, 'Andromeda A is a bright orange giant star in the Andromeda galaxy.', true, 1);
INSERT INTO public.star VALUES (2, 'Sol', 695700, 4600, true, 'G2V', 1, 'The Sun is our star, a yellow dwarf that sustains life on Earth.', true, 2);
INSERT INTO public.star VALUES (3, 'Triangle Star', 900000, 200, false, 'B3V', 25, 'Triangulum Star is a young and massive blue star in the Triangulum galaxy.', false, 3);
INSERT INTO public.star VALUES (4, 'Hat Star', 1300000, 300, true, 'F7Iab', 30, 'Hat Star is a brilliant yellow giant star in the Sombrero galaxy.', false, 4);
INSERT INTO public.star VALUES (5, 'Magellan Star', 750000, 100, true, 'O7III', 60, 'Magellan Star is a massive blue star shining brightly in the Large Magellanic Cloud.', false, 5);
INSERT INTO public.star VALUES (6, 'Centaurus Star', 1800000, 500, true, 'K5V', 50, 'Centaurus A Star is an orange dwarf with stellar activity in the Centaurus A galaxy.', false, 6);
INSERT INTO public.star VALUES (7, 'Cigar Star', 1000000, 250, true, 'F5Ib', 35, 'Cigar Star is a brilliant yellow supergiant in the Cigar Galaxy.', false, 7);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: image_image_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.image_image_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


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
-- Name: image image_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_name_key UNIQUE (name);


--
-- Name: image image_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_pkey PRIMARY KEY (image_id);


--
-- Name: image image_url_image_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_url_image_key UNIQUE (url_image);


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
-- Name: image image_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: image image_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: image image_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: image image_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.image
    ADD CONSTRAINT image_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


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

