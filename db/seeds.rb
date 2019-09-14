# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'

guests = JSON.parse(File.read('db/seeds/guests.json'))

for guest_obj in guests do
  puts guest_obj["slug"]
  guest_obj["bond"] = "Acompanhante" if guest_obj["bond"].nil?
  guest = Guest.find_or_create_by(slug: guest_obj["slug"])
  guest.update(guest_obj)
end