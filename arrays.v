struct User {
    age  int
    name string
}

// arrays
mut nums := [1, 2, 3]
println('arrays:\n$nums $nums.len ${nums[1]}')
nums[1] = 5
println(nums)
nums = []
println(nums)
nums2 := []int{}   // TODO bug
println(nums2)

// array ops
nums = [1, 2, 3]
nums << 4
println('append one: $nums')
nums << [5, 6, 7]
println('append array: $nums')

mut names := ['John']
names << 'Bob'
names << 'Pete'
// names << 10   // compilation error
println('array of string: $names')
// contains test
println('Vlad' in names)

// array initialization
arr := []int{len: 5, init: 1}
println(arr)

mut numbers := []int{cap: 1000}
println('len: $numbers.len cap: $numbers.cap')
for i in 0 .. 1000 {
	numbers << i
}
println(numbers)

// array methods
// copy
nums_copy := nums.clone()
println('nums: $nums clone: $nums_copy')

// filter
println('filter with expr: ${nums.filter(it % 2 == 0)}')
nums_filter_lambda := nums.filter(fn (x int) bool { return x % 2 == 0 })
println('filter with lambda: $nums_filter_lambda')

// map
strs := ['first', 'second']
println('map expr: ${strs.map(it.to_upper())}')
strs_map_lambda := strs.map(fn (s string) string { return s.to_upper() })
println('map lambda: $strs_map_lambda')

// n-dim arrays
// 2d
mut arr_2d := [][]int{len: 2, init: []int{len: 3, init: 1}}
arr_2d[0][1] = 5
println(arr_2d)

// 3d
mut arr_3d := [][][]int{len: 2, init: [][]int{len: 2, init: []int{len: 3, init: 1}}}
arr_3d[0][1][2] = 5
println(arr_3d)

// sorting
nums = [1, 3, 2]
nums.sort()
println(nums)
nums.sort(a > b)
println(nums)

// array of structs
mut users := [User{23, 'Alex'}, User{20, 'Zed'}, User{25, 'Bert'}]
println(users)
users.sort(a.age < b.age)
println(users)
users.sort(a.name > b.name)
println(users)

// array slicing
nums = [1, 2, 3, 4, 5]
println('${nums[1..4]} ${nums[..4]} ${nums[1..]}')

mut nums_2 := [0, 1, 2]
nums_2 << nums[2..]
println(nums_2)

// oob error handling
// res := nums[100] or { panic('OoB error') }   // panic on error with custom message
res := nums[100] or { 0 }
println('return zero value: ${res}')
