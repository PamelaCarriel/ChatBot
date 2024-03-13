--
-- PostgreSQL database dump
--

-- Dumped from database version 15.6
-- Dumped by pg_dump version 15.6

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
-- Data for Name: autor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.autor (id_autor, titulo_autor, nombre_autor) FROM stdin;
1	Cien Años de Soledad	Gabriel García Márquez
2	El Principito	Antoine de Saint-Exupéry
3	1984	George Orwell
4	Don Quijote de la Mancha	Miguel de Cervantes
5	Orgullo y Prejuicio	Jane Austen
6	Harry Potter y la Piedra Filosofal	J.K. Rowling
7	Crimen y Castigo	Fyodor Dostoevsky
8	El gran Gatsby	F. Scott Fitzgerald
9	Las aventuras de Tom Sawyer	Mark Twain
10	El señor de los anillos	J.R.R. Tolkien
11	Fahrenheit 451	Ray Bradbury
12	Matar un ruiseñor	Harper Lee
13	El nombre del viento	Patrick Rothfuss
14	Las uvas de la ira	John Steinbeck
15	La sombra del viento	Carlos Ruiz Zafón
16	Rebelión en la granja	George Orwell
17	Los miserables	Victor Hugo
18	El retrato de Dorian Gray	Oscar Wilde
19	La ladrona de libros	Markus Zusak
20	Los renglones torcidos de Dios	Torcuato Luca de Tena
21	El código Da Vinci	Dan Brown
22	El amor en los tiempos del cólera	Gabriel García Márquez
23	Drácula	Bram Stoker
24	Frankenstein	Mary Shelley
25	El guardián entre el centeno	J.D. Salinger
26	El alquimista	Paulo Coelho
27	Moby Dick	Herman Melville
28	La naranja mecánica	Anthony Burgess
29	El perfume	Patrick Süskind
30	La historia interminable	Michael Ende
31	El lobo estepario	Hermann Hesse
32	La casa de los espíritus	Isabel Allende
33	El señor de las moscas	William Golding
34	Rayuela	Julio Cortázar
35	Los hombres que no amaban a las mujeres	Stieg Larsson
36	El médico	Noah Gordon
37	La isla del tesoro	Robert Louis Stevenson
38	El jardín secreto	Frances Hodgson Burnett
39	El príncipe de la niebla	Carlos Ruiz Zafón
40	El silencio de la ciudad blanca	Eva García Sáenz de Urturi
41	El club de la pelea	Chuck Palahniuk
42	La hoguera de las vanidades	Tom Wolfe
43	El nombre de la rosa	Umberto Eco
44	El guardián invisible	Dolores Redondo
45	El retrato de Rose Madder	Stephen King
46	Cumbres borrascosas	Emily Brontë
47	Los ojos amarillos de los cocodrilos	Katherine Pancol
48	Los cuatro acuerdos	Miguel Ruiz
49	La milla verde	Stephen King
50	Lo que el viento se llevó	Margaret Mitchell
\.


--
-- Data for Name: lector; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lector (id_lecto, nombre_lec) FROM stdin;
1	MERCEDES
2	BYRON
3	GONZALO
4	FERNANDA
5	CARLOS
6	JOHANNA
7	FANNY
8	MICAELA
9	JUAN
10	RENATA
11	ANA
12	ROBERTO
13	MARIA
14	JUAN
15	KARLA
16	ELIZZABETH
17	ANA
18	FERNANDA
19	HILDA
20	JOHANNA
21	FERNANDA
22	JOHANNA
23	JAIME S
24	PABLO
25	HILDA
26	JAIME S
27	CAMILA
28	JAIME S
29	BRYAN
30	ELIZZABETH
31	JAIME S
32	MARIO
33	FANNY
34	FANNY
35	JOHANNA
36	Norma
37	Prueba
38	Pame
\.


