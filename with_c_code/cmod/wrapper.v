module cmod

#flag -I @VROOT/c
#flag @VROOT/c/impl.o
#include "header.h"

fn C.hello()

struct C.Config{
	a int
	b int
	c int
}

pub fn hello_from_cmod() {
	println('hello from cmod')
}

pub fn use_c_wrapper_to_call_c() {
	C.hello()
}

pub fn new_config(a int, b int, c int) C.Config {
	return C.Config{1, 2, 3}
}
