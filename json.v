import json

struct Foo {
	x int
}

struct User {
	name string
	age int
	foo Foo [skip]
	last_name string [json: lastName]
}

fn main() {
	raw_data := '{ "name": "Frodo", "lastName": "Baggins", "age": 25 }'
	user := json.decode(User, raw_data) or {
		eprintln('Failed to decode JSON')
		return
	}
	println('decode struct $user')

	foos_str := '[{"x": 42}, {"x": 43}]'
	foos := json.decode([]Foo, foos_str)?

	println('decoded array of structs: $foos')
}
