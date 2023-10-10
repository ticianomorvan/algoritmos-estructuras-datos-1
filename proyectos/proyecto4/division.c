#include <stdio.h>
#include <assert.h>
#include "utils.h"

typedef struct {
	int cociente;
	int resto;
} div_t;

div_t division(int x, int y) {
	div_t resultado;
	int cociente = x / y;
	int resto = x % y;

	resultado.cociente = cociente;
	resultado.resto = resto;

	return resultado;
}

int main() {
	int x = pedir_entero("x");
	int y = pedir_entero("y");

	/* Ambos deben ser positivos pero el divisor no puede ser nulo. */
	assert(x >= 0 && y > 0);

	div_t resultado_division = division(x, y);

	printf("En la división entera de %d por %d, tenemos un cociente de %d y un resto de %d\n", x, y, resultado_division.cociente, resultado_division.resto);

	assert(
			resultado_division.cociente <= x && resultado_division.resto < y
	);

	return 0;
}
