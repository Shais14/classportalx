# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
User.create(name: 'Saitama', email: "admin@boss.com", password_digest: User.digest("admin"), type: "SuperAdmin")
User.create(name: 'Goku', email: "student@notboss.com", password_digest: User.digest("student"), type: "Student")
User.create(name: 'king kai', email: "instructor@semiboss.com", password_digest: User.digest("instructor"), type: "Instructor")
