class MealPlanSerializer < ActiveModel::Serializer
  attributes :id,:title, :meal_plan_recipes, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :unassigned, :user, :created_at

def user
 object.user.username
end 

def meal_plan_recipes
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