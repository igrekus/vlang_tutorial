struct Node {
	a &Node
	b &Node = 0   // Auto-init to nil, will be removed
}

struct Foo {
	a int
	b int
}

fn main() {
	// unsafe code
	mut p := unsafe{ malloc(2) }
	println('mem unsafe pointer: ${typeof(p).name} $p')
	
	unsafe {
		p[0] = `h`
		p[1] = `i`
	}

	unsafe { p++ }
	assert *p == `i`

	foo := Node{a: 0}
	bar := Node{a: &foo}
	baz := Node{a: 0, b: 0}
	qux := Node{a: &foo, b: &bar}

	println(baz)
	println(qux)

	f := Foo{}
	println('sizeof type: ${sizeof(Foo)}')
	println('allowed sizeof for instannce of type: ${sizeof(f)}')
	println('field offset in a struct: a = ${__offsetof(Foo, a)}')
	println('field offset in a struct: b = ${__offsetof(Foo, b)}')
}
