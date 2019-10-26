class CreateBreweries < ActiveRecord::Migration[5.2]
  def change
    create_table :breweries do |t|
      t.string :name
      t.decimal :latitude
      t.decimal :longitude
      t.string :street
      t.string :city
      t.string :zip_code
      t.string :state
      t.string :image_url
      t.integer :price_range
      t.json :food
      t.string :url
      t.decimal :rating
      t.integer :review_count
      t.string :price_range
      t.string :display_phone

      t.timestamps
    end
  end
end
