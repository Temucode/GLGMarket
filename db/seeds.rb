# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb
require 'faker'
require "open-uri"

puts "Cleaning database..."
Product.destroy_all
User.destroy_all

images_seed = []

p "creating user"
user = User.create!(email: "test1@mail.com", password: "test123", name: "test", last_name: "teste", age: 32, address: "7 test 7657 test")

p "creating product"

images_seed =[ "https://picsum.photos/200/300",
              "https://picsum.photos/200",
              "https://picsum.photos/id/237/200/300",
              "https://picsum.photos/seed/picsum/200/300",
              "https://picsum.photos/200/300?grayscale",
              "https://picsum.photos/200/300/?blur",
              "https://picsum.photos/200/300/?blur=2",
              ]

10.times do
  file = URI.open(images_seed.sample)
  product = Product.create!(
                          name: Faker::Name.name,
                          description: Faker::Lorem.sentences(number: 1),
                          address: Faker::Address.full_address,
                          images: Faker::LoremFlickr.image,
                          price: Faker::Number.between(from: 1, to: 100),
                          user_id: user.id
                          )
  product.image.attach(io: file, filename: "nes.png", content_type: "image/png")
  puts "1 product created"
end
puts 'Finished!'
