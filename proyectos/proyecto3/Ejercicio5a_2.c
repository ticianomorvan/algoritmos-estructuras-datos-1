#include <stdio.h>
#include "entradas.h"

/*
	Con un estado inicial de e0: i = 400, tenemos:

	e1_1: i = 400
	e2_1: i = 0
	e3: i = 0
*/

int main() {
  int i;
  i = pedir_entero('i');

  printf("Estado inicial: i = %d\n", i);

  while (i != 0) {
    printf("Estado 1: i = %d\n", i);
    i = 0;
    printf("Estado 2: i = %d\n", i);
  }

  printf("Estado 3: i = %d\n", i);
  
  return 0;
}
