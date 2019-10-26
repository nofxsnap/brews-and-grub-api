class Beer < ApplicationRecord
  belongs_to :brewery


  def full_beer_name
    "#{name} #{beer_sub_type} #{beer_type}"
  end
end
