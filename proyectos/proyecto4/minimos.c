#include <stdio.h>
#include <limits.h>

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

int minimo_pares(int tam, int a[]) {
	int min = INT_MAX;
	int i = 0;

	while (i < tam) {
		if (a[i] % 2 == 0 && a[i] < min) {
			min = a[i];
		}

		i = i + 1;
	}
	
	return min;
}

int minimo_impares(int tam, int a[]) {
	int min = INT_MAX;
	int i = 0;

	while (i < tam) {
		if (a[i] % 2 != 0 && a[i] < min) {
			min = a[i];
		}

		i = i + 1;
	}
	
	return min;
}

#define tam_arr 5

int main() {
	int arr[tam_arr];
	pedir_arreglo(tam_arr, arr);

	int minimo_par_en_arr = minimo_pares(tam_arr, arr);
	int minimo_impar_en_arr = minimo_impares(tam_arr, arr);
	int minimo_en_arr;

	if (minimo_par_en_arr < minimo_impar_en_arr) {
		minimo_en_arr = minimo_par_en_arr;
	} else {
		minimo_en_arr = minimo_impar_en_arr;
	}

	if (minimo_par_en_arr == INT_MAX) {
		printf("No hay números pares en el arreglo.\n");
	} else {
		printf("El mínimo número par del arreglo es: %d\n", minimo_par_en_arr);
	}

	if (minimo_impar_en_arr == INT_MAX) {
		printf("No hay números impares en el arreglo.\n");
	} else {
		printf("el mínimo número impar del arreglo es: %d\n", minimo_impar_en_arr);
	}

	printf("El mínimo número del arreglo es: %d\n", minimo_en_arr);

	return 0;
}
