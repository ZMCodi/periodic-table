--
-- PostgreSQL database dump
--

-- Dumped from database version 15.8 (Homebrew)
-- Dumped by pg_dump version 15.8 (Homebrew)

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
-- Name: periodic_table; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE periodic_table WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'C';


ALTER DATABASE periodic_table OWNER TO postgres;

\connect periodic_table

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
-- Name: elements; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elements (
    atomic_number integer NOT NULL,
    symbol character varying(2) NOT NULL,
    name character varying(40) NOT NULL
);


ALTER TABLE public.elements OWNER TO postgres;

--
-- Name: properties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.properties (
    atomic_number integer NOT NULL,
    atomic_mass numeric NOT NULL,
    melting_point_celsius character varying(7) NOT NULL,
    boiling_point_celsius character varying(7) NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.properties OWNER TO postgres;

--
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    type_id integer NOT NULL,
    type character varying(50) NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- Name: types_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_type_id_seq OWNER TO postgres;

--
-- Name: types_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_type_id_seq OWNED BY public.types.type_id;


--
-- Name: types type_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN type_id SET DEFAULT nextval('public.types_type_id_seq'::regclass);


--
-- Data for Name: elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.elements VALUES (1, 'H', 'Hydrogen');
INSERT INTO public.elements VALUES (2, 'He', 'Helium');
INSERT INTO public.elements VALUES (3, 'Li', 'Lithium');
INSERT INTO public.elements VALUES (4, 'Be', 'Beryllium');
INSERT INTO public.elements VALUES (5, 'B', 'Boron');
INSERT INTO public.elements VALUES (6, 'C', 'Carbon');
INSERT INTO public.elements VALUES (7, 'N', 'Nitrogen');
INSERT INTO public.elements VALUES (8, 'O', 'Oxygen');
INSERT INTO public.elements VALUES (9, 'F', 'Fluorine');
INSERT INTO public.elements VALUES (10, 'Ne', 'Neon');
INSERT INTO public.elements VALUES (11, 'Na', 'Sodium');
INSERT INTO public.elements VALUES (12, 'Mg', 'Magnesium');
INSERT INTO public.elements VALUES (13, 'Al', 'Aluminum');
INSERT INTO public.elements VALUES (14, 'Si', 'Silicon');
INSERT INTO public.elements VALUES (15, 'P', 'Phosphorus');
INSERT INTO public.elements VALUES (16, 'S', 'Sulfur');
INSERT INTO public.elements VALUES (17, 'Cl', 'Chlorine');
INSERT INTO public.elements VALUES (18, 'Ar', 'Argon');
INSERT INTO public.elements VALUES (19, 'K', 'Potassium');
INSERT INTO public.elements VALUES (20, 'Ca', 'Calcium');
INSERT INTO public.elements VALUES (21, 'Sc', 'Scandium');
INSERT INTO public.elements VALUES (22, 'Ti', 'Titanium');
INSERT INTO public.elements VALUES (23, 'V', 'Vanadium');
INSERT INTO public.elements VALUES (24, 'Cr', 'Chromium');
INSERT INTO public.elements VALUES (25, 'Mn', 'Manganese');
INSERT INTO public.elements VALUES (26, 'Fe', 'Iron');
INSERT INTO public.elements VALUES (27, 'Co', 'Cobalt');
INSERT INTO public.elements VALUES (28, 'Ni', 'Nickel');
INSERT INTO public.elements VALUES (29, 'Cu', 'Copper');
INSERT INTO public.elements VALUES (30, 'Zn', 'Zinc');
INSERT INTO public.elements VALUES (31, 'Ga', 'Gallium');
INSERT INTO public.elements VALUES (32, 'Ge', 'Germanium');
INSERT INTO public.elements VALUES (33, 'As', 'Arsenic');
INSERT INTO public.elements VALUES (34, 'Se', 'Selenium');
INSERT INTO public.elements VALUES (35, 'Br', 'Bromine');
INSERT INTO public.elements VALUES (36, 'Kr', 'Krypton');
INSERT INTO public.elements VALUES (37, 'Rb', 'Rubidium');
INSERT INTO public.elements VALUES (38, 'Sr', 'Strontium');
INSERT INTO public.elements VALUES (39, 'Y', 'Yttrium');
INSERT INTO public.elements VALUES (40, 'Zr', 'Zirconium');
INSERT INTO public.elements VALUES (41, 'Nb', 'Niobium');
INSERT INTO public.elements VALUES (42, 'Mo', 'Molybdenum');
INSERT INTO public.elements VALUES (43, 'Tc', 'Technetium');
INSERT INTO public.elements VALUES (44, 'Ru', 'Ruthenium');
INSERT INTO public.elements VALUES (45, 'Rh', 'Rhodium');
INSERT INTO public.elements VALUES (46, 'Pd', 'Palladium');
INSERT INTO public.elements VALUES (47, 'Ag', 'Silver');
INSERT INTO public.elements VALUES (48, 'Cd', 'Cadmium');
INSERT INTO public.elements VALUES (49, 'In', 'Indium');
INSERT INTO public.elements VALUES (50, 'Sn', 'Tin');
INSERT INTO public.elements VALUES (51, 'Sb', 'Antimony');
INSERT INTO public.elements VALUES (52, 'Te', 'Tellurium');
INSERT INTO public.elements VALUES (53, 'I', 'Iodine');
INSERT INTO public.elements VALUES (54, 'Xe', 'Xenon');
INSERT INTO public.elements VALUES (55, 'Cs', 'Cesium');
INSERT INTO public.elements VALUES (56, 'Ba', 'Barium');
INSERT INTO public.elements VALUES (57, 'La', 'Lanthanum');
INSERT INTO public.elements VALUES (58, 'Ce', 'Cerium');
INSERT INTO public.elements VALUES (59, 'Pr', 'Praseodymium');
INSERT INTO public.elements VALUES (60, 'Nd', 'Neodymium');
INSERT INTO public.elements VALUES (61, 'Pm', 'Promethium');
INSERT INTO public.elements VALUES (62, 'Sm', 'Samarium');
INSERT INTO public.elements VALUES (63, 'Eu', 'Europium');
INSERT INTO public.elements VALUES (64, 'Gd', 'Gadolinium');
INSERT INTO public.elements VALUES (65, 'Tb', 'Terbium');
INSERT INTO public.elements VALUES (66, 'Dy', 'Dysprosium');
INSERT INTO public.elements VALUES (67, 'Ho', 'Holmium');
INSERT INTO public.elements VALUES (68, 'Er', 'Erbium');
INSERT INTO public.elements VALUES (69, 'Tm', 'Thulium');
INSERT INTO public.elements VALUES (70, 'Yb', 'Ytterbium');
INSERT INTO public.elements VALUES (71, 'Lu', 'Lutetium');
INSERT INTO public.elements VALUES (72, 'Hf', 'Hafnium');
INSERT INTO public.elements VALUES (73, 'Ta', 'Tantalum');
INSERT INTO public.elements VALUES (74, 'W', 'Tungsten');
INSERT INTO public.elements VALUES (75, 'Re', 'Rhenium');
INSERT INTO public.elements VALUES (76, 'Os', 'Osmium');
INSERT INTO public.elements VALUES (77, 'Ir', 'Iridium');
INSERT INTO public.elements VALUES (78, 'Pt', 'Platinum');
INSERT INTO public.elements VALUES (79, 'Au', 'Gold');
INSERT INTO public.elements VALUES (80, 'Hg', 'Mercury');
INSERT INTO public.elements VALUES (81, 'Tl', 'Thallium');
INSERT INTO public.elements VALUES (82, 'Pb', 'Lead');
INSERT INTO public.elements VALUES (83, 'Bi', 'Bismuth');
INSERT INTO public.elements VALUES (84, 'Po', 'Polonium');
INSERT INTO public.elements VALUES (85, 'At', 'Astatine');
INSERT INTO public.elements VALUES (86, 'Rn', 'Radon');
INSERT INTO public.elements VALUES (87, 'Fr', 'Francium');
INSERT INTO public.elements VALUES (88, 'Ra', 'Radium');
INSERT INTO public.elements VALUES (89, 'Ac', 'Actinium');
INSERT INTO public.elements VALUES (90, 'Th', 'Thorium');
INSERT INTO public.elements VALUES (91, 'Pa', 'Protactinium');
INSERT INTO public.elements VALUES (92, 'U', 'Uranium');
INSERT INTO public.elements VALUES (93, 'Np', 'Neptunium');
INSERT INTO public.elements VALUES (94, 'Pu', 'Plutonium');
INSERT INTO public.elements VALUES (95, 'Am', 'Americium');
INSERT INTO public.elements VALUES (96, 'Cm', 'Curium');
INSERT INTO public.elements VALUES (97, 'Bk', 'Berkelium');
INSERT INTO public.elements VALUES (98, 'Cf', 'Californium');
INSERT INTO public.elements VALUES (99, 'Es', 'Einsteinium');
INSERT INTO public.elements VALUES (100, 'Fm', 'Fermium');
INSERT INTO public.elements VALUES (101, 'Md', 'Mendelevium');
INSERT INTO public.elements VALUES (102, 'No', 'Nobelium');
INSERT INTO public.elements VALUES (103, 'Lr', 'Lawrencium');
INSERT INTO public.elements VALUES (104, 'Rf', 'Rutherfordium');
INSERT INTO public.elements VALUES (105, 'Db', 'Dubnium');
INSERT INTO public.elements VALUES (106, 'Sg', 'Seaborgium');
INSERT INTO public.elements VALUES (107, 'Bh', 'Bohrium');
INSERT INTO public.elements VALUES (108, 'Hs', 'Hassium');
INSERT INTO public.elements VALUES (109, 'Mt', 'Meitnerium');
INSERT INTO public.elements VALUES (110, 'Ds', 'Darmstadtium');
INSERT INTO public.elements VALUES (111, 'Rg', 'Roentgenium');
INSERT INTO public.elements VALUES (112, 'Cn', 'Copernicium');
INSERT INTO public.elements VALUES (113, 'Nh', 'Nihonium');
INSERT INTO public.elements VALUES (114, 'Fl', 'Flerovium');
INSERT INTO public.elements VALUES (115, 'Mc', 'Moscovium');
INSERT INTO public.elements VALUES (116, 'Lv', 'Livermorium');
INSERT INTO public.elements VALUES (117, 'Ts', 'Tennessine');
INSERT INTO public.elements VALUES (118, 'Og', 'Oganesson');


--
-- Data for Name: properties; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.properties VALUES (1, 1.008, '-259.16', '-252.87', 1);
INSERT INTO public.properties VALUES (2, 4.003, '-272.2', '-268.93', 2);
INSERT INTO public.properties VALUES (3, 6.94, '180.54', '1342', 3);
INSERT INTO public.properties VALUES (4, 9.012, '1287', '2470', 4);
INSERT INTO public.properties VALUES (5, 10.81, '2075', '4000', 5);
INSERT INTO public.properties VALUES (6, 12.01, '3550', '4027', 1);
INSERT INTO public.properties VALUES (7, 14.01, '-210.1', '-195.79', 1);
INSERT INTO public.properties VALUES (8, 16.00, '-218.79', '-182.96', 1);
INSERT INTO public.properties VALUES (9, 19.00, '-219.67', '-188.12', 6);
INSERT INTO public.properties VALUES (10, 20.18, '-248.59', '-246.08', 2);
INSERT INTO public.properties VALUES (11, 22.99, '97.72', '883', 3);
INSERT INTO public.properties VALUES (12, 24.31, '650', '1090', 4);
INSERT INTO public.properties VALUES (13, 26.98, '660.32', '2519', 8);
INSERT INTO public.properties VALUES (14, 28.09, '1414', '3265', 5);
INSERT INTO public.properties VALUES (15, 30.97, '44.15', '280.5', 1);
INSERT INTO public.properties VALUES (16, 32.07, '115.21', '444.72', 1);
INSERT INTO public.properties VALUES (17, 35.45, '-101.5', '-34.04', 6);
INSERT INTO public.properties VALUES (18, 39.95, '-189.35', '-185.85', 2);
INSERT INTO public.properties VALUES (19, 39.10, '63.38', '759', 3);
INSERT INTO public.properties VALUES (20, 40.08, '841.9', '1484', 4);
INSERT INTO public.properties VALUES (21, 44.96, '1541', '2830', 7);
INSERT INTO public.properties VALUES (22, 47.87, '1668', '3287', 7);
INSERT INTO public.properties VALUES (23, 50.94, '1910', '3407', 7);
INSERT INTO public.properties VALUES (24, 52.00, '1907', '2671', 7);
INSERT INTO public.properties VALUES (25, 54.94, '1246', '2061', 7);
INSERT INTO public.properties VALUES (26, 55.85, '1538', '2862', 7);
INSERT INTO public.properties VALUES (27, 58.93, '1495', '2927', 7);
INSERT INTO public.properties VALUES (28, 58.69, '1455', '2913', 7);
INSERT INTO public.properties VALUES (29, 63.55, '1084.62', '2562', 7);
INSERT INTO public.properties VALUES (30, 65.38, '419.53', '907', 7);
INSERT INTO public.properties VALUES (31, 69.72, '29.76', '2204', 8);
INSERT INTO public.properties VALUES (32, 72.63, '938.25', '2820', 5);
INSERT INTO public.properties VALUES (33, 74.92, '817', '614', 5);
INSERT INTO public.properties VALUES (34, 78.96, '221', '685', 1);
INSERT INTO public.properties VALUES (35, 79.90, '-7.2', '58.8', 6);
INSERT INTO public.properties VALUES (36, 83.80, '-157.36', '-153.22', 2);
INSERT INTO public.properties VALUES (37, 85.47, '39.31', '688', 3);
INSERT INTO public.properties VALUES (38, 87.62, '777', '1382', 4);
INSERT INTO public.properties VALUES (39, 88.91, '1522', '3345', 7);
INSERT INTO public.properties VALUES (40, 91.22, '1855', '4409', 7);
INSERT INTO public.properties VALUES (41, 92.91, '2477', '4744', 7);
INSERT INTO public.properties VALUES (42, 95.95, '2623', '4639', 7);
INSERT INTO public.properties VALUES (43, 98.00, '2157', '4265', 7);
INSERT INTO public.properties VALUES (44, 101.07, '2334', '4150', 7);
INSERT INTO public.properties VALUES (45, 102.91, '1964', '3695', 7);
INSERT INTO public.properties VALUES (46, 106.42, '1554.9', '2963', 7);
INSERT INTO public.properties VALUES (47, 107.87, '961.78', '2162', 7);
INSERT INTO public.properties VALUES (48, 112.41, '321.07', '767', 7);
INSERT INTO public.properties VALUES (49, 114.82, '156.6', '2072', 8);
INSERT INTO public.properties VALUES (50, 118.71, '231.93', '2602', 8);
INSERT INTO public.properties VALUES (51, 121.76, '630.63', '1587', 5);
INSERT INTO public.properties VALUES (52, 127.60, '449.51', '988', 5);
INSERT INTO public.properties VALUES (53, 126.90, '113.7', '184.3', 6);
INSERT INTO public.properties VALUES (54, 131.29, '-111.75', '-108.12', 2);
INSERT INTO public.properties VALUES (55, 132.91, '28.44', '671', 3);
INSERT INTO public.properties VALUES (56, 137.33, '727', '1897', 4);
INSERT INTO public.properties VALUES (57, 138.91, '920', '3464', 9);
INSERT INTO public.properties VALUES (58, 140.12, '798', '3360', 9);
INSERT INTO public.properties VALUES (59, 140.91, '931', '3290', 9);
INSERT INTO public.properties VALUES (60, 144.24, '1021', '3100', 9);
INSERT INTO public.properties VALUES (61, 145.00, '1042', '3000', 9);
INSERT INTO public.properties VALUES (62, 150.36, '1074', '1794', 9);
INSERT INTO public.properties VALUES (63, 151.96, '822', '1527', 9);
INSERT INTO public.properties VALUES (64, 157.25, '1313', '3273', 9);
INSERT INTO public.properties VALUES (65, 158.93, '1356', '3230', 9);
INSERT INTO public.properties VALUES (66, 162.50, '1412', '2567', 9);
INSERT INTO public.properties VALUES (67, 164.93, '1474', '2700', 9);
INSERT INTO public.properties VALUES (68, 167.26, '1497', '2868', 9);
INSERT INTO public.properties VALUES (69, 168.93, '1545', '1950', 9);
INSERT INTO public.properties VALUES (70, 173.05, '819', '1196', 9);
INSERT INTO public.properties VALUES (71, 174.97, '1663', '3402', 9);
INSERT INTO public.properties VALUES (72, 178.49, '2233', '4603', 7);
INSERT INTO public.properties VALUES (73, 180.95, '3017', '5458', 7);
INSERT INTO public.properties VALUES (74, 183.84, '3422', '5555', 7);
INSERT INTO public.properties VALUES (75, 186.21, '3186', '5596', 7);
INSERT INTO public.properties VALUES (76, 190.23, '3033', '5012', 7);
INSERT INTO public.properties VALUES (77, 192.22, '2466', '4428', 7);
INSERT INTO public.properties VALUES (78, 195.08, '1768.3', '3825', 7);
INSERT INTO public.properties VALUES (79, 196.97, '1064.18', '2856', 7);
INSERT INTO public.properties VALUES (80, 200.59, '-38.83', '356.73', 7);
INSERT INTO public.properties VALUES (81, 204.38, '304', '1473', 8);
INSERT INTO public.properties VALUES (82, 207.2, '327.46', '1749', 8);
INSERT INTO public.properties VALUES (83, 208.98, '271.4', '1564', 8);
INSERT INTO public.properties VALUES (84, 209.00, '254', '962', 8);
INSERT INTO public.properties VALUES (85, 210.00, '302', '337', 6);
INSERT INTO public.properties VALUES (86, 222.00, '-71', '-61.7', 2);
INSERT INTO public.properties VALUES (87, 223.00, '27', '677', 3);
INSERT INTO public.properties VALUES (88, 226.00, '700', '1737', 4);
INSERT INTO public.properties VALUES (89, 227.00, '1050', '3200', 10);
INSERT INTO public.properties VALUES (90, 232.04, '1750', '4820', 10);
INSERT INTO public.properties VALUES (91, 231.04, '1568', '4000', 10);
INSERT INTO public.properties VALUES (92, 238.03, '1132.2', '4131', 10);
INSERT INTO public.properties VALUES (93, 237.00, '644', '3902', 10);
INSERT INTO public.properties VALUES (94, 244.00, '640', '3230', 10);
INSERT INTO public.properties VALUES (95, 243.00, '1176', '2011', 10);
INSERT INTO public.properties VALUES (96, 247.00, '1345', '3110', 10);
INSERT INTO public.properties VALUES (97, 247.00, '986', '2627', 10);
INSERT INTO public.properties VALUES (98, 251.00, '900', '1470', 10);
INSERT INTO public.properties VALUES (99, 252.00, '860', '996', 10);
INSERT INTO public.properties VALUES (100, 257.00, '1527', '2000', 10);
INSERT INTO public.properties VALUES (101, 258.00, '827', 'Unknown', 10);
INSERT INTO public.properties VALUES (102, 259.00, '827', 'Unknown', 10);
INSERT INTO public.properties VALUES (103, 262.00, '1627', 'Unknown', 10);
INSERT INTO public.properties VALUES (104, 267.00, '2100', '5500', 7);
INSERT INTO public.properties VALUES (105, 270.00, 'Unknown', 'Unknown', 7);
INSERT INTO public.properties VALUES (106, 269.00, 'Unknown', 'Unknown', 7);
INSERT INTO public.properties VALUES (107, 270.00, 'Unknown', 'Unknown', 7);
INSERT INTO public.properties VALUES (108, 269.00, 'Unknown', 'Unknown', 7);
INSERT INTO public.properties VALUES (109, 278.00, 'Unknown', 'Unknown', 7);
INSERT INTO public.properties VALUES (110, 281.00, 'Unknown', 'Unknown', 7);
INSERT INTO public.properties VALUES (111, 282.00, 'Unknown', 'Unknown', 7);
INSERT INTO public.properties VALUES (112, 285.00, 'Unknown', 'Unknown', 7);
INSERT INTO public.properties VALUES (113, 286.00, 'Unknown', 'Unknown', 8);
INSERT INTO public.properties VALUES (114, 289.00, 'Unknown', 'Unknown', 8);
INSERT INTO public.properties VALUES (115, 290.00, 'Unknown', 'Unknown', 8);
INSERT INTO public.properties VALUES (116, 293.00, 'Unknown', 'Unknown', 8);
INSERT INTO public.properties VALUES (117, 294.00, 'Unknown', 'Unknown', 6);
INSERT INTO public.properties VALUES (118, 294.00, 'Unknown', 'Unknown', 2);


--
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.types VALUES (1, 'Nonmetal');
INSERT INTO public.types VALUES (2, 'Noble Gas');
INSERT INTO public.types VALUES (3, 'Alkali Metal');
INSERT INTO public.types VALUES (4, 'Alkaline Earth Metal');
INSERT INTO public.types VALUES (5, 'Metalloid');
INSERT INTO public.types VALUES (6, 'Halogen');
INSERT INTO public.types VALUES (7, 'Transition Metal');
INSERT INTO public.types VALUES (8, 'Post-transition Metal');
INSERT INTO public.types VALUES (9, 'Lanthanide');
INSERT INTO public.types VALUES (10, 'Actinide');


--
-- Name: types_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_type_id_seq', 3, true);


--
-- Name: elements elements_atomic_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_atomic_number_key UNIQUE (atomic_number);


--
-- Name: elements elements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_pkey PRIMARY KEY (atomic_number);


--
-- Name: elements elements_symbol_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elements
    ADD CONSTRAINT elements_symbol_name_key UNIQUE (symbol, name);


--
-- Name: properties properties_atomic_number_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_atomic_number_key UNIQUE (atomic_number);


--
-- Name: properties properties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_pkey PRIMARY KEY (atomic_number);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (type_id);


--
-- Name: properties properties_atomic_number_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_atomic_number_fkey FOREIGN KEY (atomic_number) REFERENCES public.elements(atomic_number);


--
-- Name: properties properties_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.properties
    ADD CONSTRAINT properties_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(type_id);


--
-- PostgreSQL database dump complete
--

