import psycopg2


try:
    connection = psycopg2.connect(
        host="localhost",
        user="postgres",
        password="admin",
        database="ChatBot"
    )
    print("Conexión exitosa")
    cursor = connection.cursor()
    cursor.execute("SELECT VERSION()")
    row=cursor.fetchone()
    print(row)
    cursor.execute("SELECT * FROM autor")
    rows = cursor.fetchall()
    for row in rows:
        print(row)
except Exception as ex:
    print(ex)
