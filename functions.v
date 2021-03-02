fn main() {
	println('add: ${add(10, 20)}')
	println('sub: ${sub(10, 20)}')
	println('arithm: ${arithm(10, 20)}')
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
