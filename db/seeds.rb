# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

City.destroy_all
Tag.destroy_all
PrivateMessage.destroy_all
User.destroy_all
Gossip.destroy_all
TagGossip.destroy_all

# seed for city
10.times do
  City.create!(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip
  )
end

# seed for user
10.times do
  User.create!(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.sentence,
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 18, to: 50),
    city_id: City.all.sample.id
  )
end

# seed for gossip
10.times do
  Gossip.create!(
    title: Faker::Lorem.sentence(word_count: 3),
    content: Faker::Lorem.paragraph(sentence_count: 2),
    user_id: User.all.sample.id
  )
end

# seed for tags
10.times do
  Tag.create!(
    title: Faker::Lorem.word
  )
end


# seed for private messages
10.times do
  PrivateMessage.create!(
    content: Faker::Lorem.sentence
  )
end

# seed for tag_gossip
10.times do
  TagGossip.create!(
    tag_id: Tag.all.sample.id,
    gossip_id: Gossip.all.sample.id
  )
end