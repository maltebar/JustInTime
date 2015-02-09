# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# test data 

# assignments created by professor
Assignment.create(title: 'Assignment 1', description: 'What section number of chapter 1 did you find most confusing?', writer_due: '2015-03-03', promoter_due: '2015-03-10')
Assignment.create(title: 'Assignment 2', description: "?????????", writer_due: '2015-01-01', promoter_due: '2015-02-20')

Group.create(name: "Group 1")
Group.create(name: "Group 2")

# users
User.create(name: 'Maria Altebarmakian', email:'m.altebarmakian@gmail.com', password: '12345678', admin: 'true')
User.create(name: 'Anna Yatskar', email:'anyatskar@gmail.com', password: '12345678', admin: 'true')
User.create(name: 'Billy Bob', email: 'billybob@gmail.com', password: '12345678', admin: 'false') #id3
User.create(name: 'Jane Jean', email: 'janejean@gmail.com', password: '12345678', admin: 'false') #id4
User.create(name: 'Sally Sue', email: 'sallysue@gmail.com', password: '12345678', admin: 'false') #id5
User.create(name: 'Lola Lou', email: 'lolalou@gmail.com', password: '12345678', admin: 'false') #id6
User.create(name: 'Betty Bee', email: 'bettybee@gmail.com', password: '12345678', admin: 'false') #id7
User.create(name: 'John Jo', email: 'johnjo@gmail.com', password: '12345678', admin: 'false') #id8



# questions written by users
Question.create(content: 'Q1', user_id: '3', assignment_id: '1', user_name: 'Billy Bob')
Question.create(content: 'Q2', user_id: '4', assignment_id: '1', user_name: 'Jane Jean')
Question.create(content: 'Q3', user_id: '5', assignment_id: '1', user_name: 'Sally Sue')
Question.create(content: 'Q4', user_id: '6', assignment_id: '2', user_name: 'Lola Lou')
Question.create(content: 'Q5', user_id: '7', assignment_id: '2', user_name: 'Betty Bee')
Question.create(content: 'Q6', user_id: '8', assignment_id: '2', user_name: 'John Jo')
