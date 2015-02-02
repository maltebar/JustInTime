# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# test data 

Assignment.create(title: 'Testing', description: 'This is just a test', writer_due: '2015-03-01', promoter_due: '2015-04-01')

Group.create(name: "Group 1")
Group.create(name: "Group 2")

# users
User.create(name: 'Maria Altebarmakian', email:'m.altebarmakian@gmail.com', password: '12345678', admin: 'true')
User.create(name: 'Anna Yatskar', email:'anyatskar@gmail.com', password: '12345678', admin: 'true')
User.create(name: 'Billy Bob', email: 'billybob@gmail.com', password: '12345678', admin: 'false')
User.create(name: 'Jane Jean', email: 'janejean@gmail.com', password: '12345678', admin: 'false')
User.create(name: 'Sally Sue', email: 'sallysue@gmail.com', password: '12345678', admin: 'false')
User.create(name: 'Bonnie Parker', email: 'bonnieparker@gmail.com', password: '12345678', admin: 'false')
User.create(name: 'Clyde Barrow', email: 'clydebarrow@gmail.com', password: '12345678', admin: 'false')


Question.create(content: 'Test', user_id: '1', user_name: 'Billy Bob')
Question.create(content: 'Test', user_id: '2', user_name: 'Jane Jean')
Question.create(content: 'Test', user_id: '3', user_name: 'Sally Sue')
Question.create(content: 'Test', user_id: '4', user_name: 'Bonnie Parker')
Question.create(content: 'Test', user_id: '5', user_name: 'Clyde Barrow')

Question.create(content: 'Test', user_id: '1', user_name: 'Billy Bob')
Question.create(content: 'Test', user_id: '2', user_name: 'Jane Jean')
Question.create(content: 'Test', user_id: '3', user_name: 'Sally Sue')
Question.create(content: 'Test', user_id: '4', user_name: 'Bonnie Parker')
Question.create(content: 'Test', user_id: '5', user_name: 'Clyde Barrow')

