# == Funciones
# Sirven para agrupar órdenes que se ejecutarán posteriormente, cuando
# se invoque a la función. Ayudan a estructurar el código.

# Definición de funciones: existen dos sintaxis equivalentes
# Sintaxis 1:
# Los paréntesis son obligatorios
funcion_1 () 
{
    echo "Me has pasado $# parámetros:"
    i=1
    for par in "$@"; do
	# Se muestran todos los parámetros pasados
	# a la función
	echo "Parámetro $i: $par"
	((i++))
    done
    # OJO: $0 no cambia dentro de una función; sigue siendo el
    # nombre del script
}

# FYI: La definición de una función actualiza el valor de la variable $?
(( $? == 0 )) && echo "La función funcion_1 se definió correctamente"

# Sintaxis 2
# La palabra clave 'function' es obligatoria
# En este caso, los paréntesis () son opcionales
function funcion_2 () 
{
    # Observa el uso del array predefinido 'FUNCNAME' para
    # acceder al nombre de la función que se está ejecutando.
    # Recuerda que $0 es el nombre del script y que eso no 
    # cambia ni siquiera dentro de una función
    echo "I am funtion ${FUNCNAME[0]}"
    echo "I've got $# parameters:"
    i=1
    while (( $# > 0 )) ; do
	# Se muestran todos los parámetros pasados
	# a la función
	echo "Parameter $i: $1"
	shift
	((i++))
    done
}

# Para invocar a las funciones: nombre_funcion lista_de_parametros
cat <<EOF
Probando la funcion_1

EOF
# Observa que en este caso se pasan valores arbitrarios,
# nombres de fichero ('filename expansion', comodines) y 
# valores de variables
funcion_1 uno 2 Tres /bin/?a? $HOME $RANDOM

cat <<EOF
Probando la funcion_2

EOF
funcion_2 One Two /etc/passwd* 

echo ""
# Importante. Las variables locales hay que declararlas explícitamente 
# con 'local', de lo contrario se asume que son globales al script
function suma
{
    # Observa el uso de 'local'
    local total=0
    total=$(($1 + $2))
    echo "$total"
}

total=10
echo "Antes de invocar a la función 'suma', la variable total vale:$total"
echo -n "Invocando a 'suma': 900 + 99 es "
suma 900 99
echo "Despues de invocar a la función 'suma', la variable total vale:$total"
# Prueba a quitar la palabra clave 'local' que aparece en el
# cuerpo de la función 'suma' y observa qué ocurre
echo ""


# La definición de una función ha de preceder a la primera invocación; de
# lo contrario se produce un error.
x=$(suma 3 2)  # Correcto; la función 'suma' ya ha sido definida
echo "la suma de 3 y 2 vale $x" 
hora   # Esto es un error: se invoca a una función (hora) que aún no se ha definido

function hora () {
    echo "$(date "+%H:%M")"
}
# A partir de ahora ya podemos usar la función 'hora'
echo -e "Hora: $(hora)\n"


# Las funciones, de forma análoga a las órdenes, devuelven un código
# de salida (exit status), accesible con $?.
# El código de salida (exit status) de una función es el de la última
# orden que se ejecutó dentro de ella, o el que se especifique
# en la orden "return"
function suma_v2 () {
    if (( $# == 2 )); then
	echo "$(($1 + $2))"
	# Normalmente, el código de salida de 'echo' es 0
	# Alternativa 1: 
	#   usar la orden true, que siempre tiene código de salida 0
	# true
	# Alternativa 2: usar return 0
	# return 0
    else
	# false es una orden que siempre tiene código de salida 1
	false
	# Alternativamente:
	# return 1
    fi
}



cat <<EOF

Probando la función 'suma_v2'
suma_v2 10 4
EOF
suma_v2 10 4
echo "Código de salida (exit status): $?"


cat <<EOF

Probando la función 'suma_v2'
suma_v2
EOF
suma_v2
echo "Código de salida (exit status): $?"



# Ejemplo: una función similar a la función "die()" en Perl
die ()
{
    echo "$0: $1" 1>&2
    exit 1
}

# Si no se ha pasado al menos un argumento al script, salir con
# un mensaje de error
(($# > 0 )) || die "No me han pasado argumentos. Adios"

# Si el primer argumento no existe o no es un fichero regular, salir con
# un mensaje de error
[[ -e $1 ]] || die "no se puede acceder a $1: no existe"
[[ -f $1 ]] || die "$1 no es un fichero regular"

# Información acerca de funciones en bash:
#     https://www.gnu.org/software/bash/manual/bash.html#Shell-Functions
#     info bash
