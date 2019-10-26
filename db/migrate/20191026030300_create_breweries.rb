class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.string :url
      t.json :beerlist
      t.json :food
      t.decimal :lat
      t.decimal :lng
    end
  end
end
