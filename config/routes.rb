Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :beers, only: [:index]
  resources :beer_types, only: [:index]
  resources :food_truck_types, only: [:index]
  resources :search, only: [:index]
end
