class MealPlanSerializer < ActiveModel::Serializer
  attributes :id,:title, :meal_plan_recipes, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :unassigned

def meal_plan_recipes
  #binding.pry
  object.meal_plan_recipes.map do |mpr|
    {
      mprid: mpr.id, 
      main_img: mpr.recipe.main_img, 
      id: mpr.recipe.id, 
      title: mpr.recipe.title
    }
  end
end

end

#   def recipes 
#   object.recipes.map do |recipe|
#     { 
#       title: recipe['title'],
#       main_img: recipe['main_img'],
#       id: recipe['id'],
#     }
#   end 
#  end 