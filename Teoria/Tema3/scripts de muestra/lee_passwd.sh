#!/bin/bash

# Ejemplo de lectura desde un fichero con campos

PASSWD_FILE=/etc/passwd

# Definimos el separador de campos
IFS=:

while read nombre clave uid gid resto 
do 
  # para imprimir sólo las cuentas con UID mayor o igual que 500
  [[ $uid -lt 500 ]] && continue

  echo "$nombre (UID=$uid, GID=$gid)"
done < $PASSWD_FILE 

# Tabmbién podría servir
# cat $PASSWD_FILE | while ...

