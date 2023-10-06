#include <stdio.h>
#include <stdbool.h>
#include "entradas.h"
#include "entradas_bool.h"

/*
  Siguiendo el estado inicial original, podemos ver que los estados son:
    e0: x = 5, i = 0, res = False (0)
    e1_0: x = 5, i = 3, res = True (1)
    e1_1: x = 5, i = 4, res = True (1)
    e1_2: x = 5, i = 5, res = True (1)
  
  Por ejemplo, con otro estado inicial:
    e0: x = 4, i = 3, res = False (0)
    e1_0: x = 4, i = 3, res = False (0) (pues 4 % 2 == 0 e i = 2 después de e0)

  Este programa prueba divisores desde el 2 en adelante (i) sobre un número (x) y devuelve si es primo o no (res).
*/

int main() {
  int x, i;
  bool res;

  x = pedir_entero('x');
  i = pedir_entero('i');
  res = pedir_booleano("res");

  i = 2;
  res = true;

  while (i < x && res) {
    res = res && (x % i != 0);
    i = i + 1;

    printf("x = %d, i = %d, res = %d\n", x, i, res);
  }  

  return 0;
}
