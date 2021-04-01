#ifndef CMOD_H
#define CMOD_H

struct Config {
	int a;
	int b;
	int c;
};

int use_struct(char *str, struct Config* cfg, int* size);

void hello();

#endif
