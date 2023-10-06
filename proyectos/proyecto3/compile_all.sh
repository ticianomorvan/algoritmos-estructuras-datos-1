#!/bin/bash

# Compilación de los archivos fuente

for i in $(find -name "Ejercicio*.c" | grep -o "Ejercicio[^.]*")
do
  gcc -Wall -Wextra -std=c99 "$i.c" entradas.c entradas_bool.c -o $i
done
