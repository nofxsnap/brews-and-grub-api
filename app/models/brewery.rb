class Brewery < ApplicationRecord
  has_many :beers

  def address
    [street, city, state, 'US'].compact.join(', ')
  end
end
