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
    title: "Primrose Hill Canal Run",
    description: "Join us Saturday at 10:30am for a casual run along the Regents Canal, approx 9km. We head to the top of Primrose Hill and back through Regents Park finishing at Granary Square, Kings Cross. Or if you’re looking for something shorter you can turn around at any point, Camden Market or the top of Primrose Hill are good options.

    We will start and meet in front of the entrance to the Regent's canal (entrance is on Muriel Street). Coffee afterwards for those interested.",
    frequency: "weekly",
    date: Date.new(2024, 3, 9),
    start_time: '10:30',
    end_time: '13:30',
    area: 'Angel',
    address: "Regent's Canal, London",
    tags: "health, running, exercise",
    lat: 51.5323,
    lng: -0.1064,
    price: "Free",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/angel-islington-running-group/events/299271105/",
    image_url: "https://tmhmedia.themodernhouse.com/uploads/TMH_H.Goldsmith_MaidaVale-105.jpg"
  },
  {
    title: "5km + Drinks",
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
    tags: "health, running, evening",
    lat: 51.5492,
    lng: -0.1030,
    price: "Free",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/angel-islington-running-group/events/299271105/",
    image_url: "https://secure.meetupstatic.com/photos/event/d/0/2/9/clean_514733289.webp"
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
    tags: "coffee, social, networking",
    lat: 51.5264,
    lng: -0.0786,
    price: "Free",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/selina-secret-garden-community/events/299384962/",
    image_url: "https://assets-pergikuliner.com/RGjHTQByH5uqYOquMdgMSQrrLW0=/385x290/smart/https://assets-pergikuliner.com/uploads/image/picture/2698411/picture-1667375852.jpg"
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
    tags: "health, climbing, evening",
    lat: 51.5643,
    lng: -0.0923,
    price: "5",
    people: "20+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/thelrc/events/299261700/",
    image_url: "data:image/jpeg;base64,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"
  },

  {
    title: "Islington Farmers' Market",
    description: "Sunday market with stands offering locally sourced vegetables & meats, plus some prepared foods.",
    frequency: "weekly",
    date: Date.new(2024, 3, 10),
    start_time: '10:00',
    end_time: '14:00',
    area: 'Islington',
    address: "Chapel Market, London N1 9PZ",
    tags: "food, community",
    lat: 51.5334,
    lng: -0.1113,
    price: "Free",
    people: "20+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.lfm.org.uk/markets/islington/",
    image_url: "https://slack-imgs.com/?c=1&o1=ro&url=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fthumb%2Fa%2Fa9%2FIslington_Farmers%2527_Market_%25283624118865%2529.jpg%2F1200px-Islington_Farmers%2527_Market_%25283624118865%2529.jpg"
  },
  {
    title: "Surrealist Book Club",
    description: "The March 2024 edition of Surrealist Book Club - with Hard-Boiled Wonderland & the End of the World, by Haruki Murakami.
    A narrative particle accelerator that zooms between Wild Turkey Whiskey and Bob Dylan, unicorn skulls and voracious librarians, John Coltrane and Lord Jim. Science fiction, detective story and post-modern manifesto all rolled into one rip-roaring novel, Hard-boiled Wonderland and the End of the World is the tour de force that expanded Haruki Murakami's international following.
    Tracking one man's descent into the Kafkaesque underworld of contemporary Tokyo, Murakami unites East and West, tragedy and farce, compassion and detachment, slang and philosophy.",
    frequency: "weekly",
    date: Date.new(2024, 3, 14),
    start_time: '10:00',
    end_time: '12:00',
    area: 'Islington',
    address: "Chapel Market, London N1 9PZ",
    tags: "reading, book club, literature",
    lat: 51.5344,
    lng: -0.1063,
    price: "2",
    people: "8+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/surrealist-book-club/events/298890983/",
    image_url: "https://designagame.eu/wp-content/uploads/2013/12/1_thumb.jpg"
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
    tags: "health, climbing, evening",
    lat: 51.4549,
    lng: -0.1927,
    price: "12",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/thelrc/events/299359092/",
    image_url: "https://tedious-mongoose.transforms.svdcdn.com/production/content-images/press-releases/Article-Image-Size-2023-09-28T150502.624.png?w=1760&h=990&auto=compress%2Cformat&fit=crop&dm=1695915649&s=ca7a3ddd0ffd938ec4ee6f909df5adec"
  },
  {
    title: "HIKE 21km Marlow",
    description: "A great rural hiking escape and a chance to see the River Thames as most Londoners haven't - tranquil and meandering through lush countryside away from London. Home to ducks and swans, settled in a gorgeous woodland, meadow and countrified landscape with picturesque riverside cottages, ancient villages, overhanging Weeping Willow trees, locks and a dramatic 200m footbridge across the river Thames, let us show you the rural Thames.
    This whole area of the Chiltern Hills was designated in 1965 as an official Area of Outstanding Natural Beauty to recognise and protect its picturesque beauty.",
    frequency: "weekly",
    date: Date.new(2024, 3, 10),
    start_time: '08:00',
    end_time: '18:00',
    area: 'Paddington',
    address: "Paddington Rail Station, Praed St, Paddington, London W2 1EE, UK",
    tags: "hiking, rural, countryside",
    lat: 51.5191,
    lng: -0.1702,
    price: "30",
    people: "20+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/outdooraholics/events/297809362/",
    image_url: "https://images.alltrails.com/eyJidWNrZXQiOiJhc3NldHMuYWxsdHJhaWxzLmNvbSIsImtleSI6InVwbG9hZHMvcGhvdG8vaW1hZ2UvMjE3Mzg3MTUvZThmMWQ0YjZjZWRlZjU4MDJkZWIzNjEwMDczMjhjN2EuanBnIiwiZWRpdHMiOnsidG9Gb3JtYXQiOiJ3ZWJwIiwicmVzaXplIjp7IndpZHRoIjo1MDAsImhlaWdodCI6NTAwLCJmaXQiOiJpbnNpZGUifSwicm90YXRlIjpudWxsLCJqcGVnIjp7InRyZWxsaXNRdWFudGlzYXRpb24iOnRydWUsIm92ZXJzaG9vdERlcmluZ2luZyI6dHJ1ZSwib3B0aW1pc2VTY2FucyI6dHJ1ZSwicXVhbnRpc2F0aW9uVGFibGUiOjN9fX0="
  },
  {
    title: "Day trip to Isle of Wight",
    description: "he Isle of Wight is the home to the poets Swinburne and Tennyson and to Queen Victoria, who built her much-loved summer residence and final home Osborne House. Charles Dickens wrote much of David Copperfield whilst staying here. Historically the Island has also attracted many other famous visitors, including Charles Darwin, Lewis Carroll, Guglielmo Marconi, Turner and Alfred Lord Tennyson.",
    frequency: "monthly",
    date: Date.new(2024, 3, 10),
    start_time: '08:00',
    end_time: '18:00',
    area: 'Paddington',
    address: "Paddington Rail Station, Praed St, Paddington, London W2 1EE, UK",
    tags: "hiking, picnic, day trip",
    lat: 51.5191,
    lng: -0.1702,
    price: "30",
    people: "20+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/london-outdoors-lover-hiking-and-picnic-meetup-group/events/299289999/",
    image_url: "https://eu-assets.simpleview-europe.com/isleofwight2015/imageresizer/?image=%2Fdbimgs%2FTours-sightseeing-Needles-rib-ride.png&action=PageHeaderSuper"
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
    tags: "yoga, health, exercise",
    lat: 51.5271,
    lng: -0.0947,
    price: "10",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/heart-twickenham/events/299308979/",
    image_url: "https://www.davidlloyd.co.uk/cms/images/softwire-david-lloyd/image/upload/f_auto/v1/Yoga/lgovptmva6zfukncgcob.jpg"
  },
  {
    title: "Camberwell Drawing and drinks",
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
    tags: "life drawing, art, social",
    lat: 51.4619,
    lng: -0.1115,
    price: "10",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/camberwell-life-drawing/events/299319898/",
    image_url: "https://i.guim.co.uk/img/static/sys-images/Guardian/Pix/pictures/2014/12/16/1418734931077/Drink-and-Draw-012.jpg?width=465&dpr=1&s=none"
  },
  {
    title: "Open Mic in East Finchley",
    description: "his is one of the best Open Mic clubs around at the moment and attracts a good crowd and plenty of entertainers. So this will be a regular monthly event. Open Mic means that the stage is open to anyone who wants to perform.
    It is easy to get to being very close to East Finchley tube station on the Northern Line. As you enter the pub go right to the room hosting the Open Mic. Look for North London Meet Your Neighbours IVC & Meetup signs on our tables. It gets busy so best to get there early. The entertainment starts around 8.30 and we will be there from 7.30pm. The bar serves a good selection of drinks and good food is available that will be brought to your table.",
    frequency: "weekly",
    date: Date.new(2024, 3, 17),
    start_time: '19:30',
    end_time: '23:00',
    area: 'East Finchley',
    address: "The Old White Lion, 121 Great North Road, Greater · London",
    tags: "open mic night, music, social",
    lat: 51.5860,
    lng: -0.1638,
    price: "5",
    people: "40+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/north-london-meet-your-neighbours/events/299159587/",
    image_url: "https://www.jw3.org.uk/sites/default/files/styles/banner_image/public/images/open%20mic%20web.jpg?itok=4jEr4jGB"
  },
  {
    title: "French/English Language Exchange",
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
    tags: "language exchange, social, community",
    lat: 51.5392,
    lng: -0.1244,
    price: "Free",
    people: "10+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.meetup.com/french-english-language-exchange/events/zjqfrpygcfbdb/",
    image_url: "https://secure.meetupstatic.com/photos/event/2/e/2/8/clean_467291816.webp"

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
    link: "https://enigmaquests.london/?mh_matchtype=e&mh_keyword=enigma%20quests&mh_adgroupid=127208290065&mh_network=g&gad_source=1&gclid=CjwKCAiAi6uvBhADEiwAWiyRdlpqAr-PT_E3WD_87QHbGtOQHYQT2XG7ib2xJPstYZIzTlIO-fhBmxoCmPcQAvD_BwE",
    image_url: "https://media.timeout.com/images/103935275/image.jpg"

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
    link: "https://www.alcotraz.co.uk/locations/london/",
    image_url: "https://applications-media.feverup.com/image/upload/f_auto,w_720,h_720/fever2/plan/photo/64151054-f335-11ed-bb6c-0ed7fc946300.jpg"
  },

  {
    title: "Kinoteka Polish Film Festival",
    description: "The Opening Gala at the BFI Southbank will screen ‘Green Border’, a moving depiction of debates on migration in Europe and the Closing Gala at the BFI IMAX will show ‘The Peasants’, a Polish box office smash-hit, which’ll be accompanied by stunning live music. But there’s plenty more where that came from – for all the info on screenings throughout March, check the programme on the website below. Dzięki!",
    frequency: "daily",
    date: Date.new(2024, 3, 7),
    start_time: '11:35',
    end_time: '23:15',
    address: "238-246 King St, London W6 0RF",
    tags: "Cinema, Culture",
    lat: 51.493448,
    lng: -0.237151,
    price: "35.99",
    people: "1",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://kinoteka.org.uk/",
    image_url: "https://media.timeout.com/images/106093992/1372/1029/image.webp"
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
    link: "https://www.eventbrite.co.uk/e/croydon-whisky-festival-2024-tickets-698298538727?aff=ehometext",
    image_url: "https://croydonwhiskyfestival.com/wp-content/uploads/2023/08/MG_0086-scaled.jpeg"
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
    link: "https://www.dcch.co.uk/london-design-week/",
    image_url: "https://www.dcch.co.uk/london-design-week/wp-content/uploads/2023/11/0205-539x303.jpg"
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
    link: "https://www.thelionking.co.uk",
    image_url: "https://lumiere-a.akamaihd.net/v1/images/tlk_characters_card_r_62bd14e2.jpeg?region=0,0,1460,824"
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
    link: "https://arsenaldirect.arsenal.com/tour/home",
    image_url: "https://lh3.googleusercontent.com/p/AF1QipNBQS1ym3o-5wktmc6wtxWu8To23nLySY9nW_6N=s1360-w1360-h1020"
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
    link: "https://swingers.club/uk/venues/west-end",
    image_url: "https://csswingerscmslivestorage.blob.core.windows.net/public-content/Dynamic%20Images/Original/Swingers%20West%20End%20-%20May2022-%20PWF%20-%200346-HDR.jpg"
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
    link: "https://www.kew.org/kew-gardens",
    image_url: "https://cdn-imgix.headout.com/media/images/53a9edd14bbb7bff76cfe3ab511ec664-Kew%20Gardens%20Museum%201.jpg"
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
    link: "https://artofbanksy.co.uk",
    image_url: "https://artofbanksy.co.uk/wp-content/uploads/2023/09/DSC03239_1920x1282.jpg"
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
    link: "https://vangoghexpo.com/london/",
    image_url: "https://assets.simpleviewinc.com/simpleview/image/upload/crm/longisland/VanGoghLowRes_MikeSudoma_August22-1275_DFC8DC4D-C93F-498C-A5B50935B3C4DDAB_d2db1e93-11f1-428c-911958821cd56c72.jpg"
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
    link: "https://sandboxvr.com/booking/experiences",
    image_url: "https://d3hjf51r9j54j7.cloudfront.net/wp-content/uploads/sites/9/2023/02/Gameplay-group.jpg"
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
    link: "https://columbiaroad.info",
    image_url: "https://lh3.googleusercontent.com/p/AF1QipNtNs9Fngk_Cl3tWMQ_SHUbgSBCLbPAgZr0NcN_=s1360-w1360-h1020"
  },

  # NA Seed

  {
    title: "The War of The Worlds",
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
    link: "https://thewaroftheworldsimmersive.com/",
    image_url: "https://www.londonboxoffice.co.uk/news/public/reviews/the-war-of-the-worlds.jpg"
  },

  {
    title: "The Jack the Ripper Walking Tour",
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
    link: "https://www.jack-the-ripper-tour.com/",
    image_url: "https://res.klook.com/image/upload/c_fill,w_750,h_560/q_80/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/p3zdlnjplylepugiu7sm.jpg"
  },

  {
    title: "The Ultimate Driving Tour",
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
    link: "https://kartsoflondon.com/",
    image_url: "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/2a/fd/60/4b/caption.jpg?w=1200&h=-1&s=1"
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
    link: "https://www.london-walking-tours.co.uk/the-haunted-london-pub-walk.html",
    image_url: "https://cdn.getyourguide.com/img/tour/54641b17f87b9126.jpeg/145.jpg"
  },

  {
    title: "London by Night Sightseeing",
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
    link: "https://www.visitlondon.com/things-to-do/place/48008644-london-by-night-open-top-bus-tour",
    image_url: "https://veronikasadventure.com/wp-content/uploads/2024/01/london-by-night-sightseeing-open-top-bus-tour-with-audio-guide.jpg"
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
