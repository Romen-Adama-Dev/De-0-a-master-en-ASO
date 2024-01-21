#!/bin/bash

# Ejemplo de uso de argumentos: $1, $2...

# Una función
# Los argumentos se llaman igual que en el script principal: $1, $2...
die() {
	echo $1 >&2
	exit 1
}

# Si el número de argumentos no es uno, error
[[ $# != 1 ]] && die "Número de argumentos incorrecto"

# Si el argumento no es un número entero, error
[[ $1 =~ ^[-+]?[0-9]+$ ]] || die "El agumento debe ser un número"

k=1
while (( k <= $1 ))
do
  echo "$k: hola mundo"
  (( k++ ))
done
