User.create!(name:  "Example User",
             email: "example@railstutorial.org",
             password:              "foobar",
             password_confirmation: "foobar",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

# 99.times do |n|
#   name  = Faker::Name.name
#   email = "example-#{n+1}@railstutorial.org"
#   password = "password"
#   User.create!(name:  name,
#                email: email,
#                password:              password,
#                password_confirmation: password,
#                activated: true,
#                activated_at: Time.zone.now)
# end

venues = ["Zanies", "Laugh Factory", "The Kates", "Mom Genes"]

show_types = ["Standup", "Storytelling", "Improv"]



10.times do 

  Show.create!(venue: venues.sample,
               date: Faker::Date.forward(90),
               show_type: show_types.sample,
               url: Faker::Internet.url 
               )
end