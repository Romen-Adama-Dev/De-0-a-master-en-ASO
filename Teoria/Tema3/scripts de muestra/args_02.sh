#!/bin/bash

# Ejemplo de uso de argumentos: $1, $2...

# Control de errores

# Si el número de argumentos no es uno, error
if [ $# != 1 ]
then
  # Escribimos en el error estándar: >&2
  # Usamos el operador << para usar como entrada estándar el texto propio script 
cat <<FIN >&2
Número de argumentos incorrecto
Uso: $0 niteraciones
FIN
  exit 1
fi

let k=1
while [ $k -le "$1" ]
do
  echo "$k: hola mundo"
  let k=k+1
done
