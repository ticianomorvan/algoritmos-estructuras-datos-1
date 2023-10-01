#include <stdio.h>
#include <stdbool.h>
#include "entradas.h"

bool pedir_booleano(char name[]) {
  int b;

  printf("Ingrese un valor booleano (0 ó 1) para %s: ", name);
  scanf("%i", &b);

  return b;
}

void imprimir_booleano(bool x, char name[]) {
  if (x) {
    printf("El valor de %s es: Verdadero\n", name);
  } else {
    printf("El valor de %s es: Falso\n", name);
  }
}

