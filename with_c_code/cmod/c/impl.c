#include <stdio.h>
#include "header.h"

int use_struct(char *str, struct Config* cfg, int* size) {
	printf("while in C call:");
	printf("str: %s\n", str);
	printf("struct: %d %d %d\n", cfg->a, cfg->b, cfg->c);
	printf("int: %d\n", *size);

	printf("mutating struct and size in C...");
	cfg->a = 10;
	cfg->b = 20;
	cfg->c = 30;
	*size = 100500;
	if (*size == 20) {
		return 10;
	} else {
		return 20;
	}
}

void hello() {
	printf("hello from C lol\n");
}

int main() {
	struct Config cfg = {.a = 1, .b = 2, .c = 3};
	int size = 20;
	int ret = use_struct("COM1", &cfg, &size);
	printf("ret: %d\n", ret);
}
