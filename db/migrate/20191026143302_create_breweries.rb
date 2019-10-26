class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.string :street_address
      t.string :city
      t.string :zip_code
      t.string :state
      t.json :food
      t.string :url
      t.integer :stars

      t.timestamps
    end
  end
end
