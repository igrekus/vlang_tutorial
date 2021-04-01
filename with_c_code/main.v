module main

import cmod

fn main() {
	// cmod.hello_from_cmod()
	cmod.use_c_wrapper_to_call_c()

	c := cmod.new_config(1, 2, 3)
	println(c)
}
