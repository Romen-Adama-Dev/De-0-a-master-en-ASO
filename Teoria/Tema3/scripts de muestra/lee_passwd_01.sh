#!/bin/bash

# Ejemplo de lectura desde un fichero con campos

PASSWD_FILE=/etc/passwd

# Definimos el separador de campos
IFS=:

# con esto redirigimos el fichero número 3
# la entrada estándar ni en la salida estándar no resultan afectadas
exec 3<$PASSWD_FILE

# con read -u3 leemos desde el fichero número 3
while read -u3 nombre clave uid gid resto 
do 
  # para imprimir sólo las cuentas con UID mayor o igual que 500
  [[ $uid -lt 500 ]] && continue

  echo "$nombre (UID=$uid, GID=$gid)"
done 