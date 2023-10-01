#include <stdio.h>
#include "entradas.h"

// Ejercicio 2

/*
  Con x = 4, y = (-4), z = 8, b = 1, w = 0:
  x % 4 == 0; si x = 4, el resultado es 1
  x + y == 0 && y - x == (-1) * z; si x = 4, y = -4, z = 8, el resultado es 1
  not b && w; si b = 1, w = 0, el resultado es 0

  Luego, como en C tenemos que 1 es equivalente a true y 0 equivalente a false, los valores sugeridos cumplen con las tres expresiones.
*/

int main () {
  int x, y, z, b, w;
  x = pedir_entero('x');
  y = pedir_entero('y');
  z = pedir_entero('z');
  b = pedir_entero('b');
  w = pedir_entero('w');
  
  printf("Ejercicio 2\n");
  printf("x %% 4 == 0; si x = %d, el resultado es %d\n", x, x % 4 == 0);
  printf("x + y == 0 && y - x == (-1) * z; si x = %d, y = %d, z = %d, el resultado es %d\n", x, y, z, x + y == 0 && y - x == (-1) * z);
  printf("not b && w; si b = %d, w = %d, el resultado es %d\n", b, w, !b && w);

  return 0;
}