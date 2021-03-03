name := 'Bob'
age := 20
large_num := i64(999999999999999999)

println(name)
println(age)
println(large_num)

mut mutable_int :=  10
println('mut before: $mutable_int')
mutable_int = 20
println('mut after: $mutable_int')

mut a := 0
mut b := 1
println('before swap: $a $b')
a, b = b, a
println('after swap: $a $b')
