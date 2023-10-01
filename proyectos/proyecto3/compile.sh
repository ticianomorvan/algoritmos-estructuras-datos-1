#!/bin/bash

# Compilación de los archivos fuente

gcc -Wall -Wextra -std=c99 "Ejercicio$1.c" entradas.c entradas_bool.c -o "Ejercicio$1"