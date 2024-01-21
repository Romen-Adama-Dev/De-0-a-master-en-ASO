#!/bin/bash

# == Arrays unidimensionales
# Se indexan con una expresión entera no negativa
# No hay límite máximo
# No es necesario que todos los elementos se asignen de forma contigua
# No es necesario declararlos, aunque puede hacerse con "declare -a varname"
declare -a mi_array  # mi_array está declarada, pero vacía hasta que se le asignen valores

# Basta usarlos directamente, sin necesidad de declaración previa
var[0]="cero"
var[7]="siete"
var[13]="doce + uno"

# También se pueden declarar y asignar valores simultáneamente
# En este caso, se asignan índices consecutivos comenzando en 0
ello=(primero segundo "después del segundo")
fich=("puedes usar comodines" /bin/a* /home/*)


cat <<EOF

---------------------------------------------
Acceso a los valores e índices de los arrays
---------------------------------------------
EOF
# Acceso a los valores del array: ${varname[indice]}
for idx in 0 7 13
do
    echo "El elto. $idx de var vale ${var[$idx]}"
done
echo 

# Número de elementos del array: ${#varname[@]}
echo "El array ello tiene ${#ello[@]} elementos"
for ((i=0; i<${#ello[@]}; i++))
do
    echo "El elto. $i de ello vale ${ello[$i]}"
done
echo 

# Puedes obtener una lista formada por todos los valores del array
# con ${varname[@]}
for item in "${fich[@]}"; do
    echo "fich contiene el valor $item"
done
echo

# Puedes obtener una lista de los índices de un array
# con ${!varname[@]}
echo "Los índices del array var son los siguientes: ${!var[@]}"

# Observa que la inicialización de arrays puede hacerse
# usando también expansión de órdenes
login_names=( $(cut -d: -f1 /etc/passwd | sort -r) )
echo "Listado de nombres de usuario:"
echo "${login_names[@]}"


# == Arrays asociativos
# Análogos en todo a los arrays, excepto:
# .- Los índices pueden ser valores arbitrarios no numéricos
# .- Es necesario declararlos con declare -A
# .- La asignación con lista tiene la siguiente sintaxis:
#    array_asoc=([indice1]=valor1 [indice2]=valor1 ... )
cat <<EOF

---------------------------------------------
Ejemplo 1 de array asociativo (vegetales)
---------------------------------------------
EOF

# Ejemplo de asignación con lista
declare -A vegetales
vegetales=( ['pera']=fruta [cebolla]=hortaliza [cannabis]="Ufff. Sin comentarios" )
vegetales["cacahuete marino"]="una quimera; no existe"
for idx in "${!vegetales[@]}" ; do
    echo "$idx es ${vegetales[$idx]}"
done


cat <<EOF

---------------------------------------------
Ejemplo de array asociativo username --> shell
---------------------------------------------
EOF
# Otro ejemplo: almacenar en un array asociativo el shell que tiene
# asignado cada usuario en el sistema; la clave ha de ser el nombre
# de usuario y la información asociada, su shell por defecto
declare -A shell
for login_name in $(cut -d: -f1 /etc/passwd); do
    shell[$login_name]="$(grep "^$login_name:" /etc/passwd | cut -d: -f7)"
done

# Comprobamos el resultado
for login_name in "${!shell[@]}"; do
    echo "usuario $login_name --> ${shell[$login_name]}"
done


cat <<EOF

---------------------------------------------
Ejemplo de array asociativo username --> shell
Versión más eficiente
---------------------------------------------
EOF
# Una solución más eficiente del problema anterior.
#
# Antes que nada, se destruye el array asociativo (unset) y
# se vuelve a declarar (declare -A), para evitar que queden
# valores almacenados en el ejemplo anterior
unset shell
declare -A shell
# Uso de la "fórmula" while + IFS + read para leer las líneas
# del fichero /etc/passwd y almacenar los campos que nos 
# interesan.
# Observa el uso de la variable foo para ignorar los
# campos que no nos interesan.
while IFS=: read login_name foo foo foo foo foo the_shell ; do
    shell[$login_name]=$the_shell
done < /etc/passwd

# Comprobamos el resultado
for login_name in "${!shell[@]}"; do
    echo "usuario $login_name --> ${shell[$login_name]}"
done


# Para más información:
# Manual de referencia de bash: https://www.gnu.org/software/bash/manual/bashref.html#Arrays
# info bash
