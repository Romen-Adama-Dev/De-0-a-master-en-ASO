#!/bin/bash
#
# Busca todos los ficheros de menos de 2K de tamaño
# y los copia en una carpeta 

# Versión básica con find -exec

DESTINO=/home/jomis/backups

[ -d "$DESTINO" ] || mkdir "$DESTINO"
# Alternativamente, se puede resolver así:
# mkdir -p "$DESTINO"

find . -type f -size -2k -exec cp {} "$DESTINO" \;
