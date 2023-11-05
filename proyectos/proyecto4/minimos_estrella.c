#include <stdio.h>
#include <stdbool.h>
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

bool todos_pares(int tam, int a[]) {
	int i = 0;
	bool resultado = true;

	while (i < tam) {
		resultado = resultado && (a[i] % 2 == 0);
		i = i + 1;
	}

	return resultado;
}

bool existe_multiplo(int m, int tam, int a[]) {
	int i = 0;
	bool resultado = false;

	while (i < tam) {
		resultado = resultado || a[i] % m == 0;
		i = i + 1;
	}

	return resultado;
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

	bool son_todos_pares = todos_pares(tam_arr, arr);
	bool hay_numeros_pares = existe_multiplo(2, tam_arr, arr);

	if (hay_numeros_pares) {
		printf("El mínimo número par del arreglo es: %d\n", minimo_par_en_arr);
	}

	if (!son_todos_pares) {
		printf("El mínimo número impar del arreglo es: %d\n", minimo_impar_en_arr);
	}

	printf("El mínimo número del arreglo es: %d\n", minimo_en_arr);

	return 0;
}
