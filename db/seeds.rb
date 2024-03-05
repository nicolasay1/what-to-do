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

  activities = Activity.create!([
    {
    title: "Morning Yoga",
    description: "Start your day with a refreshing morning yoga session to boost your energy and flexibility. Suitable for all levels.",
    frequency: "daily",
    date: Date.new(2024, 3, 10),
    time: '07:00',
    address: "Central Park, New York",
    tags: "health, yoga, morning",
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    title: "Tech Networking Event",
    description: "Meet and connect with local tech professionals and enthusiasts. Share ideas, form partnerships, and expand your network.",
    frequency: "monthly",
    date: Date.new(2024, 3, 15),
    time: '18:00',
    address: "Innovation Hub, Downtown",
    tags: "technology, networking, professional",
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    title: "Community Cleanup",
    description: "Join us for a community cleanup day to keep our neighborhood beautiful. All materials will be provided.",
    frequency: "quarterly",
    date: Date.new(2024, 4, 5),
    time: '09:00',
    address: "Riverbank Park",
    tags: "community, environment, volunteer",
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    title: "Coding Workshop",
    description: "A beginner-friendly workshop where you'll learn the basics of web development and build your first website.",
    frequency: "weekly",
    date: Date.new(2024, 3, 20),
    time: '14:00',
    address: "Tech Academy, 123 Main St",
    tags: "coding, education, technology",
    created_at: Time.now,
    updated_at: Time.now
  },
  {
    title: "Local Farmers Market",
    description: "Explore the best of local produce, homemade goods, and artisan crafts at our weekly farmers market.",
    frequency: "weekly",
    date: Date.new(2024, 3, 12),
    time: '10:00',
    address: "City Square",
    tags: "food, community, shopping",
    created_at: Time.now,
    updated_at: Time.now
  }
])

puts "generated activities"
