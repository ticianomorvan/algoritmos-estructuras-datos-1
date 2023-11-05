#include <stdio.h>
#include <assert.h>

int pedir_entero(char name[]) {
	int n;

	printf("Ingrese un valor entero para %s: ", name);
	scanf("%i", &n);

	return n;
}

int minimo(int x, int y) {
	if (x > y) {
		return y;
	}

	return x;
}

int main() {
	int x = pedir_entero("x");
	int y = pedir_entero("y");

	assert(x != y);

	int min = minimo(x, y);

	printf("El mínimo entre %d y %d es %d\n", x, y, min);

	assert(
		(x > y && min == y) ||
		(x < y && min == x)
	);

	return 0;
}
