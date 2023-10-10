#include <stdio.h>

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
