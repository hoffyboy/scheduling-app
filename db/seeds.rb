# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# @client = Client.create!(
#   email: 'client@example.com',
#   first_name: 'Jon',
#   last_name: 'Voight',
#   phone: '555-555-5555'
# )
#
# @watch = Watch.create!(
#   brand: 'Rolex',
#   model: 'Submariner',
#   condition: 'New',
#   price: 10000,
#   client_id: 1
# )

@event = Event.new
@event.schedule = IceCube::Schedule.new(Date.today, duration: 1.hour)
@event.schedule.add_recurrence_rule IceCube::Rule.weekly.day(1,2,3,4,5).hour_of_day(9,11,13,15,17)
@event.capacity = 1
@event.save!

puts @event
puts "Seed finished"
# puts "#{Client.count} client created"
# puts "#{Watch.count} watch created"
puts "#{Event.count} event created"
# puts "#{Schedule.count} schedule created"
