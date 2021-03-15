import mymod

fn main() {
	mymod.hello_from_module()
	mymod.call_impl()
	// mymod.private_fn()   // compile error -- private fn
}
