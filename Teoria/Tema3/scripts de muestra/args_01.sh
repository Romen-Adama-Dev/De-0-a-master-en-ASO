#!/bin/bash

# Ejemplo de uso de argumentos: $1, $2...

# Control de errores

# Si el número de argumentos no es uno, error
if [ $# != 1 ]
then
  # Escribimos en el error estándar: >&2
  echo "Número de argumentos incorrecto" >&2
  echo "Uso: $0 niteraciones" >&2
  exit 1
fi

let k=1
while [ $k -le "$1" ]
do
  echo "$k: hola mundo"
  let k=k+1
done
