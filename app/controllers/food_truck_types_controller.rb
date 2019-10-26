class FoodTruckTypesController < ApplicationController
  def index
    render json: FoodTruck.all.order(:food_truck_type).map(&:food_truck_type).uniq
  end
end
