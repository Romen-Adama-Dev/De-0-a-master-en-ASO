# Queremos hacer un contador que nos diga cuántos meses han pasado
# desde una determinada fecha
# Aquí lo solucionamos con la capacidad que tiene date para 
# imprimir fechas en cualquier formato; y con el "truco" de 
# que "date" genere una expresión matemática que luego es procesada
# por el bash

#!/bin/bash

[[ $1 = "" ]] && { 
	echo >&2 "Usage: $0 _date in any format_"
	exit 1
}

START_DATE="$1"

# Use: normalized_date _date_
# Return month + 12*year
normalized_date() {
	echo $(( $(date -d "$1" +"%Y*12+10#%m") ))
}

NORM_START=$(normalized_date "$START_DATE")
NORM_NOW=$(normalized_date now)
echo $(( NORM_NOW - NORM_START ))
