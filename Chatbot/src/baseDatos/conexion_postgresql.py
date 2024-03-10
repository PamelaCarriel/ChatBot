import psycopg2


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


# Función para insertar un libro en la base de datos
def insert_book(title, author, year):
    mensaje = connect_db()
    # cursor.execute("INSERT INTO books (title, author, year) VALUES (?, ?, ?)", (title, author, year))
    conn.commit()
    conn.close()


# Función para buscar libros por título
def busca_libros_por_autor(autor):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute(
            """select a.nombre_autor,b.titulo_libr from autor a inner join libros b on 
            a.id_autor = b.id_autor where LOWER(a.nombre_autor) LIKE ('%""" + autor + """%')""")
        books = cursor.fetchall()
        conn.close()
    else:
        books = None
    return books


def busca_libros_por_titulo(titulo):
    mensaje = connect_db()
    if mensaje == "Conexión exitosa":
        cursor.execute(
            """select a.nombre_autor,b.titulo_libr from autor a inner join libros b on a.id_autor = b.id_autor where 
            LOWER(b.titulo_libr) LIKE '%""" + titulo + """%'""")
        books = cursor.fetchall()
        conn.close()
    else:
        books = None
    return books
