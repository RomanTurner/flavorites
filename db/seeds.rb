puts "Brutally Murdering all Users"
Follow.destroy_all
User.destroy_all 

puts "Creeeeeating Users"
20.times do 
    print "⚡️⚡️⚡️"
User.create(first_name: Faker::Fantasy::Tolkien.race, last_name: Faker::Fantasy::Tolkien.location, bio: Faker::Fantasy::Tolkien.poem, password:"ABC", username:Faker::Fantasy::Tolkien.character)
end

puts "/n 🧟‍♂️ IM ALIVE"

def create_followers
temp_user = User.all.sample
friend = User.all.select{|user| user.id != temp_user.id}.sample
[temp_user, friend] 
end

puts "Creeeeeating Followers!"
50.times do 
followers = create_followers
Follow.create(user_id: followers[0].id, following_id:followers[1].id)
end
puts "🌱🌱🌱 Seeding Finished! 🌱🌱🌱"