# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"

GENRES = ["adventure", "action", "thriller", "romance", "biography"]

View.destroy_all
p "Views destroyed"
Book.destroy_all
p "Books destroyed"
Author.destroy_all
p "Authors destroyed"
Producer.destroy_all
p "Producers destroyed"
Editor.destroy_all
p "Editors destroyed"
User.destroy_all
p "Users destroyed"

p "creating Pierre"
pierre = User.create(email: "pcoppy@gmail.com", password: "123456", first_name: "Pierre", last_name: "Coppermann", username:"pcoppy", subscription: "none")
pierre_producer = Producer.create(user_id: pierre.id, name: "Pierre Coppermann", company: "CoppermannProd", interests: "action,romance")
pierre_editor = Editor.create(user_id: pierre.id, name: "Pierre Coppermann", address: "Paris", country: "France")
p "Pierre created"

p "creating Margot"
margot = User.create(email: "margot@gmail.com", password: "123456", first_name: "Margot", last_name: "Wilwertz", username:"margot", subscription: "none")
margot_producer = Producer.create(user_id: margot.id, name: "Margot Wilwertz", company: "WilwertzProd", interests: "action,adventure")
margot_editor = Editor.create(user_id: margot.id, name: "Margot Wilwertz", address: "Paris", country: "France")
p "Margot created"

p "giving birth to the authors..."
10.times do
  Author.create(first_name: Faker::Name.name.split(' ')[0], last_name: Faker::Name.name.split(' ')[1], description:
  Faker::Quotes::Chiquito.sentence, user_id: User.ids.sample)
end

p "writing the books..."
Author.all.each do |author|
  rand(1..10).times do
    Book.create(title: "Faker::Book.title", publishing_year: rand(1900..2022), summary: Faker::Quotes::Shakespeare.hamlet_quote, genre: "tbd", additionnal_description:
    Faker::Quotes::Shakespeare.king_richard_iii_quote, editor_id: Editor.ids.sample, author_id: author.id)
  end
end

p "adding some views"
Book.all.each do |book|
  rand(1..100).times do
    View.create(book_id: book.id, producer_id: Producer.ids.sample)
  end
end
p "seed completed..."
