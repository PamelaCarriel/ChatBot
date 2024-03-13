@echo off

REM Instalar las dependencias necesarias
pip install nltk psycopg2

REM Cambiar al directorio donde se encuentra tu script
cd C:\Users\carri\PycharmProjects\ChatBot\ChatBot\Chatbot\src

REM Ejecutar el script Python
python main.py

pause
