User.create!(name:  "Nathan Petts",
             email: "nbpetts@gmail.com",
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
               date: Faker::Time.forward(90, :evening),
               show_type: show_types.sample,
               url: Faker::Internet.url 
               )
end

10.times do 

  Show.create!(venue: venues.sample,
               date: Faker::Time.backward(90, :evening),
               show_type: show_types.sample,
               url: Faker::Internet.url 
               )
end

videos = ["https://www.youtube.com/embed/J---aiyznGQ", "https://www.youtube.com/embed/dQw4w9WgXcQ","https://www.youtube.com/embed/d9TpRfDdyU0" ]

Video.create!(title: "Me at the Uptown Underground", url: "https://www.youtube.com/embed/tosBWPSieyU", front_page: true) 

4.times do 

  Video.create!(title: venues.sample, url: videos.sample, front_page: false) 

end