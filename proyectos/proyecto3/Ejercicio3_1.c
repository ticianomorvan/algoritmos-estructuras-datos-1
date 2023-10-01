#include <stdio.h>
#include "entradas.h"

/*
  Ejecución 1: usuario ingresa "x = 2", produce una salida "x = 5".
  Ejecución 2: usuario ingresa "x = 5", produce una salida "x = 5".
  Ejerución 3: usuario ingresa "x = 8", produce una salida "x = 5".
*/

int main() {
  int x;

  x = pedir_entero('x');
  printf("x = %d\n", x);

  x = 5;
  printf("x = %d\n", x);

  return 0;
}