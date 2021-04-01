module cmod

#flag -I @VROOT/c
#flag @VROOT/c/impl.o
#include "header.h"

struct C.Config{
mut:
	a int
	b int
	c int
}

fn C.hello()

// int use_struct(char *str, struct Config* cfg, int* size);
fn C.use_struct(charptr, &&C.Config, &int) int

pub fn hello_from_cmod() {
	println('hello from cmod')
}

pub fn use_c_wrapper_to_call_c() {
	C.hello()
}

pub fn new_config(a int, b int, c int) C.Config {
	return C.Config{}
}

pub fn use_struct(s string, mut cfg C.Config, mut size &int) int {
	size = 3
	cfg.a = 3
	cfg.b = 2
	cfg.c = 1
	return 1
}