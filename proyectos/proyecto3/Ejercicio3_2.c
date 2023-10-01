#include <stdio.h>
#include "entradas.h"

/*
  Ejecución 1: usuario ingresa "x = 2" y "y = 3", produce una salida "x = 5, y = 6".
  Ejecución 2: usuario ingresa "x = 5" y "y = 8", produce una salida "x = 13, y = 16".
  Ejerución 3: usuario ingresa "x = 9" y "y = 14", produce una salida "x = 23, y = 28".
*/

int main() {
  int x, y;
  x = pedir_entero('x');
  y = pedir_entero('y');

  printf("x = %d, y = %d\n", x, y);

  x = x + y;
  printf("x = %d, y = %d\n", x, y);

  y = y + y;
  printf("x = %d, y = %d\n", x, y);

  return 0;
}