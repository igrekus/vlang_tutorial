fn run(value int, op fn (int) int) int {
	return op(value)
}

res := run(5, fn (n int) int { 
	return 3 *n
})

println('pass lambda to hof directly - triple(5): ${res}')   // should be possible to inline res to extrapolation string (or fix the docs)
