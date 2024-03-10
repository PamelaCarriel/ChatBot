import psycopg2
import datetime


# Función para conectar a la base de datos
def connect_db():
    global conn, cursor
    try:
        conn = psycopg2.connect(
            host="localhost",
            user="postgres",
            password="admin",
            database="ChatBot"
        )
        mensaje = "Conexión exitosa"
        cursor = conn.cursor()
    except Exception as ex:
        mensaje = ex

    return mensaje


# Función para insertar un pregunta y respuesta en la base de datos
def insertar_preg_resp(pregunta, respuesta):
    mensaje = connect_db()
    cursor.execute("INSERT INTO preguntas_respuestas (pregunta, respuesta) VALUES (?, ?)", (pregunta, respuesta))
    conn.commit()
    conn.close()


# Función para insertar reservas en la base de datos
def insertar_reserva(id_lecto, id_libros):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute("INSERT INTO reserva(id_lecto, id_libros, fecha_prestamo) VALUES (?, ?, ?);",
                       (id_lecto, id_libros, datetime.date.today()))
        conn.commit()
        conn.close()


# Función para buscar respuesta en la base de datos
def buscar_respuesta(pregunta):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute("SELECT respuesta FROM preguntas_respuestas WHERE pregunta = ?", (pregunta))
        preg_resp = cursor.fetchall()
        conn.close()
    else:
        preg_resp = None
    return preg_resp


# Función para buscar libros por título
def busca_lector(usuario):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute(
            """select id_lecto
            from lector a 
            where LOWER(a.nombre_lec) LIKE ('%""" + usuario.lower() + """%')""")
        id_lecto = cursor.fetchall()[0]
        conn.close()
    else:
        id_lecto = None
    return id_lecto


def buscar_libros(termino_busqueda):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute("SELECT * FROM vw_libros_autores_localizacion WHERE LOWER(titulo) LIKE ? OR LOWER(autor) LIKE ?",
                  ('%' + termino_busqueda.lower() + '%', '%' + termino_busqueda.lower() + '%'))
        books = cursor.fetchall()
        conn.close()
    else:
        books = None
    return books


def valida_disponibilidad_libro(id_libros):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute("SELECT libro_disponible(?);", id_libros)
        disponible = cursor.fetchone()[0]
        conn.close()
    else:
        disponible = False
    return disponible
