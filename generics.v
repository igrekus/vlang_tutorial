// struct DB {}

// fn (d DB) query_one<T>(query string, id int) ?T {
// 	if 'User' in query {
// 		return User{id: 1, name: 'Bob'}
// 	}
// 	if 'Post' in query {
// 		return Post{id: 1, user_id: 1, title: 'new post', body: 'new post body'}
// 	}
// }

// struct Repo<T> {
// 	db DB
// }

// fn (r Repo<T>) find_by_id<T>(id int) ?T {
// 	table_name := T.name
// 	return r.db.query_one<T>('select * from $table_name where id = ?', id)
// }

// struct User {
// 	id int
// 	name string
// }

// fn (u User) str() string {
// 	return 'User($u.id, $u.name)'
// }

// struct Post {
// 	id int
// 	user_id int
// 	title string
// 	body string
// }

// fn (p Post) str() string {
// 	return 'Post($p.id, $p.title)'
// }

// fn new_repo<T>(db DB) Repo<T> {
// 	return Repo<T>{db: db}
// }

// fn new_db() DB {
// 	return DB{}
// }

// fn main() {
// 	db := new_db()
// 	users_repo := new_repo<User>(db)
// 	posts_repo := new_repo<Post>(db)

// 	user := users_repo.find_by_id<User>(1) or { return }
// 	post := posts_repo.find_by_id<Post>(1) or { return }

// 	println(user)
// 	println(post)
// }

fn compare<T>(a T, b T) int {
	if a < b {
		return -1
	} 
	if a > b {
		return 1
	}
	return 0
}

fn main() {
	println('generic compare ${compare(10, 9)}')
	println('generic compare ${compare(9.9, 9.99)}')
	println('generic compare ${compare("0", "0")}')
}
