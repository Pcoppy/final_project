# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
p "Producers reset"
Producer.destroy_all
p "Editors reset"
Editor.destroy_all
p "Users reset"
User.destroy_all

pierre = User.create(email: "pcoppy@gmail.com", password: "123456", first_name: "Pierre", last_name: "Coppermann", username:"pcoppy", subscription: "none")
p "Users created"

pierre_producer = Producer.create(user_id: pierre.id, name: "Pierre Coppermann", company: "CoppermannProd", interests: "action,romance")
p "Producers created"

pierre_editor = Editor.create(user_id: pierre.id, name: "Pierre Coppermann", address: "Paris", country: "France")
p "Editors created"
