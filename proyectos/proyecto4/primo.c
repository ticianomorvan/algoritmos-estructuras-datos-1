#include <stdio.h>
#include <stdbool.h>
#include <math.h>

int pedir_entero(char name[]) {
	int n;

	printf("Ingrese un valor entero para %s: ", name);
	scanf("%i", &n);

	return n;
}

// NOTA: este programa usa el header "math.h", por lo que la compilación
// requiere del parámetro "-lm" además del archivo para poder compilar correctamente.

/*
 * Determinar si un número es primo viendo si es divisible por los números menores o iguales a su raíz cuadrada.
 * https://cdn.educ.ar/dinamico/UnidadHtml__get__4dc0abe9-4b4b-11e1-83a5-ed15e3c494af/index.html
*/

bool es_primo(int n) {
	int i = 2;

	if (n <= 1) return false;
	if (n == 2 || n == 3) return true;
	
	double raiz_cuadrada_n = sqrt((double) n);

	while (i <= raiz_cuadrada_n) {
		if (n % i == 0) {
			return false;
		}

		i = i + 1;
	}

	return true;
}

int nesimo_primo(int N) {
	int i = 0;
	int n = 2;

	while (i < N) {
		if (es_primo(n)) {
			i = i + 1;
			if (i == N) {
				return n;
			}
		}

		n = n + 1;
	}

	return 1;
}

int main() {
	int n = pedir_entero("n");
	int primo_n = nesimo_primo(n);

	printf("El primo número %d es: %d\n", n, primo_n);

	return 0;
}
