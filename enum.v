enum Color {
	red
	green
	blue
}

enum KwColor {
	@mut
	red
	green
	blue
}

enum StatusCode {
	ok = 200
	no_auth = 401
	not_found = 404
	next
}

mut color := Color.red
println(color)

color = .green
println(color)

match color {
	.red { println('color is red') }
	.green { println('color is green') }
	.blue { println('color is blue') }
}

kwc := KwColor.@mut
println('use of keyword as a enum value: $kwc')

c1, c2, c3, next := StatusCode.ok, StatusCode.no_auth, StatusCode.not_found, StatusCode.next
println('assign values to enum fields: ${int(c1)} ${int(c2)} ${int(c3)} ${int(next)}')