--
-- Data for Name: libros; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.libros (id_libros, id_localizacion, id_autor, idioma_libr, titulo_libr, genero_literario_libr, editorial_libr, anio_publicacion_libr) FROM stdin;
107	3	1	Español	Cien Años de Soledad	Realismo mágico	Sudamericana	1967
108	11	2	Español	El Principito	Fábula	Salamandra	1943
109	7	3	Español	1984	Distopía	Debolsillo	1949
110	1	4	Español	Don Quijote de la Mancha	Novela picaresca	Espasa-Calpe	1605
111	15	5	Inglés	Orgullo y Prejuicio	Romance	Penguin Clásicos	1813
112	9	6	Español	Harry Potter y la Piedra Filosofal	Fantasía	Salamandra	1997
113	5	7	Español	Crimen y Castigo	Novela psicológica	Alianza Editorial	1866
114	8	8	Español	El gran Gatsby	Novela moderna	Debolsillo	1925
115	12	9	Español	Las aventuras de Tom Sawyer	Aventura	Anaya Infantil	1876
116	4	10	Español	El señor de los anillos	Fantasía épica	Minotauro	1954
117	10	11	Español	Fahrenheit 451	Distopía	Debolsillo	1953
118	6	12	Inglés	Matar un ruiseñor	Drama	Vintage Books	1960
119	25	13	Español	El nombre del viento	Fantasía épica	Plaza & Janés	2007
120	13	14	Español	Las uvas de la ira	Novela histórica	Penguin Clásicos	1939
121	29	15	Español	La sombra del viento	Misterio	Planeta	2001
122	45	16	Español	Rebelión en la granja	Alegoría	Debolsillo	1945
123	21	17	Español	Los miserables	Novela clásica	Alianza Editorial	1862
124	42	18	Español	El retrato de Dorian Gray	Novela de terror	Penguin Clásicos	1890
125	37	19	Español	La ladrona de libros	Drama histórico	Debolsillo	2005
126	38	20	Español	Los renglones torcidos de Dios	Psicológica	Planeta	1979
127	39	21	Español	El código Da Vinci	Misterio	Umbriel	2003
128	40	22	Español	El amor en los tiempo del cólera	Romance	Sudamericana	1985
129	41	23	Español	Drácula	Terror	Debolsillo	1897
130	43	24	Inglés	Frankestein	Terror gótico	Penguin Clásicos	1818
131	44	25	Español	El guardian entre el centeno	Novela	Alianza Editorial	1951
132	46	26	Español	El alquimista	Fábula	Rayo	1988
133	47	27	Inglés	Moby Dick	Novela aventura	Penguin Clásicos	1851
134	48	28	Español	La naranja mecánica	Ciencia ficción	Minotauro	1962
135	49	29	Español	El perfume	Novela	Seix Barral	1985
136	50	30	Español	La historia interminable	Fantasía	Alfaguara	1979
137	14	31	Español	El lobo estepario	Novela filosófica	Debolsillo	1927
138	15	32	Español	La casa de los espíritus	Realismo mágico	Plaza & Janés	1982
139	16	33	Español	El señor de las moscas	Alegoría	Debolsillo	1954
140	17	34	Español	Rayuela	Ficción	Alfaguara	1963
141	18	35	Español	Los hombres que no amaban a las mujeres	Misterio	Destino	2005
142	19	36	Español	El médico	Histórica	Roca Editorial	1986
143	55	37	Español	La isla del tesoro	Aventura	Alba	1883
144	20	38	Inglés	El jardín secreto	Infantil	Penguin Clásicos	1911
145	60	39	Español	El príncipe de la niebla	Fantasía	Planeta	1993
146	36	40	Español	El silencio de la ciudad blanca	Thriller	Booket	2016
147	55	41	Español	El club de la pelea	Psicológica	Debolsillo	1996
148	80	42	Español	La hoguera de las vanidades	Novela satírica	RBA Libros	1987
149	85	43	Español	El nombre de la rosa	Misterio histórico	Lumen	1980
150	70	44	Español	El guardian invisible	Thriller	Destino	2013
151	75	45	Español	El retrato de Rose Madder	Terror	Plaza & Janés	1995
152	5	46	Inglés	Cumbres borrascosas	Novela romántica	Penguin Clásicos	1847
153	80	47	Español	Los ojos amarillos de los cocodrilos	Drama	Debolsillo	2006
154	55	48	Español	Los cuatro acuerdos	Autoayuda	Urano	1997
155	85	49	Español	La milla verde	Drama	Debolsillo	1996
156	5	50	Español	Lo que el viento se llevó	Novela histórica	Zeta Bolsillo	1936
\.


