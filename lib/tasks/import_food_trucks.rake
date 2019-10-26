task import_food_trucks: :environment do
  puts "starting the food truck import"

  food_truck_types = [
    'American',
    'Burgers',
    'Asian',
    'Mexican',
    'Pizza',
    'French',
    'Italian',
    'Cajun',
    'Southern',
    'Korean',
    'BBQ',
    'Greek',
    'Dessert',
    'Vegan',
    'Burgers',
    'Wings',
    'Chinese'
  ]

  food_truck_names_and_images = [
    {image_url: 'https://images.gotruckster.com/foodtruck/181/cover_photo/13239081_1010231079068466_6990279703237698283_n.jpg', name: 'abc'},
    {image_url: 'https://abc.com', name: 'abc'},
    {image_url: 'https://abc.com', name: 'abc'},
    {image_url: 'https://abc.com', name: 'abc'},
    {image_url: 'https://abc.com', name: 'abc'},
  ]

  price_ranges = ['$', '$$', '$$$', '$$$$']
  
  # Loop through each brewery and add a couple of randomized food trucks
  Brewery.all.each do |brewery|

    rand(1..2).times do |i|
      name_and_url = food_truck_names_and_images.sample
      food_truck = brewery.food_trucks.create!(
        name: name_and_url[:name],
        image_url: name_and_url[:image_url],
        food_truck_type: food_truck_types.sample,
        url: 'https://gotruckster.com/food-truck/the-orange-crunch',
        price_range: price_ranges.sample
      )

      puts "created #{food_truck.name}"
    end
  end
end
