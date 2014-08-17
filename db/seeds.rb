# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
if Rails.env == "development"
  puts "Cleaning DB first ..."
  User.destroy_all
  Bicycle.destroy_all
  Message.destroy_all
  Reservation.destroy_all
  Review.destroy_all
  Transaction.destroy_all
end

BICYCLES = 50

puts "Creating users ..."
User.create!(username: "anna", email_address: "anna@example.com", password: "aaaa", location: "Paris", confirmed: true)
User.create!(username: "bret", email_address: "bret@example.com", password: "aaaa", location: "Paris", confirmed: true)
User.create!(username: "cara", email_address: "cara@example.com", password: "aaaa", location: "Berlin", confirmed: true)
User.create!(username: "dora", email_address: "dora@example.com", password: "aaaa", location: "Melbourne", confirmed: true)
User.create!(username: "eden", email_address: "eden@example.com", password: "aaaa", location: "Berlin", confirmed: true)
User.create!(username: "fred", email_address: "fred@example.com", password: "aaaa", location: "Copenhagen", confirmed: true)
User.create!(username: "greg", email_address: "greg@example.com", password: "aaaa", location: "Paris", confirmed: true)
User.create!(username: "hugh", email_address: "hugh@example.com", password: "aaaa", location: "Copenhagen", confirmed: true)
User.create!(username: "ivan", email_address: "ivan@example.com", password: "aaaa", location: "Berlin", confirmed: true)
User.create!(username: "jane", email_address: "jane@example.com", password: "aaaa", location: "Paris", confirmed: true)
User.create!(username: "kara", email_address: "kara@example.com", password: "aaaa", location: "Melbourne", confirmed: true)
User.create!(username: "lana", email_address: "lana@example.com", password: "aaaa", location: "London", confirmed: true)
User.create!(username: "mira", email_address: "mira@example.com", password: "aaaa", location: "Paris", confirmed: true)
User.create!(username: "niam", email_address: "niam@example.com", password: "aaaa", location: "London", confirmed: true)
User.create!(username: "owen", email_address: "owen@example.com", password: "aaaa", location: "Melbourne", confirmed: true)

puts "Creating Bicycles ..."
(1..BICYCLES).each do |index|
  Bicycle.create!(make: "Bicycle #{index}")
end

bicycles = Bicycle.all.to_a
User.all.to_a.each do |user, index|
  (1..3).each do
    user.bicycles << bicycles.sample
  end
end
