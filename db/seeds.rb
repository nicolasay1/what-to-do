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

  activities = Activity.create!([
    {
    title: "Canal Run Angel to Primrose Hill",
    description: "Join us Saturday at 10:30am for a casual run along the Regents Canal, approx 9km. We head to the top of Primrose Hill and back through Regents Park finishing at Granary Square, Kings Cross. Or if you’re looking for something shorter you can turn around at any point, Camden Market or the top of Primrose Hill are good options.

    We will start and meet in front of the entrance to the Regent's canal (entrance is on Muriel Street). Coffee afterwards for those interested.",
    frequency: "weekly",
    date: Date.new(2024, 3, 9),
    start_time: '10:30',
    address: "Regent's Canal, London",
    tags: "health, running, morning, exercise, athletics, sports, social",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "Thursday 5km run followed by pub drinks",
    description: "Please join us for our weekly run and social - a great (free!) way to meet new people!
    We meet at 7pm at the entrance to Highbury Fields outside Harvest N5.
    We run 5km at an easy pace (about 6 mins per km), often 3 loops around Highbury Fields but we do change up the route from time to time.
    After the run, we will head to the House of Hammerton pub for some drinks.",
    frequency: "weekly",
    date: Date.new(2024, 3, 15),
    start_time: '19:00',
    address: "Highbury Fields, Highbury Crescent · London",
    tags: "health, running, evening, exercise, athletics, sports, social",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "Nomadic Coffee - Cowork",
    description: "Hey nomads!
    Come join us every Tuesday and Thursday at 4:30pm at our Cowork Space to eat some snacks, drink some coffee and connect!
    Ps.: The event is exclusive for cowork users.",
    frequency: "quarterly",
    date: Date.new(2024, 4, 16),
    start_time: '16:30',
    address: "CoBalance, 130 Shoreditch High St ",
    tags: "community, coffee, social, evening, work, networking",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "Friday Climb and Cheeky Drink",
    description: "Welcome to the London Rock Climbers Castle meet up! LRC is a social climbing group and this meet up is a great way for new members to meet the group and for everyone to catch up, have a good chat, and climb together without the time pressures of the mid-week climbs.

    We meet at 6.45 pm in the upstairs seating area opposite the lead walls (the old Café for anyone who remembers). Look out for our black “London Rock Climbers” T-shirts. The same t-shirts will help you locate us inside the Castle if you are running late.

    We climb until the Castle closes at 10pm or we get tired (about 9pm or 7pm in extreme cases…) and are ready to celebrate the end of the week with a drink and/or dinner at the Brownswood pub (271 Green Lanes, N4 2EX)",
    frequency: "quarterly",
    date: Date.new(2024, 3, 20),
    start_time: '14:00',
    address: "The Castle Climbing Centre, Green Lanes, Stoke Newington · London N4 2HA",
    tags: "health, climbing, evening, exercise, athletic, sports, social",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "Islington Farmers' Market",
    description: "Sunday market with stands offering locally sourced vegetables & meats, plus some prepared foods.",
    frequency: "weekly",
    date: Date.new(2024, 3, 10),
    start_time: '10:00',
    address: "Chapel Market, London N1 9PZ",
    tags: "food, community, shopping, social, farmers market, vegetables, meat, prepared foods",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "Surrealist Book Club: Hard-Boiled Wonderland & the End of the World, by Murakami",
    description: "The March 2024 edition of Surrealist Book Club - with Hard-Boiled Wonderland & the End of the World, by Haruki Murakami.
    A narrative particle accelerator that zooms between Wild Turkey Whiskey and Bob Dylan, unicorn skulls and voracious librarians, John Coltrane and Lord Jim. Science fiction, detective story and post-modern manifesto all rolled into one rip-roaring novel, Hard-boiled Wonderland and the End of the World is the tour de force that expanded Haruki Murakami's international following.
    Tracking one man's descent into the Kafkaesque underworld of contemporary Tokyo, Murakami unites East and West, tragedy and farce, compassion and detachment, slang and philosophy.
    Free PDF copy
    New on Hive.co.uk
    Secondhand on AbeBooks
    Search your local library catalogue (UK only)
    Session Format
    After a quick hello and sharing where we're dialling in from, we go round the room to highlight our favourite and least favourite parts (15mins), the most striking parts (15mins), and how this text might now inform our own work or thinking going forward (20mins). This is a book group predominantly for readers, not a writing or art group, so if you are also a writer or artist you are very welcome to talk around your work and reference it in the last section, but that is not the focus so we do not share from our work. Bring a cup of tea!",
    frequency: "weekly",
    date: Date.new(2024, 3, 14),
    start_time: '10:00',
    address: "Chapel Market, London N1 9PZ",
    tags: "reading, book club, literature, social, community, discussion, books, reading group",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "Parthian Wandsworth Social Climb",
    description: "Come and join us at South London's newest climbing gym every Thursday. Parthian Wandsworth has rope climbing (top rope and lead) and 300+ boulder problems spread across the second floor, which will also feature the 2024 Paris Olympic Boulder wall The Titan! Also, if you show you are signed up to the Meet Up the single price entry is £12, 10% off items in the shop, 10% off hot drinks and food, and the Friday promo will be applied on Thursday for LRC: Pizza and beer £12.
    Please pre-register online the first time you come to save queueing. Once you have paid your entry fee look out for your hosts on the second-floor seating area from 18:45 getting ready to start climbing at 19:00. Bring your chalk, shoes, harness, and rope if you will be lead climbing.
    If you want to rope climb you will need to know how to belay and climb safely. We don't teach or instruct, however, we are happy to give you some friendly pointers in a supportive social environment. See you on the wall!",
    frequency: "weekly",
    date: Date.new(2024, 3, 9),
    start_time: '19:00',
    address: "Parthian Climbing, 52 - 58 Garratt Lane · LondonParthian Climbing",
    tags: "health, climbing, evening, exercise, athletic, sports, social",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "HIKE 21km Marlow - the Woods, Villages and Islands of the rural Thames",
    description: "A great rural hiking escape and a chance to see the River Thames as most Londoners haven't - tranquil and meandering through lush countryside away from London. Home to ducks and swans, settled in a gorgeous woodland, meadow and countrified landscape with picturesque riverside cottages, ancient villages, overhanging Weeping Willow trees, locks and a dramatic 200m footbridge across the river Thames, let us show you the rural Thames.
    This whole area of the Chiltern Hills was designated in 1965 as an official Area of Outstanding Natural Beauty to recognise and protect its picturesque beauty.
    HIGHLIGHTS
    • A high chance of seeing Red Kites - a beautiful and rare bird of prey
    • Hike a stunning section of the rural River Thames
    • Explore gorgeous woodland trails in the Chiltern Hills
    • Visit the Georgian town of Marlow
    • Explore an island in the River Thames
    • Cross the exhilarating 61m Hambleden Weir foot bridge
    • Visit the ancient village of Hambleden including its church which dates back over 1000 years
    HIKE DESCRIPTION
    We shall be exploring the River Thames away from London to the well preserved Georgian town of Marlow in Buckinghamshire. Buckinghamshire is a county well known for its rivers, canals and landscape and of course the Chiltern Hills further North.
    Our hike covers a very scenic stretch of the River Thames taking us past the charming riverside villages of Aston and Hurley and also Marlow Lock, - built in 1773. Time seems to have stood still in this area and even the village of Hurley is little changed since the days when it was a Benedictine Monastery. We also get a glimpse of Bisham Abbey and Bisham Church across the River Thames before we cross over the weir footbridge at Hambleden Mill (61m wide and an experience in itself). After a short stop here, we follow an enchanting woodland trail passing meadows back to Marlow.
    The beauty and tranquillity of the area has attracted numerous famous residents including Mary Shelley (the author of Frankenstein), T.S.Eliot, Heston Blumenthal, Andrew Strauss and even Robbie Williams and David Seaman own properties there.",
    frequency: "weekly",
    date: Date.new(2024, 3, 10),
    start_time: '08:00',
    address: "Paddington Rail Station, Praed St, Paddington, London W2 1EE, UK",
    tags: "hiking, rural, countryside, social, community, day trip, Thames, morning, weekend",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "A day trip at the (ISLE OF WIGHT), Hiking and Picnic.",
    description: "he Isle of Wight is the home to the poets Swinburne and Tennyson and to Queen Victoria, who built her much-loved summer residence and final home Osborne House. Charles Dickens wrote much of David Copperfield whilst staying here. Historically the Island has also attracted many other famous visitors, including Charles Darwin, Lewis Carroll, Guglielmo Marconi, Turner and Alfred Lord Tennyson.
    Guglielmo Marconi undertook his pioneering work at the isle of Wight at the end of the 19th Century which led to radio and all telecommunications and sent the very first wireless transmission.
    Charles Darwin was one of the most famous guests to the Island, staying at the Kings Head Hotel, during the summer of 1867 and it is believed that this is where he began his ‘Origin of Species’ assessment.

    A day walking and picnics on the beautiful beach of Alum Bay. Once we dock to the Island around 12.00pm(depend on the ferry but roughly around that time), we put on the way toward the Needles coast around 12.40pm, where we are going to have our picnic on the beach,( everyone can bring owns food and drink or taking it at the local area), we will spend time to visit the wonderful west coast of the Isle of Wight (so feel free to bring your beach towel , swimsuit and sun cream), you are also free to decide if you want to book a spectacular 20 minutes boat trip around the coast while we are on the picnic mark-point, later on of our picnic and relax time by 2/3pm we will start hiking to visit the (Top secret space rocket and missile centre built and the G. Marconi statue place), and both sides of the needles coast, where you can discover the fantastic magic of the isle. Around 5/5.30pm we will leaving the place to grab the ferry and put on the way back to (Paddington station) to get there approximately around 21.00pm.

    The cost of the trip is £60 a person it Includes (Ferry, Minibus, Car Parking) with return to Paddington.

    Note: (adult only 18+), If we not reach 8 people the £60 will be refunded at the closure of the trip at 6pm on the day before of the meetup, but once we get 8 people the amount is not more refundable as the spots are settled. Is your responsibility to check the email and important message for the event.",
    frequency: "monthly",
    date: Date.new(2024, 3, 10),
    start_time: '08:00',
    address: "Chapel Market, London N1 9PZ",
    tags: "hiking, picnic, beach, social, community, day trip, Isle of Wight, morning, weekend",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "Strengthening Yoga Flow",
    description: "Experience the power of mindful movement and inner resilience. Unleash your potential with Strengthening Yoga Flow, join us and embrace a healthier, more powerful you. Secure your spot now!
    Non-hotel guests can register and make payments conveniently at our reception : £10 class.",
    frequency: "weekly",
    date: Date.new(2024, 3, 16),
    start_time: '10:00',
    address: "25-31 Ironmonger Row, London EC1V 3QW",
    tags: "yoga, health, exercise, social, community, mindfulness, meditation, morning",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "Camberwell Nude Life Drawing and drinks",
    description: "We'll be at the The Sun on * THIS MONDAY *! 🥳
    🌟 We'll have another WONDERFUL model for you this evening!
    ALL LEVELS WELCOME!
    Let's get together for some drawing and a glass of wine!!
    Camberwell Life Drawing is a group for anyone that want to spend a lovely and chilled evening creating some art in a relaxed, friendly and bohemian atmosphere.
    Untutored life drawing classes, every Monday evening in Camberwell at The Sun of Camberwell (on Coldharbour Lane) from 7pm to 9pm.
    £14 per session (Cash or Card)
    Some materials will be provided but please feel free to bring your own too!
    RSVP or drop-in on the night Latecomers are very welcome, too.",
    frequency: "weekly",
    date: Date.new(2024, 3, 10),
    start_time: '19:00',
    address: "The Sun, 61-63 Coldharbour Lane, SE5 9NS · London",
    tags: "life drawing, art, social, community, drawing, painting, nude, drinks, evening",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "Open Mic at the Old White Lion, East Finchley",
    description: "his is one of the best Open Mic clubs around at the moment and attracts a good crowd and plenty of entertainers. So this will be a regular monthly event. Open Mic means that the stage is open to anyone who wants to perform.
    It is easy to get to being very close to East Finchley tube station on the Northern Line. As you enter the pub go right to the room hosting the Open Mic. Look for North London Meet Your Neighbours IVC & Meetup signs on our tables. It gets busy so best to get there early. The entertainment starts around 8.30 and we will be there from 7.30pm. The bar serves a good selection of drinks and good food is available that will be brought to your table.",
    frequency: "weekly",
    date: Date.new(2024, 3, 17),
    start_time: '19:30',
    address: "The Old White Lion, 121 Great North Road, Greater · London",
    tags: "open mic night, music, social, community, singing, performance, evening",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
  },
  {
    title: "Saturday French/English Language Exchange at the Cafe",
    description: "Please join us for a coffee (or anything else you'd like) at the café whilst enjoying an afternoon of French/English language exchange. We will enjoy 30 minute blocks of English and French conversation between the hours of 2.00pm and 5.00pm.
    GOAL
    To provide a relaxed and friendly environment where you can develop your linguistic skills and abilities in the language that you are learning whilst helping others develop their abilities in the language of which you are already fluent or advanced.
    Our goal is to have an even number of French and English speakers (so please sign up only if you are sure you can attend).
    Chers membres,
    Joignez-vous à nous pour prendre un café (ou ce qui vous fait envie), et profiter d'un après-midi d'échange linguistique anglais-français. Vous participerez à des modules de conversation d'une durée de 30 minutes tour à tour en français et en anglais de 14h00 à 17h00.
    OBJECTIF
    Fournir un lieu tranquille, décontracté, et amical où vous pouvez développer vos compétences et aptitudes dans la langue que vous désirez apprendre tout en aidant d'autres membres à apprendre la langue que vous maîtriser déjà.",
    frequency: "weekly",
    date: Date.new(2024, 3, 9),
    start_time: '10:00',
    address: "Green & Fortune cafe, Kings Place, 90 York Way, Kings Cross, London, N1 9AG",
    tags: "language exchange, social, community, french, english, conversation, afternoon",
    created_at: Time.now,
    updated_at: Time.now,
    lat: 50,
    lng: 1
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
    people: "1+",

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
    lat: 51.513245,
    lng: -0.098341,
    price: "15.95",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
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
    lat: 51.530411,
    lng: -0.074680,
    price: "35.99",
    people: "1+",
    created_at: Time.now,
    updated_at: Time.now,
  },


  # AZ Seeds

  {
    title: "Croydon Whisky Festival",
    description: "South East England's most welcoming, inclusive and diverse whisky event. Sample spirits from craft distilleries and independent brands",
    frequency: "Annual",
    date: Date.new(2024, 3, 16),
    start_time: '12:00',
    end_time: '17:30',
    area: 'Stanley Arts',
    address: "12 South Norwood Hill London SE25 6AB",
    tags: "Festival, Drinks, Whiskey",
    lat: 51.403561,
    lng: -0.080330,
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
    lat: 51.476269,
    lng: -0.179930,
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
    lat: 51.511749,
    lng: -0.119700,
    price: "35+",
    people: "2+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://www.thelionking.co.uk"
  },

  {
    title: "F1 Arcade",
    description: "A thrilling F1® racing experience designed to make you feel like a champion. F1 Arcade brings all the excitement, glamour and thrills of Formula 1® with our bespoke full-motion racing simulators, incredible food & cocktail menus and an electric atmosphere creating the perfect social gaming experience.",
    frequency: "Daily",
    date: Date.new(2024, 3, 8),
    start_time: '12:00',
    end_time: '23:50',
    area: 'St.Pauls',
    address: "St.Pauls, London, EC4M",
    tags: "Thrilling, Racing, Drinks",
    lat: 51.513279,
    lng: -0.098370,
    price: "16+",
    people: "2-5+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://f1arcade.com"
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
    lat: 51.554291,
    lng: -0.108475,
    price: "30+",
    people: "2-5+",
    created_at: Time.now,
    updated_at: Time.now,
    link: "https://arsenaldirect.arsenal.com/tour/home"
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
