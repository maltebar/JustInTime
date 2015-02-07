# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# test data 

# 

Assignment.create(title: 'Assignment 1', description: 'Test.', writer_due: '2015-03-01', promoter_due: '2015-04-01')
Assignment.create(title: 'Assignment 2', description: 'Testing.', writer_due: '2015-04-02', promoter_due: '2015-04-09')
Assignment.create(title: 'Assignment 3', description: 'Still Testing.', writer_due: '2015-04-10', promoter_due: '2015-04-21')

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

# questions written by users
Question.create(content: 'Q1', user_id: '1', assignment_id: '1', user_name: 'Billy Bob')
Question.create(content: 'Q2', user_id: '2', assignment_id: '1', user_name: 'Jane Jean')
Question.create(content: 'Q3', user_id: '3', assignment_id: '1', user_name: 'Sally Sue')
Question.create(content: 'Q4', user_id: '4', assignment_id: '1', user_name: 'Bonnie Parker')
Question.create(content: 'Q5', user_id: '5', assignment_id: '1', user_name: 'Clyde Barrow')


