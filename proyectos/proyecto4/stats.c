#include <stdio.h>

typedef struct {
	float maximo;
	float minimo;
	float promedio;
} datos_t;

datos_t stats(int tam, float a[]) {
	int i = 1;

	datos_t resultados;
	resultados.maximo = 0.0;
	resultados.minimo = 0.0;
	resultados.promedio = 0.0;

	while (i < tam) {
		if (a[i] < a[i - 1]) {
			resultados.minimo = a[i];
		} else if (a[i] > a[i - 1]) {
			resultados.maximo = a[i];
		}

		resultados.promedio = resultados.promedio + a[i];
		i = i + 1;
	}

	resultados.promedio = resultados.promedio / tam;

	return resultados;
}

void pedir_arreglo_float(int n_max, float a[]) {
	int i = 0;

	while (i < n_max) {
		float x;

		printf("Ingrese un valor decimal para el índice %d: ", i);
		scanf("%f", &x);

		a[i] = x;
		i = i + 1;
	}
}

#define tam_arr 5

int main() {
 	float arr[tam_arr];
	pedir_arreglo_float(tam_arr, arr);

	datos_t resultados = stats(tam_arr, arr);

	printf("Resultados:\n");
	printf("Minimo: %.2f\n", resultados.minimo);
	printf("Máximo: %.2f\n", resultados.maximo);
	printf("Promedio: %.2f\n", resultados.promedio);

	return 0;
}

