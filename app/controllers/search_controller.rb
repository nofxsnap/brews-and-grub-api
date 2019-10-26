class SearchController < ApplicationController
  def index
    # params[:lat]
    # params[:lng]
    render json: build_brew_and_food_response
  end

  private

  def build_brew_and_food_response
    filtered_breweries = []
    if params[:beer].present? && params[:food].present?
      filtered_breweries = Brewery.
        joins(:beers).
        joins(:food_trucks).
        where(beers: { beer_type: params[:beer] }).
        where(food_trucks: { food_truck_type: params[:food] })
      filtered_breweries = build_array_of_brews_and_food(filtered_breweries)
    end
    filtered_breweries
  end

  def build_array_of_brews_and_food(filtered_breweries)
    brews_and_food = []
    filtered_breweries.each do |brewery|
      brews_and_food << {
        brewery: brewery,
        beers: brewery.beers,
        food_truck: brewery.food_trucks.where(food_truck_type: params[:food]).first
      }
    end
    brews_and_food
  end
end
