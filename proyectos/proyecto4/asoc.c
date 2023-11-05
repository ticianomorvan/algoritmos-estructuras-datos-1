#include <stdio.h>
#include <stdbool.h>

typedef char clave_t;
typedef int valor_t;

typedef struct {
	clave_t clave;
	valor_t valor;
} asoc;

bool asoc_existe(int tam, asoc a[], clave_t c) {
	int i = 0;

	while (i < tam) {
		asoc t = a[i];

		if (t.clave == c) {
			return true;
		}

		i = i + 1;
	}

	return false;
}

void pedir_arreglo_asoc(int n_max, asoc a[]) {
	int i = 0;

	while (i < n_max) {
		asoc t;
		char c;
		int v;

		printf("Insertar un caracter como clave para la asociación %d: ", i);
		scanf(" %c", &c);

		printf("Insertar un valor entero para la asociación %d: ", i);
		scanf("%d", &v);

		t.clave = c;
		t.valor = v;

		a[i] = t;
		i = i + 1;
	}
}

char pedir_caracter() {
	char c;

	printf("Ingrese un caracter a usar como clave de búsqueda: ");
	scanf(" %c", &c);

	return c;
}

#define tam_arr 5

int main() {
	asoc arr[tam_arr];
	pedir_arreglo_asoc(tam_arr, arr);

	char clave_busqueda = pedir_caracter();

	bool existe_asoc_clave = asoc_existe(tam_arr, arr, clave_busqueda);

	if (existe_asoc_clave) {
		printf("La entrada asociada a esa clave existe en el arreglo.\n");
	} else {
		printf("La entrada asociada a esa clave no existe en el arreglo.\n");
	}

	return 0;
}
