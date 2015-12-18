5.times do
  user = User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
end
users = User.all

25.times do
  Item.create!(
  user: users.sample,
  name: Faker::Hipster.sentence
  )
end

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
