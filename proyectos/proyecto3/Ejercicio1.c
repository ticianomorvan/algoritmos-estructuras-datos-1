#include <stdio.h>
#include "entradas.h"

// Ejercicio 1

/*
  Con x = 7, y = 3, z = 5:

  x + y + 1 = 11
  z * z + y * 45 - 15 * x = 55
  y - 2 == (x * 3 + 1) % 5 = 0
  y / 2 * x = 7
  y < x * z = 1
*/

/*
  Con x = 1, y = 10, z = 8:

  x + y + 1 = 12
  z * z + y * 45 - 15 * x = 499
  y - 2 == (x * 3 + 1) % 5 = 0
  y / 2 * x = 5
  y < x * z = 0
*/

// En la última expresión, el resultado tiene tipo int, debido a que no "existe" como tal el tipo bool.

int main() {
  int x, y, z;

  x = pedir_entero('x');
  y = pedir_entero('y');
  z = pedir_entero('z');
  
  printf("Ejercicio 1\n");
  printf("x + y + 1 = %d\n", x + y + 1 );
  printf("z * z + y * 45 - 15 * x = %d\n", z * z + y * 45 - 15 * x);
  printf("y - 2 == (x * 3 + 1) %% 5 = %d\n", y - 2 == (x * 3 + 1) % 5);
  printf("y / 2 * x = %d\n", y / 2 * x);
  printf("y < x * z = %d\n", y < x * z);

  return 0;
}