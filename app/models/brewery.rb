class Brewery < ApplicationRecord
  geocoded_by :address
  after_validation :geocode
  has_many :beers

  def address
    [street, city, state, 'US'].compact.join(', ')
  end
end
