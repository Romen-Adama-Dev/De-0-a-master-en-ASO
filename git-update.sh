#!/bin/bash
# Obtener la fecha actual en formato DD-MM-AA
fecha=$(date +%d-%m-%y)

# Solicitar al usuario el tema o tarea del día
echo "¿Cuál es el tema o tarea realizada en el día de hoy?"
read topic

# Mensaje de commit
mensaje_commit="Actualización del repositorio el día $fecha sobre $topic"

# Añadir todos los cambios al staging area
git add .

# Commit de los cambios
git commit -m "$mensaje_commit"

# Empujar los cambios al repositorio remoto
git pull origin main
git push origin main