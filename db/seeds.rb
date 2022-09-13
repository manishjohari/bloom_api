# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Currency.create([{ name: 'USD' }, { name: 'GBP' }, { name: 'EUR' }, { name: 'JOD' }, { name: 'JPY' }])

# Populate roles
#
Role.create!([{uid: 'admin', name: 'Admin'}])

# create admin
user = User.new(email: 'admin@example.com', password: 'foobar123')
user.role_id = Role.admin.id
user.save

# create user
user = User.new(email: 'user@example.com', password: 'foobar123')
user.save
