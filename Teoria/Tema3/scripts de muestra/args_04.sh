#!/bin/bash

# Ejemplo de uso de argumentos: $1, $2...

k=1
while (( $# > 0 ))
do
	echo argumento $k: \"$1\"
	shift
	(( k++ ))
done
