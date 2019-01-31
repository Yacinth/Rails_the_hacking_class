# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'


p "destroy database"
Course.destroy_all
Student.destroy_all
p "delete from sqlite_sequence"
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'courses'")
ActiveRecord::Base.connection.execute("DELETE from sqlite_sequence where name = 'students'")

10.times do 
  course = Course.create!(title: Faker::Job.key_skill, description: Faker::ChuckNorris.fact)
  p "course #{course.title}"
end

10.times do
  student = Student.create!(course_id: rand(1..10), name: Faker::Name.first_name)
  p "student #{student.name}"
end