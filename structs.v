struct Point {
	x int
mut:
	y int
}

struct Widget {
mut:
	x int
	y int
}

struct Button {
	Widget
	title string
}

struct ButtonConfig {
	title      string
	is_disabled bool
	x	       int = 70
	y   	   int = 20
}

struct Foo {
	n int
	s string
	a []int
	pos int = 1
}

struct Bar {
	req int [required]
}

struct Access {
	a int
mut:
	b int
pub:
	c int
pub mut:
	d int
__global:
	e int
}

struct User {
	age int
	name string
}

fn (u User) can_register () bool {
	return u.age > 16
}

struct Rgba32Component {
	r byte
	g byte
	b byte
	a byte
}

union Rgba32 {
	Rgba32Component
	value u32
}

println('sample struct')
mut p1 := Point{x: 10, y: 10}
println('point $p1 type: ${typeof(p1).name}')
p1.y = 20
println('mutated point $p1 type: ${typeof(p1).name}')

println('heap struct')
p2 := &Point{20, 30}
println('point $p2 type: ${typeof(p2).name}')

println('embedded structs')
mut btn := Button{title: 'A button'}
println(btn)
println('$btn.x $btn.y $btn.title')

println('defaul values')
println(Foo{})

println('required field')
// println(Bar{})   // doesn't compile if not specified required
println(Bar{req: 10})

println('short struct literal syntax')
mut p3 := Point{}
p3 = {x: 50, y: 50}
println(p3)

println('struct as function named params')
btn2 := fn (c ButtonConfig) &Button {
	return &Button {
		Widget: { x: c.x, y: c.y }
		title: c.title
	}
} (title: 'Click me', y: 100)
println(btn2)

println('asccess modifiers')
mut acc := Access{}
println(acc)
// acc.a = 1   // compile error, assignment to immut private field
acc.b = 2
// acc.c = 3   // compile error, assignment to immutable pub field
acc.d = 4
acc.e = 5
println(acc)

// methods
user := User{age: 20}
println('user can_register(): ${user.can_register()}')

user_ref := &User{age: 10}
println('user_ref can_register(): ${user_ref.can_register()}')

// unions
col1 := Rgba32{value:0x008811FF}
col2 := Rgba32{Rgba32Component:{b:0xFF}}
unsafe {
	println('size: ${sizeof(Rgba32)} $col1.value $col1.g $col2.value $col2.b')
}
