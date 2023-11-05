#include <stdio.h>
#include <assert.h>
#include <limits.h>

int pedir_entero(char name[]) {
	int n;

	printf("Ingrese un valor entero para %s: ", name);
	scanf("%i", &n);

	return n;
}


int absoluto(int x) {
	if (x < 0) {
		return -x;
	}

	return x;
}

int main() {
	int n = pedir_entero("n");

	int absoluto_n = absoluto(n);

	printf("El valor absoluto de %d es %d\n", n, absoluto_n);

	assert(
			(n >= 0 && absoluto_n == n) ||
			(n < 0 && absoluto_n == -n)
	);

	return 0;
}
