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
    id_preg_resp = maximo_preg_resp()
    mensaje = connect_db()
    cursor.execute("INSERT INTO preguntas_respuestas (id, pregunta, respuesta) VALUES (%s, %s, %s)", (id_preg_resp, pregunta, respuesta))
    conn.commit()
    conn.close()

def maximo_preg_resp():
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute("select max(id) from preguntas_respuestas")
        # Obtener todos los resultados
        resultados = cursor.fetchall()

        # Verificar si no hay resultados
        if not resultados:
            id_preg_resp = 1
        else:
            id_preg_resp = resultados[0][0] + 1

        conn.close()
    else:
        id_preg_resp = None
    return id_preg_resp

def maximo_lector():
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute("select max(id_lecto) from lector")
        # Obtener todos los resultados
        resultados = cursor.fetchall()

        # Verificar si no hay resultados
        if not resultados:
            id_lecto = 1
        else:
            id_lecto = resultados[0][0] + 1

        conn.close()
    else:
        id_lecto = None
    return id_lecto


def insertar_lector(usuario):
    id_lector = maximo_lector()
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute("INSERT INTO lector(id_lecto, nombre_lec) VALUES (%s, %s)", (id_lector, usuario))
        conn.commit()
        conn.close()
    else:
        id_lector = None
    return id_lector


# Función para insertar reservas en la base de datos
def insertar_reserva(id_lecto, id_libros):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute("INSERT INTO reserva(id_lecto, id_libros, fecha_prestamo) VALUES (%s, %s, %s)",
                       (id_lecto, id_libros, datetime.date.today()))
        conn.commit()
        conn.close()


# Función para buscar respuesta en la base de datos
def buscar_respuesta(pregunta):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute("""SELECT respuesta FROM preguntas_respuestas WHERE pregunta = '""" + pregunta + """'""")
        resultados = cursor.fetchall()

        # Verificar si no hay resultados
        if not resultados:
            respuesta = None
        else:
            respuesta = resultados[0]

        conn.close()
    else:
        respuesta = None
    return respuesta


# Función para buscar libros por título
def busca_lector(usuario):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute(
            """select id_lecto
            from lector a 
            where LOWER(a.nombre_lec) LIKE ('%""" + usuario.lower() + """%')""")

        # Obtener todos los resultados
        resultados = cursor.fetchall()

        # Verificar si no hay resultados
        if not resultados:
            id_lecto = None
        else:
            id_lecto = resultados[0][0]

        conn.close()
    else:
        id_lecto = None
    return id_lecto


def buscar_libros(termino_busqueda):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute(
            "SELECT * FROM vw_libros_autores_localizacion WHERE LOWER(titulo_libr) LIKE %s OR LOWER(nombre_autor) LIKE %s",
            ('%' + termino_busqueda.lower() + '%', '%' + termino_busqueda.lower() + '%'))
        books = cursor.fetchall()
        conn.close()
    else:
        books = None
    return books


def valida_disponibilidad_libro(id_libros):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute("SELECT COUNT(1) FROM reserva WHERE id_libros = " + id_libros + " AND estado_disponible = 'N'")
        num_reg = cursor.fetchone()[0]
        if num_reg == 0:
            disponible = True
        else:
            disponible = False

        conn.close()
    else:
        disponible = False
    return disponible
