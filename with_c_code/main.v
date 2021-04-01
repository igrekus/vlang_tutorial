module main

import cmod

fn main() {
	// cmod.hello_from_cmod()
	cmod.use_c_wrapper_to_call_c()

	mut c := cmod.new_config(1, 2, 3)
	mut size := 3

	println(c)

	cmod.use_struct('COM1', mut c, mut &size)

	println('get config and size:\n$c \n$size')
}
