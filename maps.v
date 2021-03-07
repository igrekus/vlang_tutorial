// empty map and add entries
mut map1 := map[string]int{}
map1['one'] = 1
map1['two'] = 2
println(map1)
println('${map1['one']} ${map1['two']} ${map1['bad']}')

// predefined map
map2 := map {
	1: 'one',
	2: 'two',
}
println(map2)
println('zero value on missing key: [${map2[10]}]')

// val := map1['bad'] or { panic('missing key') }   // can use or {} block to handle missing keys
// println(val)
