struct User {
	name string
mut:
	is_reg bool
}

fn add(x int, y int) int {
	return x + y
}

fn sub(x int, y int) int {
	return x - y
}

fn arithm(x int, y int) (int, int) {
	return x - y, x + y
}

// mutable args
fn (mut u User) register() {
	u.is_reg = true
}

fn mult_array_by_2_inplace(mut ar []int) {
	for mut el in ar {
		el *= 2
	}
}

// fn mut_increment(mut a int) {   // doesn't compile, no primitive vars mutations
// 	a += 1
// }

// struct update syntax
fn register(u User) User {
	return {
		...u
		is_reg: true
	}
}

// variable number of args
fn sum(a ...int) int {
	mut total := 0
	for x in a {
		total += x
	}
	return total
}

// anonymouse and hof
fn sqr(n int) int {
	return n * n
}

fn cuber(n int) int {
	return n * n * n
}

fn run(value int, op fn (int) int) int {
	return op(value)
}

fn main() {
	println('add: ${add(10, 20)}')
	println('sub: ${sub(10, 20)}')
	println('arithm: ${arithm(10, 20)}')

	mut user := User{}
	println(user)
	user.register()
	println(user)

	mut arr := [1, 2, 3, 4, 5]
	mult_array_by_2_inplace(mut arr)
	println(arr)

	// mut a := 1
	// mut_increment(mut a)
	// println(a)

	println('struct update')
	user = User{}
	user = register(user)
	println(user)

	println('variable args functions:')
	println('several args: ${sum(1,2,3,4,5)}')
	println('several args: ${sum(...[1,2,3])}')


}
