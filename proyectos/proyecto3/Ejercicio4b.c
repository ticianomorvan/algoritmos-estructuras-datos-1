#include <stdio.h>
#include <stdarg.h>
#include "entradas.h"

/*
  Según el estado inicial original, los estados consecuentes son:
    e1: x = 5, y = 4, z = 8, m = 4 (pues x >= y)
    e2: x = 5, y = 4, z = 8, m = 4 (pues m < z)

  Con otros estados iniciales, podemos ver lo siguiente:
    e0: x = 2, y = 5, z = 1, m = 6
    e1: x = 2, y = 5, z = 1, m = 2 (pues x < y)
    e2: x = 2, y = 5, z = 1, m = 1 (pues m >= z)
*/

// Ejercicio 6c
// Esta función, si bien no es muy novedosa, nos ahorra código en el largo plazo, aunque se podría mejorar aún más haciendo que tome una cantidad de parámetros indefinida y que por cada uno de ellos agregue a la cadena de texto su resultado, es decir, por cada variable k que se pase como argumento, tendríamos "k1 = x1, k2 = x2, ..., kn = xn"

void imprimir_variables(int x, int y, int z, int m) {
	printf("x = %d, y = %d, z = %d, m = %d\n", x, y, z, m);
}

int main() {
  int x, y, z, m;
  x = pedir_entero('x');
  y = pedir_entero('y');
  z = pedir_entero('z');
  m = pedir_entero('m');

  imprimir_variables(x, y, z, m);

  if (x < y) {
    m = x;
  } else if (x >= y) {
    m = y;
  }

  imprimir_variables(x, y, z, m);

  if (m >= z) {
    m = z;
  }

  imprimir_variables(x, y, z, m);

  return 0;
}
