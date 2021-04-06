module main

import cmod

fn main() {
	// cmod.hello_from_cmod()
	cmod.use_c_wrapper_to_call_c()

	mut c := cmod.new_config(1, 2, 3)
	mut size := 1

	println('before C call: $c, $size')

	res := cmod.use_struct('COM1', mut c, mut &size)

	println('after C mutation in V:\n$c \n$size\n$res')

	println('via C adapter func')
	for i in 3 .. 6 {
		mut com1 := cmod.com_exists(i)
		println('com$i exists: $com1')
	}

	println('direct')
	for i in 3 .. 6 {
		mut com2 := cmod.direct_api_com_exists(i)
		println('com$i exists: $com2')
	}
}
