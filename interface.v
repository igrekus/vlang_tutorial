// interfaces
struct Dog {
	breed string
}

fn (d Dog) speak() string {
	return 'Woof!'
}

struct Cat {
	breed string
}

fn (c Cat) speak() string {
	return 'Meow!'
}

struct Empty {}

interface Pet {
	breed string
	speak() string
}

interface AnyPet {}

fn describe(a AnyPet) {
	if a is Dog {
		println('$a.breed is Dog')
	} else if a is Cat {
		println('$a.breed is Cat')
	} else {
		println('wat dat $a')
	}
}

interface Adoptable {}

fn (a Adoptable) speak() string {
	return 'adopt me!'
}

fn adoptable_cat() Adoptable {
	return Cat{}
}

fn main() {
	// interface implementation
	mut arr := []Pet{}
	arr << Cat{'Brit'}
	arr << Dog{'Husky'}

	for item in arr {
		println('$item.breed says: ${item.speak()}')
	}

	// interface type casts
	describe(Dog{'Labrador'})
	describe(Cat{'Siamese'})
	describe(Empty{})

	// interface method implementation
	c := Cat{}
	println('normal cat: $c.speak()')
	a := adoptable_cat()
	println('adoptable cat: $a.speak()')
	if a is Cat {
		println('cast adoptable cat: $a.speak()')
	}
}
