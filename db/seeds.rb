# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
activities = [
  { title: "Hiking", is_duration_based: true },
  { title: "Swimming", is_duration_based: true },
  { title: "Running", is_duration_based: true },
  { title: "Walking", is_duration_based: true },
  { title: "Skiing", is_duration_based: true },
  { title: "Snowboarding", is_duration_based: true },
  { title: "Skateboarding", is_duration_based: true },
  { title: "Tennis", is_duration_based: true },
  { title: "Ballet", is_duration_based: true },
  { title: "Biking", is_duration_based: true },
  { title: "Weight lifting", is_duration_based: false }
]

activities.each do |activity|
  Activity.create(activity)
end
