# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# test data

User.create!(name: 'Maria Altebarmakian', email:'m.altebarmakian@gmail.com', password: '12345678', admin: 'true')
User.create!(name: 'Anna Yatskar', email:'anyatskar@gmail.com', password: '12345678', admin: 'true')
User.create!(name: 'Billy Bob', email: 'billybob@gmail.com', password: '12345678', admin: 'false')
