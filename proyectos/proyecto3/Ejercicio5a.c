#include <stdio.h>
#include "entradas.h"

/*
  Nuevamente, los programas 1.h y 1.i son iguales, por lo que mantenemos una sola definición del programa.
*/

int main() {
  int i;
  i = pedir_entero('i');

  printf("Estado inicial: i = %d\n", i);

  while (i != 0) {
    printf("Estado 1: i = %d\n", i);
    i = i - 1;
    printf("Estado 2: i = %d\n", i);
  }

  printf("Estado 3: i = %d\n", i);
  
  return 0;
}