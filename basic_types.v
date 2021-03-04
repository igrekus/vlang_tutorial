// numbers and implicit promotions
u_u16 := u16(123)
println('$u_u16, ${typeof(u_u16).name}')

v_u16 := 321 + u_u16
println('$v_u16, ${typeof(v_u16).name}')

x_f32 := f32(123.321)
println('$x_f32, ${typeof(x_f32).name}')

y_f32 := x_f32 + 321.123
println('$y_f32, ${typeof(y_f32).name}')

a_int := 1234
println('$a_int, ${typeof(a_int).name}')

b_f64 := 1234.4321
println('$b_f64, ${typeof(b_f64).name}')

c_int := u_u16 + a_int
println('$c_int, ${typeof(c_int).name}')

d_f64 := x_f32 + b_f64
println('$d_f64, ${typeof(d_f64).name}')

// strings and interpolation
name := 'Boblo'
println('str: $name len: $name.len idx=0: ${name[0]} 1..2: ${name[1..3]}')

// unicode
uni := 'hello 🌎'
println('unicode: $uni ${uni.len} ${uni[5..uni.len]}')

// raw
raw := r'hello\nworld'
println(raw)

// conversions
str := '123'
num := str.int()
str2 := num.str()
println('conversions:\n$str ${typeof(str).name}\n$num ${typeof(num).name}\n$str2 ${typeof(str2).name} ')

// number display formatting
float_to_print := 123.4567
println('float_to_print=${float_to_print:4.2f}')
println('pad left to 10: [${float_to_print:10}]')
println('pad right to 10: [${float_to_print:-10}]')
println('pad with zeros left to 10: [${float_to_print:010}]')

// string ops
bobby := name + 'by'
println(bobby)

mut s := 'hello'
s += ' world'
println(s)

// no implicit casts
age := 10
println('age=' + age.str())

// number literals
println('literal notation: dec:${123} hex:${0x7b} bin:${0b01111011} oct:${0o173}')
println('1k separator: ${1_000_000} ${0b0_11} ${3_122.5} ${0xf_f} ${0o17_3}')
