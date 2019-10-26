task import_breweries: :environment do
    puts "starting the brewery import"
    
    beer_names = ['Citra Ass Down', 'Tactical Nuclear Penguin',
    'Barbarian Streisand','The Great, Big Kentucky Sausage Fest',
    'Audrey Hopburn', 'Hoppy Ending', 'Tart Side of the Moon', 
    'Trump Hands', 'Geriatric Hipster Club', 'Ryan and the Gosling', 
    'Gandhi-Bot', 'Pathological Lager', 'Polygamy Porter','Hoptimus Prime',
    'Monty Python’s Holy (Gr)Ail', 'Yellow Snow', 'Blitzkrieg Hops', 
    'Hauling Oats', 'Circum Session', 'Kilt Lifter', 'Smooth Hoperator', 
    'Stupid Sexy Flanders', 'Hoppy Ending', 'Arrogant Bastard', 'Blind Pig',
    'Brew Free! or Die', 'Duck Duck Gooze', 'Hop Zombie', 'Yeastus Christ',
    'Leafer Madness', 'Barrique Okarma', 'Hibernation', 'Bad Elf', 
    'Sexual Chocolate Imperial Stout', 'Beard of Zeus', 
    'Get Down', "Mothers Lil' Helper", 'Good Chit Pilsner', 
    'Dead Guy Ale', 'Tramp Stamp', 'Moose Knuckle ', 'Soft Dookie', 'Belligerent Ass',
    'Rat Tail', 'Golden Shower', 'Ten-Fiddy', 'Old Chub', 'Old Leghumper', 'Old Ringworm', 
    'Parking Violation', 'Effinguud', 'Brother Thelonius', 'Puppy’s Breath Porter', 
    'Panty Peeler', 'Druid Fluid', 'Dragonslayer', 'Collaboration Not Litigation', 
    'Crazy Ivan', 'Vanilla Ice', 'Vampire Blood', 'Evil Dead', ' Baron Von Awesome',
    'Blithering Idiot', 'Substance Abuse', 'The Dude’s Oat Soda', 'Badonk-A-Dunkel', 
    'Smells Like Weed', 'Donkey Punch', 'Nut Sack', 
    'Up Up Down Down Left Right Left Right BA Select' ]

    beer_descriptors = ['American','Adventurous','Award-winning','Balanced','Best',
    'Big','Bitter','Bold','Bottle-conditioned','Bright','Cask-conditioned','Classic',
    'Clean','Limited','Lively','Lush','Malty','Mellow','Natural','Organic','Original',
    'Pale','Drinkable',,'Dry','Dry-hopped','Elastic','Elegant','Exceptional',
    'Exotic','Famous','Favorite','Flavorful','Flawless','Floral','Fresh', 'Frothy',
    'Full','Full-flavored','Handcrafted','Pioneer','Premium','Strong','Sturdy','Superior',
    'The Original','Thick','Traditional','Unfiltered','Unforgettable','Unique','Velvety',
    'Vibrant','Well-balanced']

    beer_types = [
      'Amber Ale','Barley Wine','Berliner Weisse','Bière de Garde','Blonde Ale','Bock',
      'Brown Ale','California Common','Cream Ale','Dortmunder Export','Doppelbock',
      'Dunkel','Dunkelweizen','Eisbock','Flanders Red Ale','Summer Ale','Gose',
      'Gueuze','Hefeweizen','Helles','India Pale Ale','Kolsch','Lambic','Light Ale',
      'Maibock','Malt liquor','Oktoberfest','Old Ale','Oud Bruin','Pale Ale','Pilsener ',
      'Porter','Red ale','Roggenbier','Saison','Scotch Ale','Stout','Schwarzbier',
      'Vienna Lager','Witbier']

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
          name: beer_names.sample, 
          beer_sub_type: beer_descriptors.sample, 
          beer_type: beer_types.sample, 
          ounces: 16, 
          ibu: rand(70..100), 
          abv: rand(4..12),
          price: rand(4..8)
        )
        puts "created #{beer.name}"
      end
    end
end
