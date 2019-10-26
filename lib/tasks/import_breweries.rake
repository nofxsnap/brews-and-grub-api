task import_breweries: :environment do
    puts "starting the brewery import"
    # connect to yelp api
    binding.pry
    response = RestClient.get 'https://api.yelp.com/v3/businesses/search?location=Denver&categories=breweries&limit=50', {:Authorization => 'Bearer vNd5LMpVGFOiWtlEqMHGm5Xj7QCETUvrJD0716g07E2sbEa3-iZRlMxBXskf9-1P_3Gtk7U5B8fg3g-p600Imo3hpu4tEApyrJ_-RJet0Yci-zBpJLZg8feCPGK0XXYx'}
    binding.pry
    businesses = JSON.parse(response.body)['businesses']

end
