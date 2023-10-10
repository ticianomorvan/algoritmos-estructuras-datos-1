#include <stdio.h>
#include <stdbool.h>
#include "utils.h"

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
	bool resultado = true;

	while (i < tam) {
		resultado = a[i] % m == 0;
		i = i + 1;
	}

	return resultado;
}

#define tam_arr 5

int main() {
	int opcion;
	int arr[tam_arr];
	pedir_arreglo(tam_arr, arr);

	printf("¿Qué función desea ejecutar? todos_pares [1] ó existe_multiplo [2]: ");
	scanf("%i", &opcion);

	switch (opcion) {
		case 1:
			bool son_todos_pares = todos_pares(tam_arr, arr);

			if (son_todos_pares) {
				printf("Todos los elementos del arreglo son pares.\n");
			} else {
				printf("No todos los elementos del arreglo son pares.\n");
			}
				
			break;
		case 2:
			int m = pedir_entero("múltiplo");
			bool existe_multiplo_en_arr = existe_multiplo(m, tam_arr, arr);
			if (existe_multiplo_en_arr) {
				printf("Si existe un múltiplo de %d en el arreglo.\n", m);
			} else {
				printf("No existe un múltiplo de %d en el arreglo.\n", m);
			}

			break;

		default:
			printf("Debes elegir una opción válida para ejecutar.\n");
			break;
	}
		
	return 0;
}
