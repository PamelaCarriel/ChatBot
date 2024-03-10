from Chatbot.src.baseDatos import conexion_postgressql as S

# Función principal del chatbot
def main():
    print("Bienvenido a la biblioteca. ¿En qué puedo ayudarte?")
    while True:
        user_input = input("Usuario: ").strip().lower()

        if user_input == 'salir':
            print("¡Hasta luego!")
            break

        elif 'buscar por título' in user_input:
            titulo = user_input.split('buscar por título')[1].strip()
            books = S.busca_libros_por_titulo(titulo)
            if books:
                print("Libros encontrados:")
                for book in books:
                    print(book)
            else:
                print("No se encontraron libros con ese título.")

        elif 'buscar por autor' in user_input:
            autor = user_input.split('buscar por autor')[1].strip()
            books = S.busca_libros_por_autor(autor)
            if books:
                print("Libros encontrados:")
                for book in books:
                    print(book)
            else:
                print("No se encontraron libros de ese autor.")

        elif 'añadir libro' in user_input:
            title = input("Ingrese el título del libro: ")
            author = input("Ingrese el autor del libro: ")
            year = input("Ingrese el año de publicación del libro: ")
            insert_book(title, author, year)
            print("Libro añadido con éxito.")

        else:
            print("Lo siento, no entiendo esa solicitud.")

if __name__ == "__main__":
    main()