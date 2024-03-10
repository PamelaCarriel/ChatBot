from baseDatos import conexion_postgresql as S


class Chatbot:
    def __init__(self):
        self.name = ""
        self.email = ""

    def greet_user(self):
        print("¡Hola! Soy un chatbot. ¿Cómo te llamas?")

    def get_name(self):
        self.name = input("Por favor, introduce tu nombre: ")

    def get_email(self):
        self.email = input("Ahora, por favor, introduce tu dirección de correo electrónico: ")

    def display_info(self):
        print(f"¡Encantado de conocerte, {self.name}!")
        print(f"Tu dirección de correo electrónico es: {self.email}")

    def chat(self):
        self.greet_user()
        self.get_name()
        self.get_email()
        self.display_info()


# Función principal del chatbot
def buscar_libros():
    print("Bienvenido a la biblioteca XXXX")
    bot = Chatbot()
    bot.chat()

    while True:
        user_input = input("Como deseas buscar el libro, ingrese (1) por titulo o (2) por autor: ").strip().lower()
        print("*******-----",user_input)
        if user_input == 'salir':
            print("¡Hasta luego!")
            break

        elif user_input == '1':
            titulo = input('Ingresa el título del libro:')
            books = S.busca_libros_por_titulo(titulo)
            if books:
                print("Libros encontrados:")
                for book in books:
                    print(book)
            else:
                print("No se encontraron libros con ese título.")

        elif user_input == '2':
            autor = input('Ingresa el autor del libro: ')
            books = S.busca_libros_por_autor(autor)
            if books:
                print("Libros encontrados:")
                for book in books:
                    print(book)
            else:
                print("No se encontraron libros de ese autor.")

        elif 'añadir libro' in user_input:
            titulo = input("Ingrese el título del libro: ")
            autor = input("Ingrese el autor del libro: ")
            anio = input("Ingrese el año de publicación del libro: ")
            # insert_book(title, author, year)
            print("Libro añadido con éxito.")

        else:
            print("Lo siento, no entiendo esa solicitud.")


if __name__ == "__main__":
    buscar_libros()
