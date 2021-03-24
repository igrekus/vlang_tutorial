import math
import time

fn print_pith(a f64, b f64) {
	c := math.sqrt(a * a + b * b)
	println('print_pith: $c')
}

fn pith(a f64, b f64) f64 {
	return math.sqrt(a * a + b * b)
}

fn task(id int, duration int) {
	println('start task $id')
	time.sleep(duration * time.millisecond)
	println('end task $id duration $duration')
}

fn compute(i int) int {
	return i * i
}

fn main () {
	coro := go print_pith(3, 4)   // runs in parallel thread, finishes afther main() if no awaited
	coro.wait()   // awaits parallel thread

	handle := go pith(54.06, 2.08)
	res1 := pith(2.32, 16.74)
	res2 := handle.wait()
	println('results: $res1 $res2')

	mut ts := []thread{}
	ts << go task(1, 500)
	ts << go task(2, 900)
	ts << go task(3, 300)
	ts.wait()
	println('all done')

	mut int_ts := []thread int{}
	for i in 1 .. 10 {
		int_ts << go compute(i)
	}
	r := int_ts.wait()
	println('All finished: $r')

	
}
