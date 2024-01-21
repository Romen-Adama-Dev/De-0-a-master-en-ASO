#!/bin/bash
#
# Busca todos los ficheros de menos de 2K de tamaño
# a partir del directorio actual
# y los copia en una carpeta 
#
# Versión con la orden "find" empotrada dentro de un "for"

DESTINO="/home/jomis/ficheros chicos"

# Crea la carpeta de destino en caso de no exista
# ¿Funcionaría si quitamos las comillas en $DESTINO?
[ -d "$DESTINO" ] || mkdir "$DESTINO"

# empotramos una orden "find" dentro de un bucle "for"
# OJO: el script no funciona si alguna de las rutas
# contiene espacios
# ¿por qué?

for ruta in $(find . -type f -size -2k)
do
  # copia las rutas encontradas
  # NOTA: quitar el "echo" si queremos que se ejecute la copia
  # ¿Qué pasaría si quitáramos las comillas?
  echo cp "$ruta" "$DESTINO"
done

