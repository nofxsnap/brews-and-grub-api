# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Brewery.create!(name: "Denver Beer Co", street: "4455 Jason St.", city: "Denver", state: "CO", zip_code: "80211", url: "http://denverbeerco.com/")
Brewery.create!(name: "Left Hand Brewing Co", street: "", city: "Longmont", state: "CO", zip_code: "", url: "http://lefthandbrewing.com/")
