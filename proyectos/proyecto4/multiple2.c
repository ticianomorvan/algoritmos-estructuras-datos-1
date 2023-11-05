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
	int z = pedir_entero("z");

	int aux_x = x;
	int aux_y = y;
	int aux_z = z;

	assert(x == aux_x && y == aux_y && z == aux_z);
	printf("Los valores iniciales de x, y, z son: x = %d, y = %d, z = %d\n", x, y, z);

	x = y;
	y = y + aux_x + z;
	z = aux_y + aux_x;

	printf("Los valores finales de x, y, z son: x = %d, y = %d, z = %d\n", x, y, z);
	assert(
			x == aux_y
			&& y == aux_y + aux_x + aux_z
			&& z == aux_y + aux_x
	);

	return 0;
}
