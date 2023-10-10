#include <stdio.h>
#include <assert.h>
#include "utils.h"

void hola_hasta(int n) {
	int i = 0;

	while (i < n) {
		printf("%d: Hola\n", i + 1);
		i = i + 1;
	}
}

int main() {
	int n = pedir_entero("n");
	assert(n > 0);
	hola_hasta(n);

	return 0;
}
