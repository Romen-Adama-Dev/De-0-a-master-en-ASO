#!/bin/bash
# Script sencillo de bash
# Bucle que utiliza una variable entera


# Versión 1 - se utiliza la construcción (( expr )) para evaluar
# expresiones aritméticas

echo VERSIÓN 1
x=1
while (( x <= 5 ))
do
	echo La variable x vale $x
	(( x++ ))
done

# Versión 2 - se utiliza la construcción clásica [ expr ]
# y la variable se incrementa con la construcción "let"

echo VERSIÓN 2
x=1
while [ $x -le 5 ] # ojo, hay que poner el dólar antes de la x
do
	echo La variable x vale $x
	let x=x+1
done
