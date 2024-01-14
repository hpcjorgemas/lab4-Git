#!/bin/bash

archivo="$1"
nombre_archivo=$(basename --suffix=".fastq" "$archivo")
nombre_nuevo="${nombre_archivo%}-cut.fastq"


total_lines=$(wc -l < "$archivo")

echo -e "\nEl numero total de lineas de $nombre_archivo es $total_lines"

lines_cut=$(expr $total_lines / 20)

echo -e "\n El numero de lineas cortadas de $nombre_archivo  es $lines_cut"

head -n $lines_cut "$archivo" > $nombre_nuevo

echo -e "\nSe ha creado el archivo $nombre_nuevo"
