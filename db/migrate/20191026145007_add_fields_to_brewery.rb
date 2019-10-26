class AddFieldsToBrewery < ActiveRecord::Migration[5.2]
  def change
    add_column :breweries, :price_range, :integer
    add_column :breweries, :beers, :json
  end
end
