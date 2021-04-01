#ifndef CMOD_H
#define CMOD_H

typedef struct config_t {
	int a;
	int b;
	int c;
} Config;

int use_struct(char *str, Config* cfg, int* size);

void hello();

#endif
