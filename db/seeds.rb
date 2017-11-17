# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

@user = User.create!(
  email: 'user@example.com',
  password: '123456'
)

@client = Client.create!(
  email: 'client@example.com',
  first_name: 'Jon',
  last_name: 'Voight',
  phone: '555-555-5555'
)

@watch = Watch.create!(
  brand: 'Rolex',
  model: 'Submariner',
  condition: 'New',
  price: 10000,
  client_id: 1
)

@event = Event.new
@event.schedule = IceCube::Schedule.new(Date.today, duration: 1.hour)
@event.schedule.add_recurrence_rule IceCube::Rule.daily.hour_of_day(9,10,11,12,13,14,15,16)
@event.capacity = 1
@event.user_id = 1
@event.save!

puts @event
puts "Seed finished"
puts "#{User.count} user created"
puts "#{Client.count} client created"
puts "#{Watch.count} watch created"
puts "#{Event.count} event created"
# puts "#{Schedule.count} schedule created"
