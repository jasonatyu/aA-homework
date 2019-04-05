# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Band.destroy_all

bands = []
while bands.length < 10 
    band = Faker::Kpop.boy_bands
    bands << band if !bands.include?(band)
end

bands.each do |band|
    Band.create(name: band)
end