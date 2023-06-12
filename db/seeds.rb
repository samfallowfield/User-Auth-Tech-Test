require 'faker'

puts 'Adding users'

30.times do
  username = Faker::Internet.username
  email = Faker::Internet.email
  password = Faker::Internet.password

  User.create!(username: username, email: email, password: password)
end