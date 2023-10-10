#include <stdio.h>
#include "utils.h"

typedef struct {
	int menores;
	int mayores;
	int iguales;
} comp_t;

comp_t cuantos(int tam, int a[], int elem) {
	int i = 0;

	comp_t resultados;
	resultados.menores = 0;
	resultados.mayores = 0;
	resultados.iguales = 0;

	while (i < tam) {
		if (a[i] < elem) {
			resultados.menores = resultados.menores + 1;
		} else if (a[i] > elem) {
			resultados.mayores = resultados.mayores + 1;
		} else {
			resultados.iguales = resultados.iguales + 1;
		}

		i = i + 1;
	}

	return resultados;
}

#define tam_arr 5

int main() {
	int arr[tam_arr];
	pedir_arreglo(tam_arr, arr);

	int n = pedir_entero("n");

	comp_t resultados = cuantos(tam_arr, arr, n);

	printf("Resultados:\n");
	printf("Menores a %d: %d\n", n, resultados.menores);
	printf("Mayores a %d: %d\n", n, resultados.mayores);
	printf("Iguales a %d: %d\n", n, resultados.iguales);

	return 0;
}

