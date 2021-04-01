#ifndef CMOD_H
#define CMOD_H

#include <stdio.h>
#include <windows.h>
#include <winbase.h>

struct Config {
	int a;
	int b;
	int c;
};

int use_struct(char *str, struct Config* cfg, int* size);

void hello();

BOOL com_exists(int port);

#endif
