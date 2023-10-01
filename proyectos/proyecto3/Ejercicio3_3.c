#include <stdio.h>
#include "entradas.h"

/*
  Ejecución 1: el usuario ingresa "x = 5" y "y = 2", produce una salida "x = 9, y = 4".
  Ejecución 2: el usuario ingresa "x = 9" y "y = 12", produce una salida "x = 33, y = 24".
  Ejecución 3: el usuario ingresa "x = 3" y "y = -6" produce una salida "x = -9, y = -12"
*/

int main() {
  int x, y;
  x = pedir_entero('x');
  y = pedir_entero('y');

  printf("x = %d, y = %d\n", x, y);

  y = y + y;
  printf("x = %d, y = %d\n", x, y);

  x = x + y;
  printf("x = %d, y = %d\n", x, y);

  return 0;
}