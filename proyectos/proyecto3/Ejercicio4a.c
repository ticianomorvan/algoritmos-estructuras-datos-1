#include <stdio.h>
#include "entradas.h"

/* 
  El programa 1.e y 1.f son iguales pero con distinto estado inicial.
  Como el estado inicial depende de la entrada del usuario, es innecesario re escribirlo.
*/

int main() {
  int x, y;
  x = pedir_entero('x');
  y = pedir_entero('y');
  printf("x = %d, y = %d\n", x, y);

  if (x >= y) {
    x = 0;
  } else if (x <= y) {
    x = 2;
  }

  printf("x = %d, y = %d\n", x, y);

  return 0;
}
