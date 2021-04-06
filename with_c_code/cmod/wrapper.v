module cmod

#flag -I @VROOT/c
#flag @VROOT/c/impl.o
#include "header.h"
#include <windows.h>

struct C._COMMCONFIG{
}

fn C.GetDefaultCommConfig(port &u16, cfg &C._COMMCONFIG, size &u32) int

struct C.Config{
mut:
	a int
	b int
	c int
}

fn C.hello()

// int use_struct(char *str, struct Config* cfg, int* size);
fn C.use_struct(charptr, &C.Config, &int) int

fn C.com_exists(int) bool

pub fn hello_from_cmod() {
	println('hello from cmod')
}

pub fn use_c_wrapper_to_call_c() {
	C.hello()
}

pub fn new_config(a int, b int, c int) C.Config {
	return C.Config{a, b, c}
}

pub fn use_struct(s string, mut cfg C.Config, mut size &int) int {
	ret := C.use_struct(s.str, cfg, size)
	return ret
}

pub fn com_exists(com int) bool {
	return C.com_exists(com)
}

pub fn direct_api_com_exists(com int) bool {
	mut cfg := C._COMMCONFIG{}
	mut size := sizeof (cfg)
	return C.GetDefaultCommConfig('COM$com'.to_wide(), &cfg, &size) != 0 || size > sizeof (cfg)
}
