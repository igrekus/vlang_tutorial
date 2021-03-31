module tests_example

fn foo(mut v []int) {
	v[0] = 1
	v[1] = 2
}

fn hello() string {
	return 'hello world'
}

fn main() {
	// assert
	mut v := [10, 20]
	foo(mut v)
	assert v == [1, 2]
}
