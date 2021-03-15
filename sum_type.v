struct Moon {}

struct Mars {}

struct Venus {}

type World = Moon | Mars | Venus

struct Empty {}

struct Node {
	value int
	left Tree
	right Tree
}

type Tree = Node | Empty

fn sum_tree(t Tree) int {
	return match t {
		Empty { 0 }
		Node { t.value + sum_tree(t.left) + sum_tree(t.right) }
	}
}

fn (m Mars) dust_storm () bool {
	return true
}

fn open_para(n int) int {
	return n
}

fn land(w World) int {
	return match w {
		Moon {
			0
		}
		Mars {
			open_para(3)
		}
		Venus {
			open_para(1)
		}
	}
}

fn (m Mars) shiver() {
	println('shiver')
}

fn (v Venus) sweat() {
	println('sweat')
}

fn (m Moon) moon_walk() {
	println('moon walk')
}

fn pass_time(w World) {
	match w {
		Mars { w.shiver() }
		Moon { w.moon_walk() }
		else {}
	}
}

fn main() {
	sum_t := World(Moon{})
	assert sum_t.type_name() == 'Moon'
	println('sum type: $sum_t')

	left := Node{ 2, Empty{}, Empty{} }
	right := Node{ 3, Empty{}, Empty{} }
	tree := Node{ 4, left, right }
	println('tree sum: ${sum_tree(tree)}')

	mut w := World(Moon{})
	println('type check on sum type: w is Moon - ${w is Moon}')
	w = Mars{}

	mars := w as Mars   // will panic if not Mars
	println('type cast: storm call - ${mars.dust_storm()}')

	if mut w is Mars {
		assert typeof(w).name == 'Mars'
		println('smart cast: storm call - $w.dust_storm()')
	}

	println('match on sum type: Mars para - ${land(mars)}')

	println('match with else branch:')
	pass_time(mars)
}
