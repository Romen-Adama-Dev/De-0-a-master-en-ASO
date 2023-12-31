#!/bin/bash

# Cambia al directorio de tu repositorio local
cd /home/romen_dev/Documentos/ASO

# Obtener la fecha actual en formato DD-MM-AA
fecha=$(date +%d-%m-%y)

# Solicitar al usuario el tema o tarea del día
echo "¿Cuál es el tema o tarea realizada en el día de hoy?"
read topic

# Mensaje de commit
mensaje_commit="Actualización del repositorio el día $fecha sobre $topic"

# Añadir todos los cambios al staging area y hacer commit
git add .
git commit -m "$mensaje_commit"

# Empujar los cambios al repositorio remoto
git push origin main
