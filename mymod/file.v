module mymod

pub fn hello_from_module() {
	println('hello from module')
}

fn private_fn () {
	println('this is a private fn, forbidden to use outside of the module')
}

pub fn call_impl() {
	impl_fn()
}
