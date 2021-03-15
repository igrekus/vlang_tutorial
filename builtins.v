// built-in functions
struct Color {
	r byte
	g byte
	b byte
}

pub fn (c Color) str() string {
	return 'Color{$c.r $c.g $c.b}'
}

print('print built-in\n')
println('println built-in')

eprint('eprint built-in, output to stderr\n')
eprintln('eprintln built-in, output to stderr')

// panic('erroeous result')   // print stack trace and halt the program with errcode = 1
print_backtrace()   // print backtrace to stderr
// exit(20)   // terminate program with a custom error code

c := Color{r: 255}
println('$c')
