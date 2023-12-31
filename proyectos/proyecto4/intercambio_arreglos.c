#include <stdio.h>
#include <assert.h>

int pedir_entero(char name[]) {
	int n;

	printf("Ingrese un valor entero para %s: ", name);
	scanf("%i", &n);

	return n;
}

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

void imprimir_arreglo(int n_max, int a[]) {
	int i = 0;

	while (i < n_max) {
		printf("Array (%d): %d\n", i, a[i]);
		i = i + 1;
	}
}

void intercambiar(int tam, int a[], int i, int j) {
	assert(
			(i >= 0 && i < tam)
			&& (j >= 0 && j < tam)
	);

	int valor_en_i = a[i];
	a[i] = a[j];
	a[j] = valor_en_i;
}

#define tam_arr 5

int main() {
	int i, j, arr[tam_arr];
	pedir_arreglo(tam_arr, arr);

	i = pedir_entero("i (primer índice)");
	j = pedir_entero("j (segundo índice)");

	intercambiar(tam_arr, arr, i, j);

	imprimir_arreglo(tam_arr, arr);

	return 0;
}
