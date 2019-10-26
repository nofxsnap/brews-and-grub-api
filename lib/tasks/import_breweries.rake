task import_breweries: :environment do
    puts "starting the brewery import"
    
    beer_types = [
      'IPA',
      'Lager',
      'Amber'
    ]

    # connect to yelp api
    response = RestClient.get 'https://api.yelp.com/v3/businesses/search?location=Denver&categories=breweries&limit=50', {:Authorization => 'Bearer vNd5LMpVGFOiWtlEqMHGm5Xj7QCETUvrJD0716g07E2sbEa3-iZRlMxBXskf9-1P_3Gtk7U5B8fg3g-p600Imo3hpu4tEApyrJ_-RJet0Yci-zBpJLZg8feCPGK0XXYx'}
    businesses = JSON.parse(response.body)['businesses']

    # loop through each business and create breweries
    businesses.each do |business|
        brewery = Brewery.create!(
            name: business['name'], 
            street: business['location']['address1'] , 
            city: business['location']['city'], 
            state: business['location']['state'], 
            zip_code: business['location']['zip_code'], 
            url: business['url'],
            review_count: business['review_count'],
            rating: business['rating'],
            price_range: business['price'],
            display_phone: business['display_phone'],
            latitude: business['coordinates']['latitude'],
            longitude: business['coordinates']['longitude'],
            image_url: business['image_url']
        )
        puts "created #{brewery.name}"

        rand(5..10).times do |i|
          beer = brewery.beers.create!(
            name: "Beer #{i}", 
            beer_type: beer_types.sample, 
            beer_sub_type: beer_types.sample, 
            ounces: 16, 
            ibu: rand(70..100), 
            abv: rand(4..12),
            price: rand(4..8)
          )
          puts "created #{beer.name}"
        end
    end

end
