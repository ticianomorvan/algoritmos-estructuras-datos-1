#include <stdio.h>
#include "entradas.h"

int pedir_entero (char name) {
  int n;
  
  printf("Ingrese un valor entero para %c: ", name);
  scanf("%i", &n);

  return n;
}

void imprimir_entero(int n, char name) {
  printf("El valor de %c es: %i\n", name, n);
}