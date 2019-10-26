# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Create the new brewery
dbc = Brewery.create!(name: "Denver Beer Co", street: "4455 Jason St.", city: "Denver", state: "CO", zip_code: "80211", url: "http://denverbeerco.com/")
# Add beers to this new brewery
dbc.beers.create!(name: 'Princess Yum Yum', beer_type: 'Kolsch', beer_sub_type: 'Raspberry Kosch', abv: 4.8, ounces: 16, price: 6)
dbc.beers.create!(name: 'Pretzel Assassin', beer_type: 'Lager', beer_sub_type: 'Amber Lager', abv: 5.0, ounces: 16, price: 6)
dbc.beers.create!(name: 'Graham', beer_type: 'Lager', beer_sub_type: 'Amber Lager', abv: 5.0, ounces: 16, price: 6)

lhb = Brewery.create!(name: "Left Hand Brewing Co", street: "", city: "Longmont", state: "CO", zip_code: "", url: "http://lefthandbrewing.com/")
