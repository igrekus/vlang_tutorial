struct Abc {
	val string
}

struct Xyz {
	val string
}

type Alpha = Abc | Xyz

struct Inner1 {
	val int
}

struct Inner2 {
	val string
}

type MySumType = Inner1 | Inner2

struct Outer {
	member MySumType
}

enum Token {
	plus
	minus
	div
	mult
}

struct Parser {
	token Token
}

enum Color {
	red
	green
	blue
}
// if statement
a, b := 10, 20
if a < b {
	println('a < b: ${a < b}')
} else if a > b {
	println('a > b: ${a > b}')
} else {
	println('a == b: ${a == b}')
}

// if expr
test := 777
res := if 777 % 2 == 0 {' even' } else { 'odd' }
println('$test odd? $res')

// type checks
x := Alpha(Abc{'abc'})
if x is Abc {
	println('if: x is Abc: $x')  // automatic cast to appropriate inner type
}
if x !is Xyz {
	println('if: x is not Xyz')
}

// with match
match x {
	Abc {
		println('match: x is Abc: $x')
	}
	Xyz {
		println('match: x is Xyz: $x')
	}
}

// for struct fields
mt := Outer {
	member: Inner1{123}   // member is automatically cast Inner1 -> MySumType
}
if mt.member is Inner1 {
	println('member: $mt.member.val')
}

mt2 := Outer {
	member: Inner2{'string value'}
}
if mt2.member is Inner2 {
	println('member: $mt2.member.val')
}
match mt2.member {
	Inner2 {
		println(mt2.member)
	}
	else {}
}

// mutable sum types
mut y := Outer{Inner1{123}}
y = Outer{Inner2{'string value'}}
if mut y.member is Inner2 {
	println('mutable sumtype: $y.member.val')
}

match y.member {
	Inner1 {
		println('mutable sumtype match: $y.member.val')
	}
	Inner2 {
		println('mutable sumtype match: $y.member.val')
	}
}

// in operator
nums := [1, 2, 3]
println('in ${1 in nums} not in ${4 !in nums}')

m := map {
	1: 'one',
	2: 'two',
}
println('in ${1 in m} not in ${4 !in m}')

// with enums
parser := Parser{}
if parser.token == .plus || parser.token == .minus || parser.token == .div || parser.token == .mult {
	println(parser)
}
if parser.token in [.plus, .minus, .div, .mult] {
	println(parser)
}

// for loop
// for-in for arrays
println('for loop array:')
mut numbers := [1, 2, 3, 4, 5]
for num in numbers {
	println(num)
}

names := ['Sam', 'Max', 'Pete']
for idx, name in names {
	println('$idx) $name')
}

// for-in for maps
println('for loop map:')
for key, value in m {
	println('$key -> $value')
}

// ignore values
for key, _ in m {
	println('$key -> ')
}

// ignore keys
for _, value in m {
	println('  -> $value')
}

// range for
println('range for')
for i in 0..5 {
	println(i)
}

// conditional for (while)
println('conditional for:')
mut sum := 0
mut i := 0
for i <= 1000 {
	sum += i
	i++ 
}
println('sum $sum')

// infinite for
println('infinite for:')
mut num := 0
for {
	if num >= 10 {
		break
	}
	num += 2
	println(num)
}

// classic C for
println('classic C for:')
for j := 0; j < 10; j++ {
	if j == 6 {
		continue
	}
	println(j)
}

// conditional break & continue
println('conditional break & continue')
outer: for j := 4; true; j++ {
	println(j)
	for {
		if j < 7 {
			continue outer
		} else {
			break outer
		}
	}
}

println('match statement:')
str := 'first'
match str {
	'first' { println('first string is $str') }
	'second' { println('second string is $str') }
	else { println('what dis') }
}

println('match expr')
value := match 2 {
	1 { 'one' }
	2 { 'two' }
	else { 'rest' }
}
println('$value')

println('match return value')
println(fn (color Color) bool {
	return match color {
		.red, .blue { 
			println('selected red or blue')
			true
		}
		.green {
			println('selected green')
			false
		}
	}
}(Color.green))

println('match range')
c := `v`
case := match c {
	`0`...`9` { 'digit' }
	`A`...`Z` { 'uppercase' }
	`a`...`z` { 'lowercase' }
	else { 'other' }
}
println(case)

fn () {
	mut ok := false
	mut f := 2
	println('before defer')
	defer {
		println('deferred code block $ok $f')
	}

	if !ok {
		// defer statement will be called here, the file will be closed
		return
	}
	// ...
	// defer statement will be called here, the file will be closed
}()
println('after defer')
