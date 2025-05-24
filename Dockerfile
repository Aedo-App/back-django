# Imagen base oficial de Python
FROM python:3.11-slim

# Establece directorio de trabajo
WORKDIR /app

# Instala dependencias del sistema necesarias
RUN apt-get update && apt-get install -y \
    build-essential libpq-dev

# Copia los archivos de dependencias
COPY requirements.txt .

# Instala dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del proyecto
COPY . .

# Expone el puerto
EXPOSE 8000

# Comando para iniciar el servidor usando gunicorn
CMD ["gunicorn", "back_project.wsgi:application", "--bind", "0.0.0.0:8000"]
