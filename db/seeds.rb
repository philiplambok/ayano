# add users
50.times do |index|
  User.create username: "user#{index}", password: "kelapa", password_confirmation: "kelapa"
end

# add links 
User.all.each do |user|
  user.blogs.create title: Faker::SiliconValley.invention, url: Faker::SiliconValley.url 
end
