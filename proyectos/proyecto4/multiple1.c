#include <stdio.h>
#include <assert.h>

int pedir_entero(char name[]) {
	int n;

	printf("Ingrese un valor entero para %s: ", name);
	scanf("%i", &n);

	return n;
}

int main() {
	int x = pedir_entero("x");
	int y = pedir_entero("y");

	int aux_x = x;
	int aux_y = y;

	assert(x == aux_x && y == aux_y);
	printf("Los valores iniciales de x e y son: x = %d, y = %d\n", x, y);

	int t = x;
	x = x + 1;
	y = y + t;

	printf("Los valores finales de x e y son: x = %d, y = %d\n", x, y);
	assert(x == aux_x + 1 && y == aux_x + aux_y);

	return 0;
}
