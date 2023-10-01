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
void imprimir_variables(int cant_args, ...) {
  va_list args;
  va_start(args, cant_args);

  char variables[4] = {'x', 'y', 'z', 'm'};

  for (int i = 0; i < cant_args; i++) {
    int value = va_arg(args, int);
    imprimir_entero(value, variables[i]);
  }

  va_end(args);
}

int main() {
  int x, y, z, m;
  x = pedir_entero('x');
  y = pedir_entero('y');
  z = pedir_entero('z');
  m = pedir_entero('m');

  imprimir_variables(4, x, y, z, m);

  if (x < y) {
    m = x;
  } else if (x >= y) {
    m = y;
  }

  imprimir_variables(4, x, 'x', y, 'y', z, 'z', m, 'm');

  if (m >= z) {
    m = z;
  }

  imprimir_variables(4, x, 'x', y, 'y', z, 'z', m, 'm');

  return 0;
}