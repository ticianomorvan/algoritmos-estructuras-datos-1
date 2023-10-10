
#include <stdio.h>
#include <assert.h>
#include "utils.h"

void intercambio(int *x, int *y) {
	int t = *x;
	*x = *y;
	*y = t;
}

int main() {
	int x = pedir_entero("x");
	int y = pedir_entero("y");

	int aux_x = x;
	int aux_y = y;

	assert(x == aux_x && y == aux_y);

	printf("Los valores iniciales de x e y son: x = %d, y = %d\n", x, y);

	intercambio(&x, &y);

	printf("Luego del intercambio, los valores son: x = %d, y = %d\n", x, y);

	assert(x != aux_x && y != aux_y);

	return 0;
}
