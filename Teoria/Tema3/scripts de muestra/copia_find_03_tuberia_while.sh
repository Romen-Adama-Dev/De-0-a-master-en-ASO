#!/bin/bash
#
# Busca todos los ficheros de menos de 2K de tamaño
# a partir del directorio actual
# y los copia en una carpeta 
#
# Versión con una tubería e inmune a cualquier carácter especial
# en las rutas.
# Utiliza la opción -print0 para terminar cada ruta con un NULL,
# en lugar de un salto de línea.
# Se usa read -d '' para que read utilice el NULL como final de
# la entrada de datos. 

DESTINO="/home/jomis/ficheros chicos"

# Crea la carpeta de destino en caso de no exista
# ¿Funcionaría si quitamos las comillas en $DESTINO?
[ -d "$DESTINO" ] || mkdir "$DESTINO"

# Conecta la salida de "find" con un bucle de lectura

find . -type f -size -2k -print0 | 
while read -d '' ruta
do
	# quitar el "echo" si queremos que realmente ejecte la copia
	echo cp "$ruta" "$DESTINO"
done

