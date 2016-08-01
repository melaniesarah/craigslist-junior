# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

CATEGORIES_LIST_FILENAME = 'db/fixtures/categories.txt'

Category.delete_all
Article.delete_all

File.foreach(CATEGORIES_LIST_FILENAME) do |line|
  Category.create(:name => line.chomp)
end

1000.times do
  Article.create( title: Faker::Commerce.product_name,
                  user_email: Faker::Internet.email,
                  description: Faker::StarWars.quote,
                  edit_url: Faker::Internet.url,
                  price: Faker::Commerce.price,
                  category_id: rand(1..39))
end

