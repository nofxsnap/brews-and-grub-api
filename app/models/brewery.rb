class Brewery < ApplicationRecord
  has_many :beers
  has_many :food_trucks

  def address
    [street, city, state, 'US'].compact.join(', ')
  end
end
