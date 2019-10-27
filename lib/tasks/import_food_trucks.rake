task import_food_trucks: :environment do
  puts "starting the food truck import"

  food_truck_names_and_images = [
    {name:'The Orange Crunch', type: 'Chinese', image_url: 'https://images.gotruckster.com/foodtruck/181/cover_photo/13239081_1010231079068466_6990279703237698283_n.jpg'},
    {name:'Smokestack 70', type: 'BBQ', image_url: 'https://static.wixstatic.com/media/6b1933_644f706e68e64663b0175c370e074211~mv2.jpeg/v1/fill/w_600,h_400,al_c,lg_1,q_90/6b1933_644f706e68e64663b0175c370e074211~mv2.webp'},
    {name:"Mac 'N Noodles", type: 'American', image_url: 'https://images.gotruckster.com/foodtruck/97/cover_photo/30424987_1977456729186585_8467788760504582094_o.jpg'},
    {name:'The Crock Spot',  type: 'American', image_url: 'https://static.wixstatic.com/media/6b1933_cf512682fad74396b8316df6a8cf1b94~mv2.jpg/v1/fill/w_658,h_420,al_c,lg_1,q_90/6b1933_cf512682fad74396b8316df6a8cf1b94~mv2.webp'},
    {name:'Mile High Cajun', type: 'Cajun', image_url: 'https://images.gotruckster.com/foodtruck/109/cover_photo/28516370_591219247878230_1935598977848921165_o.jpg'},
    {name:'Taco Choi', type: 'Mexican', image_url: 'https://images.gotruckster.com/foodtruck/cover_photos/3GcYVi6WsJOs12nA73X86J4TNqwmGeqGl4MwLo6b.jpeg'},
    {name:"El Jefe's Smothered Brats and Tots", type: 'Vegan', image_url: 'https://gotruckster.com/food-truck/el-jefes-smothered-brats-and-tots'},
    {name:'The Cravings Truck', type: 'Multi-Cusine', image_url: 'https://images.gotruckster.com/foodtruck/215/cover_photo/17203111_614371268763615_5207804175071693104_n.jpg'},
    {name:'Latin Roots', type: 'Mexican', image_url: 'https://images.gotruckster.com/foodtruck/cover_photos/LqQSFwNUlExI0rIrFp8s73a4imZGIo29vDpXFzso.jpeg'},
    {name:'Farm to Truck', type: 'American', image_url: 'https://images.gotruckster.com/foodtruck/61/cover_photo/22549519_1476101179103677_7674106645528635186_n.jpg'},
    {name:'The Southern Straw', type: 'Southern', image_url: 'https://images.gotruckster.com/foodtruck/750/cover_photo/59991617_1168988903263191_4945211154042454016_o.jpg'},
    {name:'What Would Cheesus Do', type: 'American', image_url: 'https://images.gotruckster.com/foodtruck/482/cover_photo/35268138_614226558933517_1041486795700699136_o.jpg'},
    {name:'Original By Greeks', type: 'Greek', image_url: 'https://images.gotruckster.com/foodtruck/123/cover_photo/29186652_419195188509673_1286758320547299328_o.jpg'},
    {name:'Wheels on Fire', type: 'Pizza', image_url: 'https://images.gotruckster.com/foodtruck/200/cover_photo/20994254_1607517269320471_7850592898323504652_n.jpg'},
    {name:"Tilford's Wood Fired Pizza", type: 'Pizza', image_url: 'https://images.gotruckster.com/foodtruck/403/cover_photo/14242434_1816192995284002_5158992108393266622_o.jpg'},
    {name:'Stokes Poke', type: 'Multi-Cusine', image_url: 'https://images.gotruckster.com/foodtruck/578/cover_photo/Stokes.jpg'},
    {name:'Rocky Mountain Snowflakes', type: 'Dessert', image_url: 'https://images.gotruckster.com/foodtruck/603/cover_photo/Rocky%20Mtn%20Snowflakes.jpg'},
    {name:'Cilantro & Perejil', type: 'Mexican', image_url: 'https://images.gotruckster.com/foodtruck/645/cover_photo/33868383_205624510053312_4249019529708961792_o.jpg'},
    {name:'Hop and Hoe', type: 'Multi-Cusine', image_url: 'https://images.gotruckster.com/foodtruck/697/cover_photo/HopHoeGold-300x300.png'},
    {name:"Smokin' Bones BBQ", type: 'BBQ', image_url: 'https://images.gotruckster.com/foodtruck/701/cover_photo/cropped-characature_2000.png'},
    {name:'Tacos el Sabroso', type: 'Mexican', image_url: 'https://images.gotruckster.com/foodtruck/cover_photos/tc48pEPZfkRehfi2rlEGUFIzufQ3UF.jpeg'},
    {name:'The Veggie Whisperer', type: 'Vegan', image_url: 'https://images.gotruckster.com/foodtruck/709/cover_photo/46972240_322231998505183_1204144061968023552_o.jpg'},
    {name:'Koi & Ninja', type: 'Asian', image_url: 'https://images.gotruckster.com/foodtruck/488/cover_photo/30127311_161762471154934_1579290715478000192_n.jpg'},
    {name:'Radical Sasquatch Dumpling Company', type: 'Multi-Cusine', image_url: 'https://images.gotruckster.com/foodtruck/135/cover_photo/18815078_639529169570033_5481369509694401516_o.jpg'},
    {name:'The Bamboo Skewer', type: 'Asian', image_url: 'https://images.gotruckster.com/foodtruck/170/cover_photo/41KDx0cv8z3aHhEh012BUtMahIvamo.jpeg'},
    {name:'Simply Le Crepes', type: 'French', image_url: 'https://images.gotruckster.com/foodtruck/cover_photos/JVIeQMTmhpLOahAg8jdGmWmOmyWGTS.jpeg'},
    {name:'Rolling Dough', type: 'Pizza', image_url: 'https://images.gotruckster.com/foodtruck/143/cover_photo/14317435_531776913686923_8215721421359247704_n.png'},
    {name:'Mukja', type: 'Asian', image_url: 'https://images.gotruckster.com/foodtruck/cover_photos/Kjsb8TBfy9Fv4nnHbZO8deHi4pq4S9sD5USVu3Wo.jpeg'},
    {name:'Fajita Junction/The Dog Haus', type: 'Mexican', image_url: 'https://images.gotruckster.com/foodtruck/572/cover_photo/13131770_1727585304152310_2034030704552543670_o.jpg'},
    {name:'True West Tacos', type: 'Mexican', image_url: 'https://images.gotruckster.com/foodtruck/194/cover_photo/18527206_1177998688996284_4589565186935507210_o.jpg'},
    {name:'The Burger Bus', type: 'Burgers', image_url: 'https://images.gotruckster.com/foodtruck/cover_photos/iyUO7LK2dtqLkWZjD6TjqLcya9gcYjtmXeHz3OoS.jpeg'},
    {name:'Moontime Crepes', type: 'French', image_url: 'https://images.gotruckster.com/foodtruck/114/cover_photo/FcVDsn1wXQBp88tnJOlbS5x4zUOxTM.jpeg'},
    {name:'Stella Blue', type: 'Multi-Cusine', image_url: 'https://images.gotruckster.com/foodtruck/160/cover_photo/22553076_1882943885368006_8560500652380309361_o.jpg'}
  ]

  price_ranges = ['$', '$$', '$$$', '$$$$']
  
  # Loop through each brewery and add a couple of randomized food trucks
  Brewery.all.each do |brewery|

    rand(1..2).times do |i|
      name_and_url = food_truck_names_and_images.sample
      food_truck = brewery.food_trucks.create!(
        name: name_and_url[:name],
        image_url: name_and_url[:image_url],
        food_truck_type: name_and_url[:type],
        url: 'https://gotruckster.com/food-truck/the-orange-crunch',
        price_range: price_ranges.sample
      )

      puts "created #{food_truck.name}"
    end
  end
end
