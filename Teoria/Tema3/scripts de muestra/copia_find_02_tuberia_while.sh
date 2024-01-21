#!/bin/bash
#
# Busca todos los ficheros de menos de 2K de tamaño
# a partir del directorio actual
# y los copia en una carpeta 
#
# Versión con una tubería

DESTINO="/home/jomis/ficheros chicos"

# Crea la carpeta de destino en caso de no exista
# ¿Funcionaría si quitamos las comillas en $DESTINO?
[ -d "$DESTINO" ] || mkdir "$DESTINO"

# Conecta la salida de "find" con un bucle de lectura

find . -type f -size -2k | 
while read ruta
do
	# quitar el "echo" si queremos que realmente ejecte la copia
	echo cp "$ruta" "$DESTINO"
done

# OJO: el script falla si algún nombre de fichero contiene
# saltos de línea (improbable, pero posible)
