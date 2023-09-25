#include <stdio.h>

// Ejercicio 1

/*
  Con x = 7, y = 3, z = 5:

  x + y + 1 = 11
  z * z + y * 45 - 15 * x = 55
  y - 2 == (x * 3 + 1) % 5 = 0
  y / 2 * x = 7
  y < x * z = 1
*/

/*
  Con x = 1, y = 10, z = 8:

  x + y + 1 = 12
  z * z + y * 45 - 15 * x = 499
  y - 2 == (x * 3 + 1) % 5 = 0
  y / 2 * x = 5
  y < x * z = 0
*/

// En la última expresión, el resultado tiene tipo int, debido a que no "existe" como tal el tipo bool.

// Ejercicio 2

/*
  Con x = 4, y = (-4), z = 8, b = 1, w = 0:
  x % 4 == 0; si x = 4, el resultado es 1
  x + y == 0 && y - x == (-1) * z; si x = 4, y = -4, z = 8, el resultado es 1
  not b && w; si b = 1, w = 0, el resultado es 0

  Luego, como en C tenemos que 1 es equivalente a true y 0 equivalente a false, los valores sugeridos cumplen con las tres expresiones.
*/

int obtenerEjercicio () {
  int e;

  printf("Ingrese el ejercicio a ejecutar (ej: 1): ");
  scanf("%i", &e);
 
  return e;
}

int pedirEntero (char v) {
  int n;
  
  printf("Ingrese un valor entero para %c: ", v);
  scanf("%i", &n);

  return n;
}

void ejercicioUno () {
  int x, y, z;

  x = pedirEntero('x');
  y = pedirEntero('y');
  z = pedirEntero('z');
  
  printf("Ejercicio 1\n");
  printf("x + y + 1 = %d\n", x + y + 1 );
  printf("z * z + y * 45 - 15 * x = %d\n", z * z + y * 45 - 15 * x);
  printf("y - 2 == (x * 3 + 1) %% 5 = %d\n", y - 2 == (x * 3 + 1) % 5);
  printf("y / 2 * x = %d\n", y / 2 * x);
  printf("y < x * z = %d\n", y < x * z);
}

void ejercicioDos () {
  int x, y, z, b, w;

  x = pedirEntero('x');
  y = pedirEntero('y');
  z = pedirEntero('z');
  b = pedirEntero('b');
  w = pedirEntero('w');
  
  printf("Ejercicio 2\n");
  printf("x %% 4 == 0; si x = %d, el resultado es %d\n", x, x % 4 == 0);
  printf("x + y == 0 && y - x == (-1) * z; si x = %d, y = %d, z = %d, el resultado es %d\n", x, y, z, x + y == 0 && y - x == (-1) * z);
  printf("not b && w; si b = %d, w = %d, el resultado es %d\n", b, w, !b && w);
}

int main() {
  int ejercicio = obtenerEjercicio();

  switch (ejercicio) {
    case 1:
      ejercicioUno();
      break;
    case 2:
      ejercicioDos();
      break;
    default:
      break;
  }

  return 0;
}
