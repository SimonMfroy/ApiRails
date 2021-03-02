# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database..."
Article.destroy_all
User.destroy_all


30.times do
  user = User.new(
    email:    Faker::Internet.email,
    password: '123456'
  )
  user.save!
end

tp User.all

puts 'Creating 30 fake articles...'


30.times do
  article = Article.new(
    title:    Faker::Movie.title,
    user_id: User.all.sample.id,
    content: Faker::Movie.quote
  )
  article.save!
end

puts 'Finished!'

puts ""
puts ""

tp Article.all