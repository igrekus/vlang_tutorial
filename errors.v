struct User {
	id int
	name string
}

struct Repo {
	users []User
}

fn (r Repo) find_user_by_id(id int) ?User {
	for user in r.users {
		if user.id == id {
			return user
		}
	}
	return error('User $id not found')
}

fn (r Repo) propagate_err(id int) ?User {
	user := r.find_user_by_id(id)?
	return user
}

fn main() {
	repo := Repo{
		users: [User{1, 'Andrew'}, User{2, 'Bob'}, User{10, 'Charles'}]
	}
	user := repo.find_user_by_id(10) or {
		println(err)
		println(typeof(err).name)
		println(err.msg)
		return
	}
	println(user)

	u_prop := repo.propagate_err(1) or { 
		println('exit on propagated error')
		return 
	}
	println(u_prop)

	u_halt := repo.find_user_by_id(2) or {
		println('early halt on error')
		// exit()
		panic(err)
	}
	println(u_halt)

	u_def := repo.find_user_by_id(9) or {
		User{9, 'Default User'}
	}
	println('default value $u_def')

	if u_if := repo.find_user_by_id(2) {
		println(u_if)
	} else {
		println('If unwrapped error: $err')
	}
}
