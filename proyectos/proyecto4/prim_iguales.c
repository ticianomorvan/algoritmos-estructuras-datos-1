#include <stdio.h>
#include "utils.h"

int prim_iguales(int tam, int a[]) {
	int i = 1;
	int anterior = a[0];
	
	while (i < tam) {
		if (anterior == a[i]) {
			anterior = a[i];
			i = i + 1;
		} else {
			break;
		}
	}

	printf("El tramo inicial más largo encontrado en el arreglo es:\n");
	imprimir_arreglo(i, a);

	return i;
}

#define tam_arr 5

int main() {
	int arr[tam_arr];
	pedir_arreglo(tam_arr, arr);

	int longitud_elementos_iguales = prim_iguales(tam_arr, arr);
	printf("El tramo inicial más largo de elementos iguales tiene %d elementos.\n", longitud_elementos_iguales);

	return 0;
}
