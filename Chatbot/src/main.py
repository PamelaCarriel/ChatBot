import re
from difflib import SequenceMatcher
from nltk import word_tokenize
from nltk.corpus import stopwords
from baseDatos import conexion_postgresql as S
import nltk

# Descargar recursos de NLTK si no están disponibles
#nltk.download()
#nltk.download('punkt')
#nltk.download('stopwords')


# Función para reservar un libro
def reservar_libro(id_libros, usuario):
    disponible = S.valida_disponibilidad_libro(id_libros)
    id_lector = S.busca_lector(usuario)
    if id_lector == None:
        id_lector = S.insertar_lector(usuario)

    if disponible:
        S.insertar_reserva(id_lector, id_libros)
        return True
    else:
        return False


# Función para procesar la entrada del usuario
def procesar_entrada(entrada):
    stop_words = set(stopwords.words('spanish'))
    tokens = word_tokenize(entrada.lower())
    tokens = [w for w in tokens if not w in stop_words]
    return tokens


# Función para calcular la similitud entre dos cadenas
def similar(a, b):
    return SequenceMatcher(None, a, b).ratio()


# Función principal del chatbot
def chatbot():
    print("\n¡Hola! Soy BiblioGenio. ¿En qué puedo ayudarte?")
    while True:
        usuario_input = input("\n> ").strip()
        if usuario_input.lower() == 'salir':
            print("¡Hasta luego!")
            break
        else:
            tokens = procesar_entrada(usuario_input)
            if ('buscar' in tokens or 'busca' in tokens or 'encuentra' in tokens or 'encontrar' in tokens) and ('libro' in tokens or 'autor' in tokens):
                indice_busqueda = tokens.index('libro') + 1 if 'libro' in tokens else tokens.index('autor') + 1
                termino_busqueda = ' '.join(tokens[indice_busqueda:])
                resultados = S.buscar_libros(termino_busqueda)
                if resultados:
                    print("----**** He encontrado los siguientes libros:")
                    for libro in resultados:
                        print(
                            f"*** ID: {libro[0]}, Título: {libro[1]}, Autor: {libro[5]}, Género: {libro[2]} ***")
                    opcion_reserva = input("\n¿Quieres reservar alguno de estos libros? (si/no): ").strip().lower()
                    if opcion_reserva == 'si':
                        libro_id = input("Ingrese el ID del libro que desea reservar: ").strip()
                        usuario = input("Ingrese su nombre para la reserva: ").strip()
                        if reservar_libro(libro_id, usuario):
                            print("¡Libro reservado con éxito!")
                        else:
                            print("Lo siento, ese libro ya está reservado.")
                else:
                    print("Lo siento, no se encontraron resultados para ese título.")
            else:
                # Buscar si hay una respuesta en la base de datos
                pregunta = usuario_input
                respuesta_db = S.buscar_respuesta(pregunta)
                if respuesta_db:
                    print(respuesta_db[0])
                else:
                    print("\nLo siento, no entendí tu solicitud. ¿Puedes intentar de nuevo?")
                    # Aprender de la interacción
                    respuesta_nueva = input("¿Cuál sería la respuesta adecuada a esta pregunta? ").strip()
                    if respuesta_nueva:
                        S.insertar_preg_resp(pregunta, respuesta_nueva)


if __name__ == "__main__":
    # Iniciar el chatbot
    chatbot()
