class CreateFoodTrucks < ActiveRecord::Migration[5.2]
  def change
    create_table :food_trucks do |t|
      t.string :name
      t.string :food_truck_type
      t.string :url
      t.string :image_url
      t.string :price_range
      t.json :menu

      t.timestamps
    end

    add_reference :food_trucks, :brewery, foreign_key: true
  end
end
