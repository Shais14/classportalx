# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
User.create(name: 'Saitama', email: "admin@boss.com", password_digest: User.digest("admin"), type: "SuperAdmin")
User.create(name: 'Saitama', email: "admin@ncsu.edu", password_digest: User.digest("admin"), type: "Admin")
User.create(name: 'Dr. Smith', email: "smith@ncsu.edu", password_digest: User.digest("smith"), type: "Instructor")
User.create(name: 'Bob', email: "bob@ncsu.edu", password_digest: User.digest("bob"), type: "Student")