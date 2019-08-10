
7.times do
  username = Faker::Name.first_name
  User.create([{
       username: username,
       email: Faker::Internet.safe_email(name: username),
       password: "password"
       }])
end

10.times do
  Article.create([{
      title: Faker::TvShows::GameOfThrones.character,
      description: Faker::TvShows::GameOfThrones.quote,
      user_id: Faker::Number.within(range: 1..7)
      }])
end

8.times do
  Category.create([{
      name: Faker::Book.genre
      }])
end

user = User.find(rand(1..7))
user.toggle!(:admin)
user.save
puts "admin #{user.email}"