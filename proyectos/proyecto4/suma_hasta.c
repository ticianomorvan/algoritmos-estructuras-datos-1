#include <stdio.h>
#include <assert.h>
#include "utils.h"

int suma_hasta(int n) {
	int i = 0;
	int total = 0;

	if (n == 0) return 0;

	while (i <= n) {
		total = total + i;
		i = i + 1;
	}

	return total;
}

int main() {
	int n = pedir_entero("n");
	assert(n >= 0);

	int suma_hasta_n = suma_hasta(n);

	printf("La suma de los primeros %d naturales es: %d\n", n, suma_hasta_n);

	assert(n >= 0 && suma_hasta_n >= 0);

	return 0;
}
