puts "Brutally Murdering all Users"
MealPlanRecipe.destroy_all
MealPlan.destroy_all 
Follow.destroy_all
User.destroy_all

User.create(first_name: "kai", last_name: "saviour", bio: Faker::Fantasy::Tolkien.poem, password:"ABC", username:"god")

puts "Creeeeeating Users"
10.times do 
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
20.times do 
followers = create_followers
Follow.create(user_id: followers[0].id, following_id:followers[1].id)
end

puts "Creating MealPlans 🌯🍴"
10.times do 
MealPlan.create(title:Faker::Hipster.sentence(word_count: 3), user:User.all.sample)
end

puts "Creating Meal Plan Recipes 📝"
50.times do
meal_plan = MealPlan.all.sample
mpr = MealPlanRecipe.create(meal_plan: meal_plan, recipe: Recipe.all.sample)
meal_plan.update(unassigned: meal_plan.unassigned<<mpr.id)
end



# keywords =  [
#         "Appetizers & Snacks",
#         "Super Bowl Appetizers",
#         "New Year's Appetizers",
#         "Cocktail Party Appetizers"
#       ]

# metadata ={
#         prep_time: "Prep: 5 mins",
#         cook_time: "Cook: 5 mins",
#         total_time: "Total: 10 mins",
#         servings: "Servings: 8 servings",
#         meta_yield: "Yields: 15 cups"
#     }
# img_url = "https://www.thespruceeats.com/thmb/lSC93P1HdldAxcHGV4xnYd-UfrE=/960x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/trufflepopcorn-40395d0118ff4d63a47520ec8a53860d.jpg"
# description = "A welcome addition to just about any occasion, popcorn is infinitely adaptable to different flavor profiles, from dill pickle to cheddar cheese to caramel. It may well be the perfect snack. The kernels are addictive, but it’s not bad for you—technically, it’s a whole grain food that's full of fiber.Of course, popcorn is also incredibly easy to make. Oil popping—heating the kernels on the stove in a covered pot with a small amount of fat—is our preferred method at home. Popping corn in an air popper also works, but dry flavorings like salt won’t stick to plain air-popped popcorn without the addition of a little oil or butter. Moreover, unless you also use your air popper to roast coffee, the machine is one of those single-use kitchen appliances that might not justify the space it takes up in your cabinet. Oil popping doesn’t add very much fat (you’ll probably be adding some anyway) and requires only a stove, pot, and lid.This recipe for truffle popcorn couldn’t be simpler. The one trick is to use a mortar and pestle to grind the truffle salt into a fine powder before tossing with the popcorn. This step helps for even distribution of flavor and also allows the salt to stick better to the popcorn. The truffle salt we used contains small pieces of real white truffle, so the mortar and pestle helps to pulverize and distribute those as well.Truffle salt is expensive, but a little goes a long way. Truffle salt is also a more flexible seasoning than truffle oil and better for sprinkling on everything from steak to vegetables.If you want to dress this popcorn up a little more, add some finely chopped herbs, grated Parmesan, fresh ground black pepper, or even nutritional yeast to amp up the savory delight of this simple yet gourmet snack.",
     
# ingredients =[
#         "1 tablespoon peanut oil (or other high smoke point oil, like coconut or ghee)",
#         "1/2 cup popcorn kernels",
#         "1/2 teaspoon truffle salt",
#         "Extra virgin olive oil for drizzling"
#       ]

# instruction = [
#         "Gather the ingredients.",
#         "Add the peanut oil and 3 individual popcorn kernels to a large pot over medium high heat. Put the lid on the pot.",
#         "When you hear the first kernel pop, remove the lid from the pot, add all remaining popcorn and replace the lid.",
#         "Shake the pot periodically until the popping eventually comes to a stop. Remove from heat.",
#         "Transfer popcorn to a large bowl.",
#         "Add the truffle salt to a mortar and pestle. Grind to a fine powder.",
#         "Drizzle the popcorn with a bit of extra virgin olive oil. Toss the popcorn in the bowl. Sprinkle the truffle salt evenly over the popcorn. Toss again. Serve immediately."
#       ]
      
# instruction_img = [
#         "https://www.thespruceeats.com/thmb/x1IifZ-6y0cLWA5NjRJd0VROZbY=/1798x1240/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Italian_Brine-589e419e5f9b58819c1471da.jpg",
#         "https://www.thespruceeats.com/thmb/juWCL1K8xfRmiL9Zs4rD-2_ytYs=/960x641/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/spicy-poultry-rub-web-5a0b4fc022fa3a0036ce44ae-5a1333ee22fa3a0037e0bb0e.jpg",
#         "https://www.thespruceeats.com/thmb/Xe7nP3mbZJzvx5Ra4BTsVZQHIRA=/2002x1256/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/smoking_charcoal_grill_composite_sm-56a072423df78cafdaa1b7fb.jpg",
#         "https://www.thespruceeats.com/thmb/qFcPSKjZqadafGlvsM39ji2p_Wk=/1890x1252/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Pulled_Chicken_BBQ_Grill_placement-56a072433df78cafdaa1b803.jpg",
#         "https://www.thespruceeats.com/thmb/5tpuck_n0YoC8ICFWT-vU_P-SL0=/1966x1302/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/pulled_Chicken_BBQ_Turning-56a072435f9b58eba4b090ec.jpg",
#         "https://www.thespruceeats.com/thmb/vYKKQt4Z-RZEzjI34IGXe0J1mcc=/1698x1140/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/finished_chicken-56a072433df78cafdaa1b808.jpg",
#         "https://www.thespruceeats.com/thmb/ZS9dK0r3ZSwRAP5O7bav3bYFVuk=/1964x1071/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/Pulled_Chicken_BBQ_Shredding-56a072445f9b58eba4b090f4.jpg"
#       ]
# tips = [
#         "How you serve homemade pulled chicken is entirely up to you. This is very similar to pulled pork in texture and to some degree flavor, so anything that can be done with pulled pork can be done with pulled chicken. To be traditional, pile generous amounts of pulled chicken with the sauce onto rolls or hamburger buns, top with a good coleslaw, and enjoy."
#       ]




puts "🌱🌱🌱 Seeding Finished! 🌱🌱🌱"