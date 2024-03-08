# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Activity.destroy_all
Group.destroy_all
User.destroy_all

  Activity.create!([
    {
    title: "Canal Run Angel to Primrose Hill",
    description: "Join us Saturday at 10:30am for a casual run along the Regents Canal, approx 9km. We head to the top of Primrose Hill and back through Regents Park finishing at Granary Square, Kings Cross. Or if you’re looking for something shorter you can turn around at any point, Camden Market or the top of Primrose Hill are good options.

    We will start and meet in front of the entrance to the Regent's canal (entrance is on Muriel Street). Coffee afterwards for those interested.",
    frequency: "weekly",
    date: Date.new(2024, 3, 9),
    start_time: '10:30',
    end_time: '13:30',
    area: 'Angel',
    address: "Regent's Canal, London",
    tags: "health, running, morning, exercise, athletics, sports, social",
    lat: 51.5323,
    lng: -0.1064,
    price: "Free",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/angel-islington-running-group/events/299271105/"
  },
  {
    title: "Thursday 5km run followed by pub drinks",
    description: "Please join us for our weekly run and social - a great (free!) way to meet new people!
    We meet at 7pm at the entrance to Highbury Fields outside Harvest N5.
    We run 5km at an easy pace (about 6 mins per km), often 3 loops around Highbury Fields but we do change up the route from time to time.
    After the run, we will head to the House of Hammerton pub for some drinks.",
    frequency: "weekly",
    date: Date.new(2024, 3, 14),
    start_time: '19:00',
    end_time: '21:00',
    area: 'Highbury',
    address: "Highbury Fields, Highbury Crescent · London",
    tags: "health, running, evening, exercise, athletics, sports, social",
    lat: 51.5492,
    lng: -0.1030,
    price: "Free",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/angel-islington-running-group/events/299271105/"
  },
  {
    title: "Nomadic Coffee - Cowork",
    description: "Hey nomads!
    Come join us every Tuesday and Thursday at 4:30pm at our Cowork Space to eat some snacks, drink some coffee and connect!
    Ps.: The event is exclusive for cowork users.",
    frequency: "quarterly",
    date: Date.new(2024, 4, 16),
    start_time: '16:30',
    end_time: '18:30',
    area: 'Shoreditch',
    address: "CoBalance, 130 Shoreditch High St ",
    tags: "community, coffee, social, evening, work, networking",
    lat: 51.5264,
    lng: -0.0786,
    price: "Free",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/selina-secret-garden-community/events/299384962/"
  },
  {
    title: "Friday Climb and Cheeky Drink",
    description: "Welcome to the London Rock Climbers Castle meet up! LRC is a social climbing group and this meet up is a great way for new members to meet the group and for everyone to catch up, have a good chat, and climb together without the time pressures of the mid-week climbs.

    We meet at 6.45 pm in the upstairs seating area opposite the lead walls (the old Café for anyone who remembers). Look out for our black “London Rock Climbers” T-shirts. The same t-shirts will help you locate us inside the Castle if you are running late.

    We climb until the Castle closes at 10pm or we get tired (about 9pm or 7pm in extreme cases…) and are ready to celebrate the end of the week with a drink and/or dinner at the Brownswood pub (271 Green Lanes, N4 2EX)",
    frequency: "quarterly",
    date: Date.new(2024, 3, 20),
    start_time: '19:00',
    end_time: '23:00',
    area: 'Stoke Newington',
    address: "The Castle Climbing Centre, Green Lanes, Stoke Newington · London N4 2HA",
    tags: "health, climbing, evening, exercise, athletic, sports, social",
    lat: 51.5643,
    lng: -0.0923,
    price: "5",
    people: "20+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/thelrc/events/299261700/" },
  {
    title: "Islington Farmers' Market",
    description: "Sunday market with stands offering locally sourced vegetables & meats, plus some prepared foods.",
    frequency: "weekly",
    date: Date.new(2024, 3, 10),
    start_time: '10:00',
    end_time: '14:00',
    area: 'Islington',
    address: "Chapel Market, London N1 9PZ",
    tags: "food, community, shopping, social, farmers market, vegetables, meat, prepared foods",
    lat: 51.5334,
    lng: -0.1113,
    price: "Free",
    people: "20+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.lfm.org.uk/markets/islington/"
  },
  {
    title: "Surrealist Book Club: Hard-Boiled Wonderland & the End of the World, by Murakami",
    description: "The March 2024 edition of Surrealist Book Club - with Hard-Boiled Wonderland & the End of the World, by Haruki Murakami.
    A narrative particle accelerator that zooms between Wild Turkey Whiskey and Bob Dylan, unicorn skulls and voracious librarians, John Coltrane and Lord Jim. Science fiction, detective story and post-modern manifesto all rolled into one rip-roaring novel, Hard-boiled Wonderland and the End of the World is the tour de force that expanded Haruki Murakami's international following.
    Tracking one man's descent into the Kafkaesque underworld of contemporary Tokyo, Murakami unites East and West, tragedy and farce, compassion and detachment, slang and philosophy.",
    frequency: "weekly",
    date: Date.new(2024, 3, 14),
    start_time: '10:00',
    end_time: '12:00',
    area: 'Islington',
    address: "Chapel Market, London N1 9PZ",
    tags: "reading, book club, literature, social, community, discussion, books, reading group",
    lat: 51.5344,
    lng: -0.1063,
    price: "2",
    people: "8+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/surrealist-book-club/events/298890983/"
  },
  {
    title: "Parthian Wandsworth Social Climb",
    description: "Come and join us at South London's newest climbing gym every Thursday. Parthian Wandsworth has rope climbing (top rope and lead) and 300+ boulder problems spread across the second floor, which will also feature the 2024 Paris Olympic Boulder wall The Titan! Also, if you show you are signed up to the Meet Up the single price entry is £12, 10% off items in the shop, 10% off hot drinks and food, and the Friday promo will be applied on Thursday for LRC: Pizza and beer £12",
    frequency: "weekly",
    date: Date.new(2024, 3, 9),
    start_time: '19:00',
    end_time: '22:00',
    area: 'Wandsworth',
    address: "Parthian Climbing, 52 - 58 Garratt Lane · LondonParthian Climbing",
    tags: "health, climbing, evening, exercise, athletic, sports, social",
    lat: 51.4549,
    lng: -0.1927,
    price: "12",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/thelrc/events/299359092/"
  },
  {
    title: "HIKE 21km Marlow - the Woods, Villages and Islands of the rural Thames",
    description: "A great rural hiking escape and a chance to see the River Thames as most Londoners haven't - tranquil and meandering through lush countryside away from London. Home to ducks and swans, settled in a gorgeous woodland, meadow and countrified landscape with picturesque riverside cottages, ancient villages, overhanging Weeping Willow trees, locks and a dramatic 200m footbridge across the river Thames, let us show you the rural Thames.
    This whole area of the Chiltern Hills was designated in 1965 as an official Area of Outstanding Natural Beauty to recognise and protect its picturesque beauty.",
    frequency: "weekly",
    date: Date.new(2024, 3, 10),
    start_time: '08:00',
    end_time: '18:00',
    area: 'Paddington',
    address: "Paddington Rail Station, Praed St, Paddington, London W2 1EE, UK",
    tags: "hiking, rural, countryside, social, community, day trip, Thames, morning, weekend",
    lat: 51.5191,
    lng: -0.1702,
    price: "30",
    people: "20+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/outdooraholics/events/297809362/"
  },
  {
    title: "A day trip at the (ISLE OF WIGHT), Hiking and Picnic.",
    description: "he Isle of Wight is the home to the poets Swinburne and Tennyson and to Queen Victoria, who built her much-loved summer residence and final home Osborne House. Charles Dickens wrote much of David Copperfield whilst staying here. Historically the Island has also attracted many other famous visitors, including Charles Darwin, Lewis Carroll, Guglielmo Marconi, Turner and Alfred Lord Tennyson.",
    frequency: "monthly",
    date: Date.new(2024, 3, 10),
    start_time: '08:00',
    end_time: '18:00',
    area: 'Paddington',
    address: "Paddington Rail Station, Praed St, Paddington, London W2 1EE, UK",
    tags: "hiking, picnic, beach, social, community, day trip, Isle of Wight, morning, weekend",
    lat: 51.5191,
    lng: -0.1702,
    price: "30",
    people: "20+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/london-outdoors-lover-hiking-and-picnic-meetup-group/events/299289999/"
  },
  {
    title: "Strengthening Yoga Flow",
    description: "Experience the power of mindful movement and inner resilience. Unleash your potential with Strengthening Yoga Flow, join us and embrace a healthier, more powerful you. Secure your spot now!
    Non-hotel guests can register and make payments conveniently at our reception : £10 class.",
    frequency: "weekly",
    date: Date.new(2024, 3, 16),
    start_time: '10:00',
    end_time: '12:00',
    area: 'Islington',
    address: "25-31 Ironmonger Row, London EC1V 3QW",
    tags: "yoga, health, exercise, social, community, mindfulness, meditation, morning",
    lat: 51.5271,
    lng: -0.0947,
    price: "10",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/heart-twickenham/events/299308979/"
  },
  {
    title: "Camberwell Nude Life Drawing and drinks",
    description: "We'll be at the The Sun on * THIS MONDAY *! 🥳
    🌟 We'll have another WONDERFUL model for you this evening!
    ALL LEVELS WELCOME!
    Let's get together for some drawing and a glass of wine!!
    Camberwell Life Drawing is a group for anyone that want to spend a lovely and chilled evening creating some art in a relaxed, friendly and bohemian atmosphere.",
    frequency: "weekly",
    date: Date.new(2024, 3, 10),
    start_time: '19:00',
    end_time: '21:00',
    area: 'Camberwell',
    address: "The Sun, 61-63 Coldharbour Lane, SE5 9NS · London",
    tags: "life drawing, art, social, community, drawing, painting, nude, drinks, evening",
    lat: 51.4619,
    lng: -0.1115,
    price: "10",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/camberwell-life-drawing/events/299319898/"
  },
  {
    title: "Open Mic at the Old White Lion, East Finchley",
    description: "his is one of the best Open Mic clubs around at the moment and attracts a good crowd and plenty of entertainers. So this will be a regular monthly event. Open Mic means that the stage is open to anyone who wants to perform.
    It is easy to get to being very close to East Finchley tube station on the Northern Line. As you enter the pub go right to the room hosting the Open Mic. Look for North London Meet Your Neighbours IVC & Meetup signs on our tables. It gets busy so best to get there early. The entertainment starts around 8.30 and we will be there from 7.30pm. The bar serves a good selection of drinks and good food is available that will be brought to your table.",
    frequency: "weekly",
    date: Date.new(2024, 3, 17),
    start_time: '19:30',
    end_time: '23:00',
    area: 'East Finchley',
    address: "The Old White Lion, 121 Great North Road, Greater · London",
    tags: "open mic night, music, social, community, singing, performance, evening",
    lat: 51.5860,
    lng: -0.1638,
    price: "5",
    people: "40+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/north-london-meet-your-neighbours/events/299159587/"
  },
  {
    title: "Saturday French/English Language Exchange at the Cafe",
    description: "Please join us for a coffee (or anything else you'd like) at the café whilst enjoying an afternoon of French/English language exchange. We will enjoy 30 minute blocks of English and French conversation between the hours of 2.00pm and 5.00pm.
    GOAL
    To provide a relaxed and friendly environment where you can develop your linguistic skills and abilities in the language that you are learning whilst helping others develop their abilities in the language of which you are already fluent or advanced.
    Our goal is to have an even number of French and English speakers (so please sign up only if you are sure you can attend).",
    frequency: "weekly",
    date: Date.new(2024, 3, 9),
    start_time: '10:00',
    end_time: '23:00',
    area: 'Kings Cross',
    address: "Green & Fortune cafe, Kings Place, 90 York Way, Kings Cross, London, N1 9AG",
    tags: "language exchange, social, community, french, english, conversation, afternoon",
    lat: 51.5392,
    lng: -0.1244,
    price: "Free",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/french-english-language-exchange/events/zjqfrpygcfbdb/"

  },

  #JB SEED

  {
    title: "Enigma Quests - Escape Room",
    description: "You may have already heard about live escape games, or escape-the-room games - the new entertainment activity that is taking the world by storm.
    In most cases, small teams are locked in the room and have to escape within 60 minutes. While escaping the room sounds exciting, we decided to take it to the next level by creating games where you are completely immersed in surroundings and forget about the real world.
    These games are called Quests.
    In every Quest we design, your team will have a mission to achieve within one hour. To complete all tasks in time, you will have to be observant, use logic, be creative and participate actively.
    The puzzles we design are aimed at exercising different parts of brain. However we also believe that there must be a story behind every game - this is why you are embarking on a Quest in the first place.",
    frequency: "daily",
    date: Date.new(2024, 3, 9),
    start_time: '10:00',
    end_time: '23:00',
    address: "2-12 Wilson Street, London, EC2M 7LS",
    tags: "Escape Room",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 51.518717,
    lng: 0.085679,
    price: "20",
    people: "5+",
    link: "https://enigmaquests.london/?mh_matchtype=e&mh_keyword=enigma%20quests&mh_adgroupid=127208290065&mh_network=g&gad_source=1&gclid=CjwKCAiAi6uvBhADEiwAWiyRdlpqAr-PT_E3WD_87QHbGtOQHYQT2XG7ib2xJPstYZIzTlIO-fhBmxoCmPcQAvD_BwE"
  },

  {
    title: "F1 Arcade - Racing Experience",
    description: "A thrilling F1® racing experience designed to make you feel like a champion. F1 Arcade brings all the excitement, glamour and thrills of Formula 1® with our bespoke full-motion racing simulators, incredible food & cocktail menus and an electric atmosphere creating the perfect social gaming experience.",
    frequency: "daily",
    date: Date.new(2024, 3, 9),
    start_time: '12:00',
    end_time: '01:00',
    address: "1 New Change, London EC4M 9AF",
    tags: "Racing, Gaming, Sport",
    lat: 51.514245,
    lng: -0.095261,
    price: "15.95",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://f1arcade.com/uk/london/the-experience?tw_source=google&tw_adid=689010999033&tw_campaign=20613977197&gad_source=1&gclid=CjwKCAiAi6uvBhADEiwAWiyRdotcK8eHTCHNZJAQg5pgSUjteKQCuJjyGOWgS1Q3amRnJ7Uq7Tb3pRoCp5gQAvD_BwE",
    image_url: "https://www.graffitidesign.co.uk/wp-content/uploads/2023/01/IMG-4230-1024x768.jpg"
  },

  {
    title: "Alcotraz London: Cell Block Two-One-Two",
    description: "Hidden behind unassuming shutters lies Alcotraz, a secret prison staffed with crooked guards to help you successfully smuggle liquor past the Warden and get it into the hands of the longest-serving inmates.",
    frequency: "daily",
    date: Date.new(2024, 3, 7),
    start_time: '18:35',
    end_time: '23:15',
    address: "Unit 3B, 127 Hackney Rd, London E2 8GY",
    tags: "Experience, Dining, Simulation",
    lat: 51.530070,
    lng: -0.074355,
    price: "35.99",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.alcotraz.co.uk/locations/london/"
  },




  # AZ Seeds

  {
    title: "Croydon Whisky Festival",
    description: "South East England's most welcoming, inclusive and diverse whisky event. Sample spirits from craft distilleries and independent brands",
    frequency: "Annual",
    date: Date.new(2024, 3, 16),
    start_time: "12:00",
    end_time: "17:30",
    area: 'Stanley Arts',
    address: "12 South Norwood Hill London SE25 6AB",
    tags: "Festival, Drinks, Whiskey",
    lat: 51.399987,
    lng: -0.075419,
    price: "32",
    people: "2+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.eventbrite.co.uk/e/croydon-whisky-festival-2024-tickets-698298538727?aff=ehometext"
  },

  {
    title: "London Design Week 2024",
    description: "For five days, spring’s interiors event offers the brightest and the best of world-class talent, making this celebration of the new season a remarkable source of inspiration, knowledge and creativity for both professionals and design-lovers alike.",
    frequency: "Annual",
    date: Date.new(2024, 3, 11),
    start_time: '10:30',
    end_time: '17:00',
    area: 'Design Centre',
    address: "Chelsea Harbour Lots Road London SW10 0XE",
    tags: "Design, Lifestyle, Home",
    lat: 51.478316,
    lng: -0.181423,
    price: "10",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.dcch.co.uk/london-design-week/"
  },

  {
    title: "The Lion King (Musical)",
    description: "Disney’s award-winning musical The Lion King explodes with glorious colours, stunning effects and enchanting music. It follows the powerful story of Simba as he journeys from wide-eyed cub to his destined role as King of the Pridelands.",
    frequency: "Daily",
    date: Date.new(2024, 3, 8),
    start_time: '19:30',
    end_time: '21:30',
    area: 'Lyceum Theatre',
    address: "21 Wellington St, London WC2E 7RQ",
    tags: "Musical, Thrilling, Fun",
    lat: 51.511688,
    lng: -0.120236,
    price: "35+",
    people: "2+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.thelionking.co.uk"
  },

  {
    title: "Arsenal Stadium Tour",
    description: "Journey into Emirates Stadium and go on an all access behind-the-scenes tour. You’ll have the opportunity to walk in the footsteps of your heroes, listen to their matchday experiences and explore never before seen footage.",
    frequency: "Daily",
    date: Date.new(2024, 3, 8),
    start_time: '09:30',
    end_time: '18:00',
    area: 'Emirates Stadium',
    address: "Emirates Stadium, Hornsey Rd, London, N7 7AJ",
    tags: "Thrilling, Racing, Drinks",
    lat: 51.555015,
    lng: -0.108389,
    price: "30+",
    people: "2-5+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://arsenaldirect.arsenal.com/tour/home"
  },

  {
    title: "Swingers Mini Golf",
    description: "Swingers takes crazy golf from the 1920’s British seaside, Tanqueray infused plus-fours, adds London’s best street food, banging beats and sticks it in central London. Twice. Game on...",
    frequency: "Daily",
    date: Date.new(2024, 3, 8),
    start_time: '11:00',
    end_time: '23:00',
    area: 'West End',
    address: "15 John Prince's St London W1G 0AB",
    tags: "Mini Golf, Social, Games",
    lat: 51.515590,
    lng: -0.142900,
    price: "12+",
    people: "2-5+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://swingers.club/uk/venues/west-end"
  },

  {
    title: "Kew Gardens",
    description: "Discover the world of science behind our botanical collections, with over 50,000 living plants to be found across our UNESCO World Heritage site.",
    frequency: "Daily",
    date: Date.new(2024, 3, 8),
    start_time: '10:00',
    end_time: '18:00',
    area: 'Richmond',
    address: "Kew, Richmond, London, TW9 3AE",
    tags: "Botanical Gardens, Nature",
    lat: 51.484065,
    lng: -0.289501,
    price: "12+",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.kew.org/kew-gardens"
  },

  {
    title: "The Art of Banksy",
    description: "Following unprecedented public demand, The Art of Banksy - the major exhibition which has brought Banksy’s era defining works to over 1.5 million visitors in 15 cities across the globe - is extending its London run following hugely successful residencies in Covent Garden and Regent Street. Doors open 15 March in London’s iconic Soho.",
    frequency: "Daily",
    date: Date.new(2024, 3, 8),
    start_time: '11:00',
    end_time: '20:00',
    area: 'Charing Cross',
    address: "100 Charing Cross Road, London, WC2H 0JG",
    tags: "Banksy, Art, Exhibit",
    lat: 51.514161,
    lng: -0.129452,
    price: "21+",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://artofbanksy.co.uk"
  },

  {
    title: "Van Gogh Immersive Experience",
    description: "Have you ever dreamt of stepping into a painting? Now you can with this exhibition that has been touring since 2017 with +5,000,000 visitors! Get your tickets now! Crowned the GOLD MEDALIST for both Best Exhibition Experience and Best Immersive Experience at the prestigious Eventex 2023 Awards. Awarded best 2021 immersive experience by USA Today. Ranked among the 12 best immersive experiences in the world by CNN.",
    frequency: "Daily",
    date: Date.new(2024, 3, 8),
    start_time: '11:00',
    end_time: '20:00',
    area: 'Spitalfields',
    address: "106 Commercial Street, London. E1 6LZ",
    tags: "Van Gogh, Art, Immersive",
    lat: 51.5200208,
    lng: -0.0741933,
    price: "20+",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://vangoghexpo.com/london/"
  },

  {
    title: "Sandbox VR London",
    description: "Sandbox VR London is the ultimate destination for cutting-edge virtual reality experiences in the heart of the city. Grab your pals and immerse yourself in one of 8 worlds where the boundaries of reality are pushed to their limits. The adrenaline fuelled VR experiences, created by world-leading in-house games developers, make this the perfect location for groups of friends, work teams, stag and hen parties or competitive families to come together and experience the most advanced virtual reality on the planet. ",
    frequency: "Daily",
    date: Date.new(2024, 3, 8),
    start_time: '10:30',
    end_time: '23:30',
    area: 'Holborn',
    address: "Sandbox VR London, The Post Building, High Holborn, WC1A 1PB",
    tags: "VR, Immersive, Futuristic",
    lat: 51.516937,
    lng: -0.124456,
    price: "35+",
    people: "2-5+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://sandboxvr.com/booking/experiences"
  },

  {
    title: "Columbia Road Flower Market",
    description: "One of London’s most well-known and nicest-looking markets, Columbia Road overflows with bucketfuls of beautiful flowers every Sunday. From 8am-3pm, market traders line the narrow street selling flowers, houseplants, herbs, bulbs and shrubs. It’s worth shopping around, don’t be afraid to barter and prepare for it to get very busy. The market is popular with locals and tourists and during the midday rush is rammed with people elbowing their way to that perfect pot plant. If you can’t bear crowds or just want to guarantee the pick of the crop, arrive when the market opens.",
    frequency: "Weekly",
    date: Date.new(2024, 3, 10),
    start_time: '8:00',
    end_time: '15:00',
    area: 'Bethnal Green',
    address: "Columbia Rd, London, E2 7RG",
    tags: "Flower Market, Local favorite, Couple",
    lat: 51.528642,
    lng: -0.070710,
    price: "Free entry",
    people: "2+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://columbiaroad.info"
  },

  # NA Seed

  {
    title: "The War of The Worlds: The Immersive Experience",
    description: "Experience a real Martian invasion in London at Jeff Wayne's The War of The Worlds: The Immersive Experience. See it, hear it, live it, with 24 extraordinary scenes, multi-sensory effects and virtual reality – all set to Jeff Wayne’s iconic music. You’re not just watching, you’re right inside the action!",
    frequency: "Daily",
    date: Date.new(2024, 3, 17),
    start_time: '9:00',
    end_time: '11:00',
    area: 'Bank',
    address: "The Hallmark Building, 56 Leadenhall St, London EC3A 2BJ",
    tags: "Immersive",
    lat: 51.513141,
    lng: -0.079076,
    price: "45+",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://thewaroftheworldsimmersive.com/"
  },

  {
    title: "The Jack the Ripper Walking Tour in London",
    description: "Set out on foot and find out stories about one of London's most notorious serial killers—Jack the Ripper. Going on a walking tour takes you down cobbled alleyways and secret spots that are inaccessible by car or bus. Listen to insights about the shocking unsolved crimes from 1888, who the main suspects were, and go to the spots where the crimes occurred in Spitalfields and Brick Lane.",
    frequency: "Daily",
    date: Date.new(2024, 3, 16),
    start_time: '10:00',
    end_time: '12:00',
    area: 'Brick Lane',
    address: "Aldgate East, Underground Ltd, Whitechapel High St, London E1 7PT",
    tags: "Immersive, Walk, History",
    lat: 51.515490,
    lng: -0.071774,
    price: "16+",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.jack-the-ripper-tour.com/"
  },

  {
    title: "The Ultimate Driving Tour, Karting around the Sights of London",
    description: "Live on the edge and explore the iconic sights of London whilst driving in an eco-friendly, road-legal, automatic street Kart guided by a tour guide.",
    frequency: "Daily",
    date: Date.new(2024, 3, 15),
    start_time: '10:30',
    end_time: '11:30',
    area: 'Paddington',
    address: "Safestore Self Storage Paddington, Burwood Pl, Tyburnia, London W2 2HN",
    tags: "Immersive, Go-Karting, Discovery",
    lat: 51.517128,
    lng: -0.166176,
    price: "79+",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://kartsoflondon.com/"
  },

  {
    title: "Haunted London Pub Walking Tour",
    description: "Unravel London’s most chilling tales on this fun yet frightening haunted pub tour. Hear stories of notorious murderers, hauntings and debauchery from your local guide and visit eerie locations like Sweeney Todd’s barber shop and the macabre interior of a Victorian prison. Fear not! You’ll have a chance along the way to steel your nerves with some liquid courage. By the end of the 2-hour tour, you’ll see London in a profoundly spookier light.",
    frequency: "Daily",
    date: Date.new(2024, 3, 16),
    start_time: '19:00',
    end_time: '21:30',
    area: 'Fleet Street',
    address: "Mansion House Underground Ltd Station, 38 Cannon St, London EC4N 6JD",
    tags: "Immersive, Walk, Discovery",
    lat: 51.512430,
    lng: -0.093590,
    price: "10+",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.london-walking-tours.co.uk/the-haunted-london-pub-walk.htm"
  },

  {
    title: "London by Night Sightseeing Open Top Bus Tour with Audio Guide",
    description: "Unravel London’s most chilling tales on this fun yet frightening haunted pub tour. Hear stories of notorious murderers, hauntings and debauchery from your local guide and visit eerie locations like Sweeney Todd’s barber shop and the macabre interior of a Victorian prison. Fear not! You’ll have a chance along the way to steel your nerves with some liquid courage. By the end of the 2-hour tour, you’ll see London in a profoundly spookier light.",
    frequency: "Daily",
    date: Date.new(2024, 3, 16),
    start_time: '19:00',
    end_time: '20:45',
    area: 'Belvedere Road',
    address: "London Eye, Belvedere Road, Tourist bus stop number 77, London SE1 7NA",
    tags: "Bus Tour, Discovery",
    lat: 51.502969,
    lng: -0.119290,
    price: "24+",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.visitlondon.com/things-to-do/place/48008644-london-by-night-open-top-bus-tour"
  }
])

puts "generated activities"

User.create(first_name: "Akash", last_name: "Zaveri", email: "akazaveri@gmail.com", password: "password")
User.create(first_name: "Jacek", last_name: "Bastin", email: "jacek@gmail.com", password: "password")
User.create(first_name: "Nicolas", last_name: "Ayoub", email: "nicolas@gmail.com", password: "password")

user1 = User.create(first_name: "Akash", last_name: "Zaveri", email: "akazaveri@gmail.com", password: "password")
user2 = User.create(first_name: "Andy", last_name: "Tutton", email: "andytutton2@gmail.com", password: "password")

Group.create(name: "Sports", description: "Lots of sports", user: user2)

puts "g user and group"
puts "finished"
