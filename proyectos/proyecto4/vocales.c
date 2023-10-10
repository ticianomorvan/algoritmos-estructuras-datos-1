#include <stdio.h>
#include <stdbool.h>
#include <assert.h>

char pedir_caracter() {
	char caracter;

	printf("Ingrese un caracter: ");
	scanf("%c", &caracter);

	return caracter;
}

bool es_vocal(char letra) {
	switch (letra) {
		case 'a':
		case 'A':
		case 'e':
		case 'E':
		case 'i':
		case 'I':
		case 'o':
		case 'O':
		case 'u':
		case 'U':
			return true;
		default:
			return false;
	}
}

int main() {
	char c = pedir_caracter();

	/* Verificamos que "c" no sea un caracter nulo */
	assert(c != 0);

	bool es_c_vocal = es_vocal(c);

	if (es_c_vocal) {
		printf("\"%c\" es vocal.\n", c);
	} else {
		printf("\"%c\" no es vocal.\n", c);
	}

	assert(c != 0 && (es_c_vocal == true || es_c_vocal == false));

	return 0;
}
