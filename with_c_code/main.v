module main

import cmod

fn main() {
	// cmod.hello_from_cmod()
	// cmod.use_c_wrapper_to_call_c()

	mut c := cmod.new_config(1, 2, 3)
	mut size := 1

	println('before C call: $c, $size')

	res := cmod.use_struct('COM1', mut c, mut &size)

	println('after C mutation in V:\n$c \n$size\n$res')
}
