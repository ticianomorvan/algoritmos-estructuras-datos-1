#include <stdio.h>
#include <assert.h>
#include "utils.h"

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
