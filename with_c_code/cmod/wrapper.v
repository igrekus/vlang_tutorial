module cmod

#flag -I @VROOT/c
#flag @VROOT/c/impl.o
#include "header.h"

fn C.hello()

pub fn hello_from_cmod() {
	println('hello from cmod')
}

pub fn hello_from_c() {
	C.hello()
}
