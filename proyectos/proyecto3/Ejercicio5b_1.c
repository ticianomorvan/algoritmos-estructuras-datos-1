#include <stdio.h>
#include "entradas.h"

/*
  Siguiendo el estado inicial original, podemos ver que los estados son:
    e0: x = 13, y = 3, i = 0
    e1_0: x = 10, y = 3, i = 1
    e1_1: x = 7, y = 3, i = 2
    e1_2: x = 4, y = 3, i = 3
    e1_3: x = 1, y = 3, i = 4
  
  Tomando otro estado inicial, podemos ver que:
    e0: x = 13, y = 3, i = 0
    e1_0: x = 10, y = 3, i = 1
    e1_1: x = 7, y = 3, i = 2
    e1_2: x = 4, y = 3, i = 3
    e1_3: x = 1, y = 3, i = 4
  
  Este programa nos devuelve el cociente en la división entera de x entre y.
*/

int main() {
  int x, y, i;
  x = pedir_entero('x');
  y = pedir_entero('y');
  i = pedir_entero('i');

  i = 0;

  while (x >= y) {
    x = x - y;
    i = i + 1;
    printf("x = %d, y = %d, i = %d\n", x, y, i);
  }

  return 0;
}