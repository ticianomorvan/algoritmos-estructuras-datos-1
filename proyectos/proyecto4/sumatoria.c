#include <stdio.h>
#include <assert.h>

void pedir_arreglo(int n_max, int a[]) {
	int i = 0;

	while (i < n_max) {
		int x;

		printf("Ingrese un valor entero para el índice %d: ", i);
		scanf("%i", &x);

		a[i] = x;
		i = i + 1;
	}
}

int sumatoria(int tam, int a[]) {
	int i = 0;
	int total = 0;

	while (i < tam) {
		total = total + a[i];
		i = i + 1;
	}

	return total;
}

#define tam_arr 5

int main() {
	int arr[tam_arr];
	pedir_arreglo(tam_arr, arr);

	int sum_arr = sumatoria(tam_arr, arr);

	printf("La sumatoria de los elementos del arreglo es: %d\n", sum_arr);
	assert(sum_arr >= 0);

	return 0;
}
