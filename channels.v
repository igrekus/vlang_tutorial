import time

struct Abc {
	x int
}

fn f_ch<T>(ch T) {
	println(ch)
}

struct State {
mut:
	x int
}

fn (shared s State) set_shared() {
	lock s {
		s.x = 42
	}
}

fn main() {
	ch_int_unbuf := chan int{}   // unbuffered -- "synchronous" (?)
	ch_f64_buff := chan f64{cap: 100}   // buffered ("async"?)

	println('pass chan to fn')
	f_ch<int>(ch_int_unbuf)
	f_ch<f64>(ch_f64_buff)

	// push and pop from to/from channels
	// ch_int := chan int{}
	// ch_f64 := chan f64{}

	// ch_int <- 7
	// ch_f64 <- 1.1

	// mut n := 1.1
	// m := <- ch_int
	// n = <- ch_f64

	// println('pop from chan: $m $n')

	ch := chan int{}
	ch.close()

	v := <- ch or { println('error chan is closed: $err') }
	println(v)

	c1 := chan int{}
	c2 := chan f64{}
	c3 := chan int{}

	mut b := 0.0

	// select with timeout
	select {
		a := <- c1 {
			println('a: $a')
		}
		b = <- c2 {
			println('b: $b')
		}
		c3 <- 4 {
			println('sent to c3')
		}
		> 500 * time.millisecond {
			println('500 ms passed with no activity')
		}
	}

	// select expr with else branch
	c1.close()
	c2.close()
	c3.close()
	if select {
		b = <- c2 {
			println('from c2: $b')
		}
	} {
		println('chans are open')
	} else {
		println('chans are closed')
	}

	// chan object properties
	a := 2.2
	c_f64 := chan f64{}
	res := c_f64.try_push(a)
	println('res: $res, $c_f64.len, $c_f64.cap, $c_f64.closed')

	// chan try_pop
	mut abc := Abc{}
	c_abc := chan Abc{}
	res2 := c_abc.try_pop(abc)
	println('try_pop: $res2 $abc')

	// shared mutable state
	shared s := State{x: 2}
	rlock s {
		println('shared $s')
	}
	handle := go s.set_shared()
	handle.wait()	
	rlock s {
		println('shared modified $s')
	}
}
