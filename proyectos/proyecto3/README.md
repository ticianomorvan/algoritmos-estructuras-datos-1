# Proyecto 3 (Lenguaje C) - Ticiano Morvan

> NOTA: Como se explica en los últimos ejercicios, utilizo a lo largo de los demás funciones de ayuda (ej: `pedir_entero`), por lo tanto, es necesario tomarlos en cuenta al momento de compilar los archivos. Por ejemplo, para compilar **Ejercicio3_1.c** se debe ejecutar, siguiendo la directiva del curso, el comando `gcc -Wall -Wextra -std=c99 Ejercicio3_1.c entradas.c -o Ejercicio3`.

Por un efecto práctico, creé un script de consola en el archivo `compile.sh` que, una vez otorgados permisos de ejecución con `chmod +x ./compile.sh` permite agilizar el proceso de compilación de los ejercicios. Por ejemplo, nuevamente para compilar **Ejercicio3_1.c** se puede ejecutar `./compile.sh 3_1`, lo que generará el binario correspondiente con el formato `Ejercicio-<ejercicio>`.

Además de este script, también escribí otros dos para automatizar aún más el proceso:
- `compile_all.sh` para, como su nombre indica, compilar todos los ejercicios a la vez sin argumentos.
- `delete_executables.sh` otra vez bastante obvio, para eliminar los ejecutables que hayan sido creados de la ejecución de los anteriores.

> Los tres scripts solo necesitan de utilidades de Linux básicas y el compilador GCC: `find`, `grep`, `gcc`.

Finalmente, la mayor parte de las anotaciones quedan a modo de comentarios de C en sus respectivos archivos, por lo que las ambigüedades posibles en las ejecuciones de los mismos se podrán resolver a través de estos comentarios.
