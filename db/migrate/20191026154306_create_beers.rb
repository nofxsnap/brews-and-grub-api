class CreateBeers < ActiveRecord::Migration[5.2]
  def change
    create_table :beers do |t|
      t.string :name
      t.string :beer_type
      t.string :beer_sub_type
      t.decimal :ibu
      t.decimal :abv
      t.decimal :price
      t.integer :ounces

      t.timestamps
    end

    add_reference :beers, :brewery, foreign_key: true
  end
end
