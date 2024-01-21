#!/bin/bash

# Ejemplo de órdenes empotradas

[ $# -ne 1 ] && { echo "Falta un argumento" >&2; exit 1; }

fecha=$(date +%Y%m%d)

BACKUPDIR="$HOME/backups"

mkdir -p "$BACKUPDIR"

# Copio un fichero
cp /etc/passwd "$BACKUPDIR/passwd.$fecha"

find "$1" -type f -name "*.sh" | 
while read filename
do
	cp "$filename" "$BACKUPDIR"/$(basename "$filename").$fecha
done
