class BeerTypesController < ApplicationController
  def index
    render json: Beer.all.order(:beer_type).map(&:beer_type).uniq
  end
end
