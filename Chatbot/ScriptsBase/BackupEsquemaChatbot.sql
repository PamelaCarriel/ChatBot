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
-- Name: actualizar_fecha_devolucion(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.actualizar_fecha_devolucion() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    UPDATE reserva
    SET fecha_devolucion = NEW.fecha_prestamo + INTERVAL '30 days',
	    estado_disponible = 'N'
    WHERE Id_Lecto = NEW.Id_Lecto AND Id_Libros = NEW.Id_Libros;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.actualizar_fecha_devolucion() OWNER TO postgres;

--
-- Name: evitar_prestamos_duplicados(); Type: FUNCTION; Schema: public; Owner: postgres
--

CREATE FUNCTION public.evitar_prestamos_duplicados() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
BEGIN
    IF EXISTS (
        SELECT 1
        FROM reserva
        WHERE Id_Lecto = NEW.Id_Lecto AND Id_Libros = NEW.Id_Libros
    ) THEN
        RAISE EXCEPTION 'Este libro ya ha sido prestado a este lector.';
    END IF;

    RETURN NEW;
END;
$$;


ALTER FUNCTION public.evitar_prestamos_duplicados() OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: autor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.autor (
    id_autor integer NOT NULL,
    titulo_autor character varying(255),
    nombre_autor character varying(255)
);


ALTER TABLE public.autor OWNER TO postgres;

--
-- Name: lector; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lector (
    id_lecto integer NOT NULL,
    nombre_lec character varying(255) NOT NULL
);


ALTER TABLE public.lector OWNER TO postgres;

--
-- Name: lector_id_lecto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.lector_id_lecto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lector_id_lecto_seq OWNER TO postgres;

--
-- Name: lector_id_lecto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.lector_id_lecto_seq OWNED BY public.lector.id_lecto;


--
-- Name: libros; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.libros (
    id_libros integer NOT NULL,
    id_localizacion integer,
    id_autor integer,
    idioma_libr character varying(50),
    titulo_libr character varying(255),
    genero_literario_libr character varying(100),
    editorial_libr character varying(100),
    anio_publicacion_libr integer
);


ALTER TABLE public.libros OWNER TO postgres;

--
-- Name: localizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.localizacion (
    id_localizacion integer NOT NULL,
    titulo_loc character varying(255),
    ubicacion_loc character varying(255),
    formato_loc character varying(255)
);


ALTER TABLE public.localizacion OWNER TO postgres;

--
-- Name: preguntas_respuestas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.preguntas_respuestas (
    id_preg_resp integer NOT NULL,
    pregunta character varying(255),
    respuesta character varying(255)
);


ALTER TABLE public.preguntas_respuestas OWNER TO postgres;

--
-- Name: reserva; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reserva (
    id_lecto integer,
    id_libros integer,
    fecha_devolucion date,
    fecha_prestamo date,
    estado_disponible character varying(1)
);


ALTER TABLE public.reserva OWNER TO postgres;

--
-- Name: vw_libros_autores; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_libros_autores AS
 SELECT l.id_libros,
    l.titulo_libr,
    l.genero_literario_libr,
    l.editorial_libr,
    l.anio_publicacion_libr,
    a.nombre_autor,
    a.titulo_autor
   FROM (public.libros l
     JOIN public.autor a ON ((l.id_autor = a.id_autor)));


ALTER TABLE public.vw_libros_autores OWNER TO postgres;

--
-- Name: vw_libros_localizacion; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_libros_localizacion AS
 SELECT l.id_libros,
    l.titulo_libr,
    ll.ubicacion_loc,
    ll.formato_loc
   FROM (public.libros l
     JOIN public.localizacion ll ON ((l.id_localizacion = ll.id_localizacion)));


ALTER TABLE public.vw_libros_localizacion OWNER TO postgres;

--
-- Name: vw_prestamos_por_libro; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vw_prestamos_por_libro AS
 SELECT p.id_libros,
    count(*) AS num_prestamos
   FROM public.reserva p
  GROUP BY p.id_libros;


ALTER TABLE public.vw_prestamos_por_libro OWNER TO postgres;

--
-- Name: lector id_lecto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lector ALTER COLUMN id_lecto SET DEFAULT nextval('public.lector_id_lecto_seq'::regclass);


--
-- Name: autor autor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.autor
    ADD CONSTRAINT autor_pkey PRIMARY KEY (id_autor);


--
-- Name: lector lector_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lector
    ADD CONSTRAINT lector_pkey PRIMARY KEY (id_lecto);


--
-- Name: libros libros_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.libros
    ADD CONSTRAINT libros_pkey PRIMARY KEY (id_libros);


--
-- Name: localizacion localizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.localizacion
    ADD CONSTRAINT localizacion_pkey PRIMARY KEY (id_localizacion);


--
-- Name: preguntas_respuestas preguntas_respuestas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.preguntas_respuestas
    ADD CONSTRAINT preguntas_respuestas_pkey PRIMARY KEY (id_preg_resp);


--
-- Name: reserva actualizar_fecha_devolucion_trigger; Type: TRIGGER; Schema: public; Owner: postgres
--

CREATE TRIGGER actualizar_fecha_devolucion_trigger AFTER INSERT ON public.reserva FOR EACH ROW EXECUTE FUNCTION public.actualizar_fecha_devolucion();


--
-- Name: reserva presta_id_lecto_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT presta_id_lecto_fkey FOREIGN KEY (id_lecto) REFERENCES public.lector(id_lecto);


--
-- Name: reserva presta_id_libros_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reserva
    ADD CONSTRAINT presta_id_libros_fkey FOREIGN KEY (id_libros) REFERENCES public.libros(id_libros);


--
-- Name: TABLE autor; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.autor TO bibliotecario;


--
-- Name: TABLE lector; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.lector TO lector;


--
-- Name: SEQUENCE lector_id_lecto_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.lector_id_lecto_seq TO bibliotecario;
GRANT SELECT,USAGE ON SEQUENCE public.lector_id_lecto_seq TO lector;


--
-- Name: TABLE libros; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.libros TO bibliotecario;


--
-- Name: TABLE localizacion; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE public.localizacion TO bibliotecario;


--
-- Name: TABLE reserva; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.reserva TO lector;


--
-- Name: TABLE vw_libros_autores; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.vw_libros_autores TO bibliotecario;
GRANT SELECT ON TABLE public.vw_libros_autores TO lector;


--
-- Name: TABLE vw_libros_localizacion; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.vw_libros_localizacion TO bibliotecario;
GRANT SELECT ON TABLE public.vw_libros_localizacion TO lector;


--
-- Name: TABLE vw_prestamos_por_libro; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT ON TABLE public.vw_prestamos_por_libro TO bibliotecario;
GRANT SELECT ON TABLE public.vw_prestamos_por_libro TO lector;


--
-- PostgreSQL database dump complete
--

