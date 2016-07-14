# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# test data 



# assignments created by professor
Assignment.create(title: 'Assignment 1', description: 'Is the Ecological Footprint too simplistic?', description_2: 'How does the Ecological Footprint address waste flows?', description_3: 'Are there any standards set for Ecological Footprint assessments?', writer_due: '2018-01-01', promoter_due: '2018-02-28')
Assignment.create(title: 'Assignment 2', description: 'What concept in the chapter on speciation did you find most confusing?', description_2: 'What calculation was most difficult to understand from the ecology chapter?', description_3: 'What questions do you have regarding nutrient cycles?', writer_due: '2018-03-03', promoter_due: '2018-03-10')


#groups
Group.create(name: "Group 1")
Group.create(name: "Group 2")


# users
User.create(name: 'Maria Altebarmakian', email:'m.altebarmakian@brandeis.edu', password: '12345678', admin: 'true')
User.create(name: 'Anna Yatskar', email:'anyatskar@brandeis.edu', password: '12345678', admin: 'true')
User.create(name: 'Billy Bob', email: 'billybob@brandeis.edu', password: '12345678', admin: 'false') #id3
User.create(name: 'Jane Jean', email: 'janejean@brandeis.edu', password: '12345678', admin: 'false') #id4
User.create(name: 'Sally Sue', email: 'sallysue@brandeis.edu', password: '12345678', admin: 'false') #id5
User.create(name: 'Lola Lou', email: 'lolalou@brandeis.edu', password: '12345678', admin: 'false') #id6
User.create(name: 'Betty Bee', email: 'bettybee@brandeis.edu', password: '12345678', admin: 'false') #id7
User.create(name: 'John Jo', email: 'johnjo@brandeis.edu', password: '12345678', admin: 'false') #id8
User.create(name: 'Professor X', email:'professorx@brandeis.edu', password: '12345678', admin: 'true')



# questions written by users


#Assignment 1

Question.create(content: 'Can you explain the difference between a keystone species and an indicator species?', user_id: '3', assignment_id: '1', user_name: 'Billy Bob', description_flag: '1')
Question.create(content: 'I have not done the reading, sir, and so cannot comment on the prompt.', user_id: '3', assignment_id: '1', user_name: 'Billy Bob', description_flag: '2')
Question.create(content: 'Please forgive me for not having finished the unit.', user_id: '3', assignment_id: '1', user_name: 'Billy Bob', description_flag: '3')

Question.create(content: 'I do not understand what allopatric speciation means.', user_id: '4', assignment_id: '1', user_name: 'Jane Jean', description_flag: '1')
Question.create(content: 'What is biocapacity?', user_id: '4', assignment_id: '1', user_name: 'Jane Jean', description_flag: '2')
Question.create(content: 'What is overshoot?', user_id: '4', assignment_id: '1', user_name: 'Jane Jean', description_flag: '3')

Question.create(content: 'How does habitat fragmentation lead to speciation?', user_id: '5', assignment_id: '1', user_name: 'Sally Sue', description_flag: '1')
Question.create(content: 'What is a global hectare?', user_id: '5', assignment_id: '1', user_name: 'Sally Sue', description_flag: '2')
Question.create(content: 'How is Ecological Footprint calculated?', user_id: '5', assignment_id: '1', user_name: 'Sally Sue', description_flag: '3')

Question.create(content: 'How do bacteria create and release nitrogen into soil?', user_id: '7', assignment_id: '1', user_name: 'Betty Bee', description_flag: '1')
Question.create(content: 'Is bacteria involved in the carbon cycle? If so, how?', user_id: '7', assignment_id: '1', user_name: 'Betty Bee', description_flag: '2')

Question.create(content: 'How much of our resources are lost in the process of completing a nutrient cycle?', user_id: '8', assignment_id: '1', user_name: 'John Jo', description_flag: '1')




#Assignment 2

Question.create(content: 'What are abiotic and biotic factors that effect populations?', user_id: '3', assignment_id: '2', user_name: 'Billy Bob', description_flag: '1')
Question.create(content: 'Phosphates are lost in runoff. What is the most environmentally friendly way of regaining phosphorus in soil?', user_id: '3', assignment_id: '2', user_name: 'Billy Bob', description_flag: '2')

Question.create(content: 'Can habitat conservation efforts help biodiversity that has already been lost?', user_id: '6', assignment_id: '2', user_name: 'Lola Lou', description_flag: '1')
Question.create(content: 'What is the Water Footprint?', user_id: '6', assignment_id: '2', user_name: 'Lola Lou', description_flag: '2')
Question.create(content: 'How is the Water Footprint related to the Ecological Footprint?', user_id: '6', assignment_id: '2', user_name: 'Lola Lou', description_flag: '3')

Question.create(content: 'How does genetic pollution cause the extinction of a species?', user_id: '7', assignment_id: '2', user_name: 'Betty Bee', description_flag: '1')
Question.create(content: 'What is a biome?', user_id: '7', assignment_id: '2', user_name: 'Betty Bee', description_flag: '2')

Question.create(content: 'What is a yield factor?', user_id: '5', assignment_id: '2', user_name: 'Sally Sue', description_flag: '1')

Question.create(content: 'What is an ecosystem?', user_id: '8', assignment_id: '2', user_name: 'John Jo', description_flag: '1')

Question.create(content: 'How do CFCs affect nutrient cycles?', user_id: '4', assignment_id: '2', user_name: 'Jane Jean', description_flag: '1')