--
-- Data for Name: localizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.localizacion (id_localizacion, titulo_loc, ubicacion_loc, formato_loc) FROM stdin;
51	Cien Años de Soledad	Plataforma Universitaria	Digital
52	El Principito	Estante 10	En físico
53	1984	Plataforma Universitaria	Digital
54	Don Quijote de la Mancha	Sala de lectura	En físico
55	Orgullo y Prejuicio	Plataforma Universitaria	Digital
56	Harry Potter y la Piedra Filosofal	Plataforma Universitaria	Digital
57	Crimen y Castigo	Estante 12	En físico
58	El gran Gatsby	Sala de lectura	En físico
59	Las aventuras de Tom Sawyer	Plataforma Universitaria	Digital
60	El señor de los anillos	Sala de lectura	En físico
61	Fahrenheit 451	Plataforma Universitaria	Digital
62	Matar un ruiseñor	Sala de lectura	En físico
63	El nombre del viento	Estante 25	En físico
64	El nombre de la rosa	Plataforma Universitaria	Digital
65	El guardian invisible	Sala de lectura	En físico
66	El retrato de Rose Madder	Plataforma Universitaria	Digital
67	El código Da Vinci	Plataforma Universitaria	Digital
68	La hoguera de las vanidades	Sala de lectura	En físico
69	La isla del tesoro	Estante 55	En físico
70	El jardín secreto	Plataforma Universitaria	Digital
71	El príncipe de la niebla	Estante 60	En físico
72	El silencio de la ciudad blanca	Sala de lectura	En físico
73	El club de la pelea	Plataforma Universitaria	Digital
74	El nombre de la rosa	Plataforma Universitaria	Digital
75	El guardian invisible	Sala de lectura	En físico
76	Cumbres borrascosas	Sala de lectura	En físico
77	Los ojos amarillos de los cocodrilos	Estante 80	En físico
78	Los cuatro acuerdos	Plataforma Universitaria	Digital
79	La milla verde	Estante 85	En físico
80	Lo que el viento se llevó	Plataforma Universitaria	Digital
81	Las uvas de la ira	Plataforma Universitaria	Digital
82	La sombra del viento	Plataforma Universitaria	Digital
83	Rebelión en la granja	Sala de lectura	En físico
84	Los miserables	Plataforma Universitaria	Digital
85	El retrato de Dorian Gray	Plataforma Universitaria	Digital
86	La ladrona de libros	Plataforma Universitaria	Digital
87	Los renglones torcidos de Dios	Plataforma Universitaria	Digital
88	El amor en los tiempo del cólera	Sala de lectura	En físico
89	Drácula	Estante 14	En físico
90	Frankestein	Plataforma Universitaria	Digital
91	El guardian entre el centeno	Estante 21	En físico
92	El alquimista	Sala de lectura	En físico
93	Moby Dick	Plataforma Universitaria	Digital
94	La historia interminable	Plataforma Universitaria	Digital
95	El lobo estepario	Plataforma Universitaria	Digital
96	La casa de los espíritus	Sala de lectura	En físico
97	El señor de las moscas	Estante 45	En físico
98	Rayuela	Plataforma Universitaria	Digital
99	Los hombres que no amaban a las mujeres	Plataforma Universitaria	Digital
100	El médico	Sala de lectura	En físico
\.


--
-- Data for Name: preguntas_respuestas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.preguntas_respuestas (id_preg_resp, pregunta, respuesta) FROM stdin;
1	¿Puedo renovar un libro prestado?	Sí, puedes renovar libros prestados hasta dos veces si no hay una lista de espera para el libro en cuestión.
2	¿Ofrecen servicios de digitalización de documentos?	Sí, ofrecemos servicios de digitalización de documentos. Simplemente trae el documento que deseas digitalizar y nuestro personal estará encantado de ayudarte.
3	exit	salir
\.


--
-- Data for Name: reserva; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reserva (id_lecto, id_libros, fecha_devolucion, fecha_prestamo, estado_disponible) FROM stdin;
1	154	2023-02-03	2023-01-03	D
2	153	2023-03-14	2023-02-14	D
3	152	2023-04-22	2023-03-22	D
4	156	2023-05-05	2023-04-05	D
5	148	2023-06-18	2023-05-18	D
6	149	2023-07-27	2023-06-27	D
7	107	2023-08-09	2023-07-09	D
8	108	2023-09-30	2023-08-30	D
9	109	2023-10-11	2023-09-11	D
10	110	2023-11-25	2023-10-25	D
11	111	2023-12-07	2023-11-07	D
12	112	2024-01-19	2023-12-19	D
13	113	2024-02-01	2024-01-01	D
14	114	2024-03-10	2024-02-02	D
15	115	2024-04-28	2024-03-10	D
16	116	2024-06-01	2024-04-28	D
17	117	2024-07-15	2024-05-31	D
18	118	2024-08-26	2024-06-15	D
19	119	2024-09-06	2024-07-26	D
20	120	2024-10-22	2024-08-06	D
21	121	2024-11-09	2024-09-22	D
22	122	2024-12-14	2024-10-09	D
23	123	2025-01-24	2024-11-14	D
24	124	2025-02-17	2024-12-24	D
25	125	2025-03-08	2025-01-17	D
26	126	2025-04-01	2025-02-20	D
27	127	2025-05-12	2025-03-08	D
28	128	2025-06-29	2025-04-01	D
29	129	2025-08-04	2025-05-12	D
30	130	2025-09-14	2025-06-29	D
31	131	2025-10-27	2025-07-04	D
32	132	2025-11-19	2025-08-14	D
33	133	2025-12-03	2025-09-27	D
34	134	2026-01-15	2025-10-19	D
35	135	2026-02-28	2025-11-03	D
36	108	2024-04-11	2024-03-12	N
37	107	2024-04-11	2024-03-12	N
38	128	2024-04-11	2024-03-12	N
\.


--
-- Name: lector_id_lecto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.lector_id_lecto_seq', 35, true);


--
-- PostgreSQL database dump complete
--

