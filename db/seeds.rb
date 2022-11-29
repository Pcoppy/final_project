# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require "faker"
require "nokogiri"

CATEGORY = ["Adventure", "Action", "Thriller", "Romance", "Biography"]
TAGS = %w[Fiction Non-Fiction Slow-Burn Medieval Gore Teenagers Religious Scholar Educational Tension Historic Sci-Fi Corporate War Jungle Forest Magic Animals Dragons Adults]
p "starting seed..."

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
pierre = User.create(email: "pcoppy@gmail.com", password: "123456", first_name: "Pierre", last_name: "Coppermann", username:"pcoppy", subscription: "premium")
pierre_producer = Producer.create(user_id: pierre.id, name: "Pierre Coppermann", company: "CoppermannProd", interests: "action,romance")
pierre_editor = Editor.create(user_id: pierre.id, phone_number: "+33 6 42 12 21 81", name: "Pierre Coppermann", address: "Paris", country: "France")
p "Pierre created"

p "creating Margot"
margot = User.create(email: "margot@gmail.com", password: "123456", first_name: "Margot", last_name: "Wilwertz", username:"margot", subscription: "regular")
margot_producer = Producer.create(user_id: margot.id, name: "Margot Wilwertz", company: "WilwertzProd", interests: "action,adventure")
margot_editor = Editor.create(user_id: margot.id, phone_number: "+33 6 79 17 84 90", name: "Margot Wilwertz", address: "Paris", country: "France")
p "Margot created"

p "creating Lea"
lea = User.create(email: "lea@gmail.com", password: "123456", first_name: "Lea", last_name: "Wehbe", username:"lea", subscription: "premium")
lea_editor = Editor.create(user_id: lea.id, phone_number: "+33 6 11 65 40 79", name: "Lea Wehbe", address: "Paris", country: "France")
lea_producer = Producer.create(user_id: lea.id, name: "Lea Whebe", company: "LeaProd", interests: "action,romance")
p "Lea created"

p "creating Simon"
simon = User.create(email: "simon@gmail.com", password: "123456", first_name: "Simon", last_name: "Bonnaventure", username:"simon", subscription: "premium")
simon_editor = Editor.create(user_id: simon.id, phone_number: "+33 7 81 75 83 29", name: "Simon Bonnaventure", address: "Paris", country: "France")
simon_producer = Producer.create(user_id: simon.id, name: "simon Bonnaventure", company: "SimonProd", interests: "thriller,romance")
p "Simon created"

p "creating Gaia"
gaia = User.create(email: "gaia@gmail.com", password: "123456", first_name: "gaia", last_name: "Gallarini", username:"gaia", subscription: "premium")
gaia_editor = Editor.create(user_id: gaia.id, phone_number: "+39 340 308 0681", name: "Gaia Gallarini", address: "Paris", country: "France")
gaia_producer = Producer.create(user_id: gaia.id, name: "Gaia Gallarini", company: "GaiaProd", interests: "adventure,biography")
p "gaia created"

p "creating Francesca"
francesca = User.create(email: "francesca@gmail.com", password: "123456", first_name: "Francesca", last_name: "Zaja", username:"francesca", subscription: "premium")
francesca_editor = Editor.create(user_id: francesca.id, phone_number: "+39 347 231 6402", name: "Francesca Zaja", address: "Paris", country: "France")
francesca_producer = Producer.create(user_id: francesca.id,  name: "Francesca Zaja", company: "FrancescaProd", interests: "adventure,biography")
p "Francesca created"

p "creating Philippine"
philippine = User.create(email: "philippine@gmail.com", password: "123456", first_name: "Philippine", last_name: "Lamy", username:"philippine", subscription: "premium")
philippine_editor = Editor.create(user_id: philippine.id, phone_number: "+33 6 51 20 44 07", name: "Philippine Lamy", address: "Paris", country: "France")
philippine_producer = Producer.create(user_id: philippine.id, name: "Philippine Lamy", company: "PhilippineProd", interests: "thriller,biography")
p "Philippine created"

p "creating Rachel"
rachel = User.create(email: "rachel@gmail.com", password: "123456", first_name: "Rachel", last_name: "Lamy", username:"rachel", subscription: "premium")
rachel_editor = Editor.create(user_id: rachel.id, phone_number: "+33 7 50 80 83 31", name: "Rachel Lamy", address: "Paris", country: "France")
rachel_producer = Producer.create(user_id: rachel.id, name: "Rachel Lamy", company: "Rachelprod", interests: "biography")
p "Rachel created"


p "giving birth to the authors..."
30.times do
  name = Faker::Name.name
  Author.create(first_name: name.split(' ')[0], last_name: name.split(' ').last, description:
  Faker::Quotes::Chiquito.sentence, user_id: User.ids.sample, full_name: name, approved: (rand(1..2) == 1))
end

p "writing the books..."
Author.all.each do |author|
  rand(1..10).times do
    tag_list = [TAGS.sample, TAGS.sample, TAGS.sample, TAGS.sample]
    Book.create(title: Faker::Book.title, publishing_year: rand(1900..2022), summary: Faker::Quotes::Shakespeare.hamlet_quote, genre: CATEGORY.sample, additionnal_description:
    Faker::Quotes::Shakespeare.king_richard_iii_quote, editor_id: Editor.ids.sample, tags: tag_list, author_id: author.id, approved: (rand(1..2) == 1))
  end
end

p "seed completed..."
